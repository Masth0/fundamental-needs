#!/bin/env bash

. functions.sh

# URL du dépôt GitHub de NVM
NVM_REPO_URL="https://github.com/nvm-sh/nvm"

# Utiliser curl pour récupérer la dernière version de NVM
LATEST_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Vérifier si la récupération de la version a réussi
if [ -z "$LATEST_VERSION" ]; then
  echo "Impossible de récupérer la dernière version de NVM."
  exit 1
fi

prompt "Install NVM?"
result=$?

if [ "$result" -eq 0 ]; then
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_VERSION/install.sh" | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
else
  exit 1
fi
