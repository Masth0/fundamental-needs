#!/bin/env bash

. functions.sh

directory="${BASH_SOURCE[0]%/*}/scripts"
PS3=$'\e[1;mPlease choose one of the following options: \e[m'
declare -A files
files_keys=()

for file in "$directory"/*.sh; do
  if [ -f "$file" ]; then
    fileName="${file##*/}"
    key="${fileName%.sh}"
    files["${key^}"]="$file"
    files_keys+=("${key^}")
  fi
done

files_keys+=('Quit (or press q)')

main() {
  COLUMNS=1 # Force select menu in one column
  while [ "${#files[@]}" -gt 0 ]; do
    select choice in "${files_keys[@]}"; do
      # Choose the choice 'Quit' or press 'q'
      if [[ "$choice" = "Quit" || $REPLY = "q" ]]; then
        exit 1
      fi

      if [ -n "${files[$choice]}" ]; then
        chmod +x "${files[$choice]}"
        eval "${files[$choice]}"
        result=$?

        if [ "$result" == "0" ]; then
          unset "files[$choice]"
        fi

        echo ""
        break
      fi

    done
  done
}

main
