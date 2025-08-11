#!/bin/bash

curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep "JetBrainsMono.tar.xz" | cut -d : -f 2,3 | tr -d \" | wget -i - -O /tmp/NerdJetBrains.tar.xz
mkdir -p /usr/local/share/fonts/NerdJetBrains/ 
tar -xvf /tmp/NerdJetBrains.tar.xz -C /usr/local/share/fonts/NerdJetBrains/ 
