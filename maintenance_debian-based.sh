#!/bin/bash

system_update-clean() {
  echo
  echo "== Update and Clean System =="

  sudo nala update
  sudo nala upgrade -y
  sudo nala dist-upgrade -y

  read -p "Do you want to clean apt and autoremove unused packages? (Y/n): " user_answer
  user_answer=${user_answer:-y}

  sudo nala clean
  sudo nala autoremove --purge -y
}

remove_old-kernel() {
  echo
  echo "== Kernel List =="

  readarray -t kernel_list < <(ls /lib/modules)
  ls /lib/modules | awk '{print FNR". " $0}'
  read -p "Kernel to delete, separated by space (1 2): " -a user_answer

  for item in "${user_answer[@]}"; do
    removed_kernel+="linux-image-${kernel_list[$item - 1]} linux-base-${kernel_list[$item - 1]}"
  done

  sudo nala remove $removed_kernel --purge
}

update_distrobox-all() {
  echo
  echo "== Upgrading Distrobox Container =="

  distrobox-upgrade --all
}

home_clean-cache() {
  echo
  echo "== Cleaning Home Cache =="

  rm -rf ~/.cache/*
  echo "Home Cache Has Been Cleaned"
}

system_clean-log() {
  echo
  echo "== Cleaning System Log =="

  read -p "How many days of log you want to keep? (1d): " user_answer
  user_answer=${user_answer:-1d}

  sudo journalctl --vacuum-time=$user_answer
}

main_screen() {
  clear
  sudo -v
  clear
  echo "== DISK USAGE =="
  echo "Home Cache: $(sudo du -sh ~/.cache | egrep -o '[0-9.]+(\.[0-9]+)?M' || echo '0M')"
  echo "System Log (journalctl): $(sudo journalctl --disk-usage | egrep -o '[0-9.]+(\.[0-9]+)?M' || echo '0M')"
  echo
  echo "== Maintenance Choices =="
  echo "1. Update and Clean System"
  echo "2. Remove Kernel"
  echo "3. Upgrade All Distrobox (distrobox-upgrade)"
  echo "4. Clean Home Caches"
  echo "5. Clean System Log (journalctl log)"
  read -p "Maintainance to run, separated by space (1 2): " -a user_answer

  for item in "${user_answer[@]}"; do
    case "$item" in
    1) system_update-clean ;;
    2) remove_old-kernel ;;
    3) update_distrobox-all ;;
    4) home_clean-cache ;;
    5) system_clean-log ;;
    esac
  done
}

main_screen

