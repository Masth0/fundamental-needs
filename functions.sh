#!/bin/env bash

# ----------------------------------
# Colors
# ----------------------------------
NC='\e[0m'
RED='\e[0;31m'
GREEN='\e[0;32m'
ORANGE='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
CYAN='\e[1;36m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
LIGHTGREEN='\e[1;32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
LIGHTPURPLE='\e[1;35m'
LIGHTCYAN='\e[1;36m'
WHITE='\e[1;37m'

YN_COLOR="\033[1;106;37m"
PROMPT_COLOR="\033[1;106;37m"

prompt() {
  while true; do
    prompt=$(echo -e "${CYAN}$1 [y/N] ${NC}")
    read -r -p "$prompt" input

    case $input in
    [yY][eE][sS] | [yY])
      return 0
      ;;
    [nN][oO] | [nN])
      echo -e "${YELLOW}Cancelled${NC}"
      return 1
      ;;
    *)
      echo -e "${YELLOW}Cancelled${NC}"
      return 1
      ;;
    esac
  done
}

export -f prompt
