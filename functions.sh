#!/bin/env bash

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

asking_to_install() {
  while true; do
    read -r -p "$1 [y/N]" input

    case $input in
    [yY][eE][sS] | [yY])
      return 0
      ;;
    [nN][oO] | [nN])
      echo -e "${ORANGE}Installation skipped${NOCOLOR}"
      return 1
      ;;
    *)
      echo -e "${ORANGE}Installation skipped${NOCOLOR}"
      return 1
      ;;
    esac
  done
}

export -f asking_to_install
