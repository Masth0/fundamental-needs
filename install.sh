#!/bin/env bash

files=()
for d in *; do
    if [ -d "$d" ]; then
        # Will not run if no directories are available
        for f2 in $(ls "$d"); do
            # The file must be a '.sh' file
            if [[ $f2 =~ \.sh$ ]]; then
                files+=("./${d}/${f2}")
            fi
        done
    fi
done

str=""
for ((i = 0 ; i < ${#files[@]} ; i++)); do
  if [[ $i < $((${#files[@]} - 1)) ]]; then
    str+="bash ${files[$i]} && "
  else
    str+="bash ${files[$i]}"
  fi
done

eval "$str"
