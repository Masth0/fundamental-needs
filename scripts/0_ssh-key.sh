#!/bin/env bash

. functions.sh

KEYS=$(ls -la ~/.ssh)

if [ ${#KEYS[@]} > 0 ]; then
  for key in ${KEYS}; do
    if [[ $key =~ \.pub$ ]]; then
      SSH_KEY="~/.ssh/${key}"
      echo -e "${BLUE}Use ${GREEN}${SSH_KEY}${NOCOLOR}"
      break
    fi
  done
fi

if asking_to_install "Create new ssh key?"; then
  echo "File name:"
  read FILE_NAME
  ssh-keygen -t rsa -b 4096 -C "${FILE_NAME}"
  # Start ssh-agent
  eval "$(ssh-agent -s)"
  # Add the key to the ssh-agent
  ssh-add "~/.ssh/${FILE_NAME}"
  echo -e "${GREEN}SSH key added to ssh-agent${NOCOLOR}"
fi

if asking_to_install "Copy ssh key to clipboard? (install xclip)"; then
    sudo apt-get install xclip -y
    xclip -sel clip < "~/.ssh/${FILE_NAME}.pub"
    echo -e "${GREEN}SSH key added to your clipboard${NOCOLOR}"
fi