#!/bin/sh

sudo apt update
sudo apt install tmux
echo "installed tmux"
sudo apt install neovim
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
sudo apt install zsh
exit
chsh -s $(which zsh)
echo "installed zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "installed oh-my-zsh"

