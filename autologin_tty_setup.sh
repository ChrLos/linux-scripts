#!/bin/bash

sudo nala install mingetty
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d

read -p "What is the username that you want to autologin?: " username
sudo bash -c "cat >/etc/systemd/system/getty@tty1.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/mingetty --autologin $username --noclear tty1
EOF"

sudo systemctl enable getty@tty1.service

