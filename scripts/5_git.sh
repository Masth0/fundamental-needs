#!/bin/env bash

. functions.sh

if asking_to_install "Install Git?"; then

  sudo apt-get install git -y

	read -p "Enter the Global Username for Git:" GITUSER;
	git config --global user.name "${GITUSER}"

	read -p "Enter the Global Email for Git:" GITEMAIL;
	git config --global user.email "${GITEMAIL}"

	echo -e "${GREEN}Git has been configured!${NOCOLOR}"
	git config --list
fi
