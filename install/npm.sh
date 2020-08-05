#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./install/utils.sh
keep_sudo_alive

var="nodejs"
e_header "Verifying that $var is installed..."
if which node &> /dev/null; then
  e_success "$var is installed"
  else
  e_warning "Installing $var..."
  sudo apt -y install $var npm
fi

# Packages
sudo yarn global add create-react-app
sudo yarn global add create-next-app
sudo yarn global add create-react-native-app
sudo yarn global add eslint
sudo yarn global add gulp-cli
sudo yarn global add sass
sudo yarn global add typescript
sudo yarn global add tslint

# Finish
e_success "Finished npm packages settings."
