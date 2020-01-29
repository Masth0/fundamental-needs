#!/bin/bash

. functions.sh

if asking_to_install "Install all apps?"; then

    sudo apt install snapd

    # VS Code
    sudo snap install code --classic

    # Jetbrains Phpstorm
    sudo snap install phpstorm --classic

    # Insomnia
    sudo snap install insomnia

    # Keepassxc
    sudo snap install keepassxc

    # Fish shell
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt-get update
    sudo apt-get install fish

    # Fisher package manager for Fish shell
    # curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    # Bass 
    # fisher add edc/bass

    # Gogh terminal theme
    bash -c  "$(wget -qO- https://git.io/vQgMr)" 
else
    echo "NEXT"
fi