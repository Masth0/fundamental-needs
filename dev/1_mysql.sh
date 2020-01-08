#!/bin/bash

. functions.sh

res=$(asking_to_install "Install myslq?")
echo $res

if [[ $res ]]; then
  echo "Installing..."
  # source: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
  sudo apt install mysql-server
  sudo mysql_secure_installation

  echo  "=================================================================="
  echo "1) SELECT user,authentication_string,plugin,host FROM mysql.user;"
  echo "2) FLUSH PRIVILEGES;"
  echo "3) SELECT user,authentication_string,plugin,host FROM mysql.user;"
  echo "4) exit"
  echo  "=================================================================="

  sudo mysql
else
  echo "NEXT"
fi
