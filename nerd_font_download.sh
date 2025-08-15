#!/bin/bash

fetched_fonts=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep '"name":.*.tar.xz' | cut -d : -f 2 | cut -d . -f 1 | tr -d \")
# Convert to an Array
font_list=($fetched_fonts)

for font in "${!font_list[@]}"; do
  numberList=$(($font + 1))
  echo "$numberList. ${font_list[$font]}"
done | pr -t -w 150 -5
# personal note: pr is a command to split a string into multiple columns

read -p "Which Font Number You Want to Download?: " selected_font
downloaded_font=${font_list[$selected_font - 1]}

curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep "$downloaded_font.tar.xz" | cut -d : -f 2,3 | tr -d \" | wget -i - -O /tmp/$downloaded_font$.tar.xz
sudo mkdir -p /usr/local/share/fonts/$downloaded_font/
sudo tar -xvf /tmp/$downloaded_font$.tar.xz -C /usr/local/share/fonts/$downloaded_font/
sudo fc-cache -f
