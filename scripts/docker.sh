#!/bin/env bash

. functions.sh

prompt "Install Docker?"
result=$?

if [ "$result" -eq 0 ]; then

    if prompt "Remove old docker's packages? (docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc)"; then
        for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
            sudo apt-get remove $pkg;
        done

        if prompt "Delete all images, containers, and volumes ? (/var/lib/docker, /var/lib/containerd)"; then
            sudo rm -rf /var/lib/docker
            sudo rm -rf /var/lib/containerd
            echo "Images, containers and volumes removed."
        fi
    fi

    echo ""
    echo -e "${ORANGE}[!] If you use an Ubuntu derivative distro, such as Linux Mint, you may need to use UBUNTU_CODENAME instead of VERSION_CODENAME. ${NC}"
    echo ""
    echo -e "${BLUE}Set up Docker's apt repository.${NC}"
    echo ""

    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    echo -e "${BLUE}Install Docker${NC}"
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    if prompt "Run docker without sudo?";then
        sudo groupadd docker
        sudo usermod -aG docker "$(whoami)"
        echo "${BLUE}[i] Log out and log back in so that your group membership is re-evaluated.${NC}"
    fi

else
  exit 1
fi
