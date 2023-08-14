#!/bin/sh

sudo apt update
sudo apt install -y tmux
echo "installed tmux"
sudo apt install -y neovim
sudo apt install -y fasd
echo "installed neovim"

if command -v pip &> /dev/null
then
    echo "pip is installed"
else
    echo "pip is not installed"
    # Install pip using apt
    sudo apt install python3-pip
fi
pip install tldr
sudo apt install -y zsh
echo "installed zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "installed oh-my-zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "installed zsh-autosuggestions"
echo source $HOME/.oh-my-zsh/custom/custom_zshrc.zsh >> $HOME/.zshrc
