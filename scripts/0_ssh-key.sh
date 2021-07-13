#!/bin/env bash

. functions.sh

KEYS=$(ls -la ~/.ssh)

if asking_to_install "Create new ssh key?"; then
  SSH_FILENAME_DEFAULT=/home/.ssh/$(whoami)/id_rsa
  echo -e "${BLUE}Your ssh keys:${NOCOLOR}"
  echo -e "${BLUE}${KEYS}${NOCOLOR}"

  read -p "Email for ssh?" SSH_EMAIL
  read -p "Enter file in which to save the key (${SSH_FILENAME_DEFAULT}):" SSH_FILENAME
  SSH_FILENAME=${SSH_FILENAME:-SSH_FILENAME_DEFAULT}
  ssh-keygen -t rsa -C "${SSH_EMAIL}" -f "${SSH_FILENAME}"
  # Start ssh-agent
  eval "$(ssh-agent -s)"
  # Add the key to the ssh-agent
  ssh-add ${SSH_FILENAME}
  echo -e "${GREEN}SSH key added to ssh-agent${NOCOLOR}"
else
  if [ ${#KEYS[@]} > 0 ]; then
    for key in ${KEYS}; do
      if [[ $key =~ \.pub$ ]]; then
        SSH_KEY="~/.ssh/${key}"
        break
      fi
    done
  fi
fi