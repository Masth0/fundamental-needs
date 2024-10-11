#!/bin/env bash

. functions.sh

prompt "Install Git?"
result=$?

if [ "$result" -eq 0 ]; then
  sudo apt-get install git -y

  clear
	read -r -p "$(echo -e "${BOLD}Enter the Global Username for Git: ${NC}")" GITUSER;
	git config --global user.name "${GITUSER}"

	read -r -p "$(echo -e "${BOLD}Enter the Global Email for Git: ${NC}")" GITEMAIL;
	git config --global user.email "${GITEMAIL}"

	echo "--------------------------"
	echo -e "Git config:"
	git config --list
	echo "--------------------------"
else
  exit 1
fi
