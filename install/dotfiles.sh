#!/bin/bash
#
# Install Zsh and set as default shell
# Install dotfiles and configure git

source ./install/utils.sh
keep_sudo_alive

# Install Zsh:
sudo apt -y install zsh

# Install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install some external plugins:
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# Set Zsh as your default shell:
chsh -s /bin/zsh

# Move/replace setting files to /Home
replace ".gitconfig"        ".gitconfig"
replace ".dircolors"        ".dircolors"
replace ".gitignore_global" ".gitignore_global"
replace ".bashrc"           ".bashrc"
replace ".profile"          ".profile"
replace ".bash_logout"      ".bash_logout"
replace ".zshrc"            ".zshrc"
replace ".zsh_aliases"      ".zsh_aliases"
replace ".p10k.zsh"         ".p10k.zsh"
replace ".shell_prompt.sh"  ".shell_prompt.sh"
replace "packages"          "packages"
# Git configs
e_header "Configure your Git settings: "
nano ${HOME}/.gitconfig

# Finish
e_success "Dotfiles update complete."
