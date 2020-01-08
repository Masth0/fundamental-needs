#!/bin/bash

. functions.sh

res=$(asking_to_install "Install php-7.2?")
echo $res

if [[ $res ]]; then
  echo "Installing..."
  sudo apt install php7.2-curl php7.2-cli php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-bz2 php7.2-intl
  sudo apt install libapache2-mod-php7.2
else
  echo "NEXT"
fi
