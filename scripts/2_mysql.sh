#!/bin/env bash

. functions.sh

if asking_to_install "Install myslq?"; then
  # source: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
  sudo apt install mysql-server
  sudo mysql_secure_installation

  echo -e " ${BLUE}=================================================================="
  echo -e " 1) SELECT user,authentication_string,plugin,host FROM mysql.user;"
  echo -e " 2) ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
  echo -e " 3) FLUSH PRIVILEGES;"
  echo -e " 4) SELECT user,authentication_string,plugin,host FROM mysql.user;"
  echo -e " 5) exit"
  echo -e " ==================================================================${NOCOLOR}"

  sudo mysql
fi
