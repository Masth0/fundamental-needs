#!/bin/env bash

. functions.sh

prompt "Install Git?"
result=$?

if [ "$result" -eq 0 ]; then

  sudo apt-get install git -y

	read -r -p "Enter the Global Username for Git: " GITUSER;
	git config --global user.name "${GITUSER}"

	read -r -p "Enter the Global Email for Git: " GITEMAIL;
	git config --global user.email "${GITEMAIL}"

	echo ""
	echo -e "${GREEN}Git has been configured!"
	echo -e "Git config: "
	git config --list
	echo -e "${NC}"

else
  exit 1
fi
