#!/bin/bash


## Installation
install() {
	sudo apt-get update -y

	## Git ##
	echo '###Installing Git..'
	sudo apt-get install git -y

	# Git Configuration
	echo '###Congigure Git..'

	echo "Enter the Global Username for Git:";
	read GITUSER;
	git config --global user.name "${GITUSER}"

	echo "Enter the Global Email for Git:";
	read GITEMAIL;
	git config --global user.email "${GITEMAIL}"

	echo 'Git has been configured!'
	git config --list

	## Apache
	sudo apt install apache2

	## MySQL
	sudo apt install mysql-server

	## Php modules
	sudo apt install php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml

	## Composer
	sudo apt install wget curl unzip
	cd ~
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
	php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

	## PhpStorm
	sudo snap install phpstorm --classic

	## Sublime Text
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
}

## Prompt user
echo "
Paquets :
 - GIT
 - Apache
 - MySQL
 - PHP modules (php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml)
 - Composer (dependances: wget curl unzip)
 - PhpStorm
 - Sublime Text
"

while true; do
    read -p "Installation des paquets précédents ? (y/n)" yn
    case $yn in
        [Yy]* ) install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
