#!/bin/bash
# Install Script

# Install Brave-Browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
echo "Brave installed."


# Uninstall Firefox
read -p "Remove Firefox?" yn
case $yn in
    [Yy]* ) sudo apt remove firefox; echo "Firefox uninstalled.";;
    [Nn]* ) echo "Firefox not removed.";;
    * ) echo "Firefox not removed.";;
esac


# Install htop
sudo apt install htop


# Install git
sudo apt-get install git

