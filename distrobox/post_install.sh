#!/bin/bash

first_install="FALSE" # Change to TRUE before using it, change back to FALSE after use
# Not changing to TRUE will cause ERROR in init_hooks, just do 'distrobox assemble create --replace' after changing it to TRUE 
FLAVOR="${FLAVOR:-default}"

if [[ "$first_install" == "FALSE" || "$FLAVOR" == "default" ]]; then
  exit 1
fi

coding() {
  # Brave Origin
  curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin CHANNEL=nightly sh

  # VS Code
  sudo apt install wget gpg -y && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
  sudo tee /etc/apt/sources.list.d/vscode.sources <<'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
  sudo apt update && sudo apt install code -y
}

browser() {
  # Brave Origin
  curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin CHANNEL=nightly sh

  # Mullvad Browser
  sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
  echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$(dpkg --print-architecture)] https://repository.mullvad.net/deb/stable stable main" | sudo tee /etc/apt/sources.list.d/mullvad.list
  sudo apt update
  sudo apt install mullvad-browser -y
}

lazyvim() {
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}

  git clone https://github.com/LazyVim/starter ~/.config/nvim

  rm -rf ~/.config/nvim/.git
}

case "$FLAVOR" in
coding) coding ;;
browser) browser ;;
lazyvim) lazyvim ;;
esac
