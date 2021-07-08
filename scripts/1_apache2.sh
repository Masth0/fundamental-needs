#!/bin/env bash

. functions.sh

if asking_to_install "Install apache2?"; then
  sudo apt install apache2
  sudo a2enmod vhost_alias
  sudo a2enmod rewrite
  sudo apt install libapache2-mod-fcgid
  sudo systemctl restart apache2

  if asking_to_install "Copy ./vhosts/*.conf to /etc/apache2/sites-available?"; then
    echo -e "${BLUE}----- Copying vhosts ----- \n${NOCOLOR}"
    sudo cp vhosts/*.conf /etc/apache2/sites-available
    echo -e "${GREEN}Vhosts copied ----- \n${NOCOLOR}"
  fi
fi
