#!/bin/sh

# Function to execute apt-get install
install_package() {
    if [ "$(uname)" = "Darwin" ]; then
        brew install "$1"
    else
        if [ "$(id -u)" -eq 0 ]; then
            apt-get install -y "$1"
        else
            sudo apt-get install -y "$1"
        fi
    fi
}

### update package lists, if not present
if [ "$(uname)" = "Darwin" ]; then
    brew update
else
    if [ "$(id -u)" -eq 0 ]; then
        apt-get update
    else
        sudo apt-get update
    fi
fi

if ! command -v tmux &> /dev/null
then
    install_package tmux
    echo "INSTALLED TMUX"
fi

if ! command -v nvim &> /dev/null
then
    install_package neovim
    echo "INSTALLED NEOVIM"
fi

if ! command -v zoxide &> /dev/null
then
    install_package zoxide
    echo "INSTALLED ZOXIDE"
fi

if ! command -v pip &> /dev/null
then
    install_package python3-pip
    echo "INSTALLED PIP"
fi

if ! command -v tldr &> /dev/null
then
        pip install tldr
    echo "INSTALLED TLDR"
fi

if ! command -v zsh &> /dev/null
then
    install_package zsh
    echo "INSTALLED ZSH"
fi

### zsh plugins
if ! [ -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "INSTALLED OH-MY-ZSH"
fi

if ! [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "INSTALLED ZSH-AUTOSUGGESTIONS"
fi


if [ "$(id -u)" -eq 0 ]; then
    chsh -s $(which zsh)
else
    sudo chsh -s $(which zsh)
fi
echo "CHANGED DEFAULT SHELL TO ZSH"
echo "SETUP DONE"
