#!/bin/env bash

. functions.sh

if asking_to_install "Install Composer?"; then

  echo "Installing..."
  sudo apt install wget curl unzip
	cd ~
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
	php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
else
  echo "NEXT"
fi
