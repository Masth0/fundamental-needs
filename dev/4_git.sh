#!/bin/bash

. functions.sh

if asking_to_install "Install Git?"; then

  echo "Installing..."
  sudo apt-get install git -y

	echo "Enter the Global Username for Git:";
	read GITUSER;
	git config --global user.name "${GITUSER}"

	echo "Enter the Global Email for Git:";
	read GITEMAIL;
	git config --global user.email "${GITEMAIL}"

	echo 'Git has been configured!'
	git config --list

	sudo apt-get install xclip -y

  echo "GitHub email address:";
  read GITEMAIL;
  ssh-keygen -t rsa -b 4096 -C "${GITEMAIL}"

  echo "Eval ssh-agent"
  eval "$(ssh-agent -s)"

  echo "Add SSH private key to the ssh-agent."
  ssh-add ~/.ssh/id_rsa

  echo "--------------------------"
  echo "Copy the SSH key to your clipboard."
  xclip -sel clip < ~/.ssh/id_rsa.pub

  echo "====================================================="
  echo "Go to your Github account and add your new SSH Key."
  echo "====================================================="

else
  echo "NEXT"
fi
