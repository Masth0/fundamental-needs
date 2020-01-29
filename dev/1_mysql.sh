#!/bin/bash

. functions.sh

if asking_to_install "Install myslq?"; then
  echo "Installing..."
  # source: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
  sudo apt install mysql-server
  sudo mysql_secure_installation

  echo  "=================================================================="
  echo "1) SELECT user,authentication_string,plugin,host FROM mysql.user;"
  echo "2) ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
  echo "3) FLUSH PRIVILEGES;"
  echo "4) SELECT user,authentication_string,plugin,host FROM mysql.user;"
  echo "5) exit"
  echo  "=================================================================="

  sudo mysql
else
  echo "NEXT"
fi
