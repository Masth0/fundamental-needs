#!/bin/env bash

. functions.sh

if asking_to_install "Install apache2?"; then
  echo "Installing..."

  sudo apt install apache2
  sudo a2enmod vhost_alias
  sudo a2enmod rewrite

  sudo systemctl restart apache2

  echo "----- Copying vhosts ----- \n"
  cp vhosts/*.conf /etc/apache2/sites-available
  echo "----- Vhosts copied at /etc/apache2/sites-available ----- \n"

else
  echo "NEXT"
fi
