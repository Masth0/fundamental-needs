#!/bin/bash

sudo apt-get install xclip -y

echo "--------------------------"
echo "GitHub email address:";
read GITEMAIL;
ssh-keygen -t rsa -b 4096 -C "${GITEMAIL}"

echo "--------------------------"
echo "Eval ssh-agent"
eval "$(ssh-agent -s)"

echo "Add SSH private key to the ssh-agent."
ssh-add ~/.ssh/id_rsa

echo "--------------------------"
echo "Copy the SSH key to your clipboard."
xclip -sel clip < ~/.ssh/id_rsa.pub

echo "Go to your Github account and add your new SSH Key."
exit