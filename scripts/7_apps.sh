#!/bin/env bash

. functions.sh


echo -e "${ORANGE}/!\ Install apps via snapd${NOCOLOR}"
if asking_to_install "Install all apps? "; then
  if asking_to_install "On Linux Mint 20, /etc/apt/preferences.d/nosnap.pref needs to be removed before Snap can be installed"; then
    sudo rm /etc/apt/preferences.d/nosnap.pref
    sudo apt update
  fi

  if asking_to_install "Install snapd?"; then
    sudo apt install snapd

    if asking_to_install "Install vscode?"; then
      sudo snap install code --classic
    fi

    if asking_to_install "Install insomnia?"; then
      sudo snap install insomnia
    fi
  fi
fi

if asking_to_install "Install flameshot? "; then
  sudo apt install flameshot
fi

if asking_to_install "Install peek? "; then
  sudo add-apt-repository ppa:peek-developers/stable
  sudo apt update
  sudo apt install peek
fi

if asking_to_install "Install fish shell? "; then
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update
  sudo apt install fish

  if asking_to_install "Make nvm compatible with fish?"; then
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install edc/bass

    # ~/.config/fish/functions/nvm.fish
    cat <<EOT >> ~/.config/fish/functions/nvm.fish
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
EOT
  fi
fi