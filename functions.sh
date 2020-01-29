#!/bin/bash

asking_to_install() {
    while true
    do
        read -r -p "$1 [Y/n] " input
    
        case $input in
            [yY][eE][sS]|[yY])
        echo "Yes"
        return 0
        ;;
            [nN][oO]|[nN])
        echo "No"
        return 1
                ;;
            *)
        echo "Invalid input..."
        ;;
        esac
    done
}

export -f asking_to_install
