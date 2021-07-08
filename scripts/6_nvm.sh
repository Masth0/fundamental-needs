#!/bin/env bash

. functions.sh

echo -e "${ORANGE}/!\ Before installing nvm: The installer can use git, curl, or wget to download nvm, whichever is available.${NOCOLOR}"
if asking_to_install "Install nvm? "; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi