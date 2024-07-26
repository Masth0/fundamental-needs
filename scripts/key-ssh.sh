#!/bin/env bash

. functions.sh

prompt "Install a new ssh key?"
result=$?

if [ "$result" -eq 0 ]; then

  KEYS=$(ls -la ~/.ssh)
  SSH_FILENAME_DEFAULT=/home/$(whoami)/.ssh/id_ed25519
  echo -e "${BLUE}Your ssh keys:${NC}"
  echo -e "${BLUE}${KEYS}${NC}"

  read -r -p "Email for ssh? " SSH_EMAIL
  read -r -p "Enter file in which to save the key (${SSH_FILENAME_DEFAULT}): " SSH_FILENAME
  SSH_FILENAME=${SSH_FILENAME:-$SSH_FILENAME_DEFAULT}

  ssh-keygen -t ed25519 -C "$SSH_EMAIL" -f "$SSH_FILENAME"
  # Start ssh-agent
  eval "$(ssh-agent -s)"
  # Add the key to the ssh-agent
  ssh-add "${SSH_FILENAME}"
  echo -e "${GREEN}SSH key added to ssh-agent${NC}"

else
  exit 1
fi
