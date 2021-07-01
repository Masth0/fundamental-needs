#!/usr/bin/env bash

. functions.sh

php_versions=('7.2' '7.4' '8.0')

if asking_to_install "Install ${php_versions[@]}?"; then

  wget https://get.symfony.com/cli/installer -O - | bash
  sudo apt install software-properties-common
  sudo add-apt-repository ppa:ondrej/php
  sudo apt update

  for version in "${php_versions[@]}" ; do
    echo install php"${version}"
    sudo apt install php"${version}"-curl
    sudo apt install php"${version}"-cli
    sudo apt install php"${version}"-gd
    sudo apt install php"${version}"-mbstring
    sudo apt install php"${version}"-zip
    sudo apt install php"${version}"-mysql
    sudo apt install php"${version}"-xml
    sudo apt install php"${version}"-bz2
    sudo apt install php"${version}"-intl
    sudo apt install php"${version}"-fpm
    sudo systemctl restart php${version}-fpm
  done

  sudo a2enmod actions fcgid alias proxy_fcgi

else
  echo "NEXT"
fi