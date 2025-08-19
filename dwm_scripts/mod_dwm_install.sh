#!/bin/bash

dwmflexipatch_path="/tmp/dwm-flexipatch"
patches_location="./patches"

sudo apt install nala -y
sudo nala install xorg dmenu thunar alacritty pulseaudio alsamixergui lynx rofi -y

./set_max_volume.sh

# Required Packages to Compile dwm-flexipatch
sudo nala install git make gcc libx11-dev libxft-dev libxinerama-dev -y
git clone https://github.com/bakkeby/dwm-flexipatch.git $dwmflexipatch_path

# Deleting compiling packages
read -p "Do you want to delete packages used for compiling dwm to save space? [y/n]: " user_prompt
echo "(git won't be deleted cause probly gonna be used a lot)"

if [ "$user_prompt" == "y" ]; then
  sudo nala remove make gcc libx11-dev libxft-dev libxinerama-dev -y
fi

# Apply Patches
sudo cp $patches_location/patches.h $dwmflexipatch_path/patches.h
sudo cp $patches_location/config.h $dwmflexipatch_path/config.h

# Run dwm session when executing 'startx'
echo "exec dwm" >~/.xsession
echo "exec dwm" >~/.xinitrc #Fallback incase .xsession doesn't work

echo "startx" >~/.bash_login

# Start Compiling
cd $dwmflexipatch_path
sudo make clean install
