#!/bin/env bash

. functions.sh

if asking_to_install "Install Git?"; then

  echo -e "${BLUE}Installing...${NOCOLOR}"
#  sudo apt-get install git -y

	echo -e "${BLUE}Enter the Global Username for Git:${NOCOLOR}"
#	read GITUSER;
#	git config --global user.name "${GITUSER}"

	echo -e "${BLUE}Enter the Global Email for Git:${NOCOLOR}"
#	read GITEMAIL;
#	git config --global user.email "${GITEMAIL}"

	echo -e "${BLUE}Git has been configured!${NOCOLOR}"
#	git config --list

  echo -e "${BLUE}GitHub email address:${NOCOLOR}"
#  read GITEMAIL;
fi
