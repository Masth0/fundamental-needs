#!/bin/env bash

. functions.sh

prompt "Install PHP?"
result=$?

if [ "$result" -eq 0 ]; then
  sudo apt install apache2
  sudo a2enmod vhost_alias
  sudo a2enmod rewrite
  sudo apt install libapache2-mod-fcgid
  sudo systemctl restart apache2
fi
