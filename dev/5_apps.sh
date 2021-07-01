#!/bin/env bash

. functions.sh

if asking_to_install "Install all apps?"; then

    # VS Code
    sudo snap install code --classic

    # Insomnia
    sudo snap install insomnia

    # Fish shell
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt-get update
    sudo apt-get install fish

else
    echo "NEXT"
fi