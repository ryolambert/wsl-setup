#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh
keep_sudo_alive

# Update Ubuntu
sudo apt update
sudo apt upgrade -y

# Essential package
sudo apt -y install build-essential

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt -y update
sudo apt -y install git

# Nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs npm

# Nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -y update && sudo apt -y install yarn

# Install xvfb gui libraries for Cypress test libraries
apt-get install libgtk2.0-0 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

# Ubuntu WSL
# Check out https://github.com/wslutilities/wslufor more details
sudo apt install ubuntu-wsl

# Install dependency list
sudo dpkg --set-selections < packages \
sudo apt-get dselect-upgrade

# Finish
e_success "Finished applications installation."