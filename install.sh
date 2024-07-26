#!/bin/env bash


directory="${BASH_SOURCE[0]%/*}/scripts"
PS3=$'\e[1;36mWhat do you would like to install? \e[0m'
declare -A files

for file in "$directory"/*.sh; do
  if [ -f "$file" ]; then
    fileName="${file##*/}"
    key="${fileName%.sh}"
    files["${key^}"]="$file"
  fi
done

main() {
  while [ "${#files[@]}" -gt 0 ]; do
    select choice in "${!files[@]}"; do

      if [ -n "${files[$choice]}" ]; then
        chmod +x "${files[$choice]}"
        eval "${files[$choice]}"
        result=$?

        if [ "$result" == "0" ]; then
          unset 'files[$choice]'
        fi

        echo ""
        break
      fi

    done
  done
}

main
