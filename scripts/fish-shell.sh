#!/bin/env bash

. functions.sh

prompt "Install Fish shell?"
result=$?

if [ "$result" -eq 0 ]; then
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update
  sudo apt install fish

  # Open the fish configuration in the browser
  if prompt "Start the web-based configuration interface?"; then
    fish -c "fish_config browse"
  fi

  # Define Fish shell by default
  if asking_to_install "Set Fish shell as default shell?"; then
    echo /usr/local/bin/fish | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
  fi

else
  exit 1
fi
