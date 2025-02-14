#!/bin/env bash

. functions.sh

prompt "Install PHP?"
result=$?

if [ "$result" -eq 0 ]; then
  read -r -p "Which version of php-fpm do you want to install? (${PHP_VERSIONS[@]}) " -a php_versions
  echo  "${php_versions[@]}"
  # TODO

  # Composer
  if prompt "Install Composer?"; then
    sudo apt install wget curl unzip
    cd ~
    curl -sS https://getcomposer.org/installer -o composer-setup.php
    HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  fi

  # Symfony cli
  if prompt "Install Symfony cli?"; then
    curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
    sudo apt install symfony-cli
  fi
else
  exit 1
fi
