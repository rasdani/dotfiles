#!/bin/sh

### install packages, if not present
sudo apt update
if ! command -v tmux &> /dev/null
then
    sudo apt install -y tmux
    echo "INSTALLED TMUX"
fi
if ! command -v nvim &> /dev/null
then
    sudo apt install -y neovim
    echo "INSTALLED NEOVIM"
fi
if ! command -v fasd &> /dev/null
then
    sudo apt install -y fasd
    echo "INSTALLED FASD"
fi

if ! command -v pip &> /dev/null
then
    sudo apt install python3-pip
    echo "INSTALLED PIP"
fi
if ! command -v tldr &> /dev/null
then
    pip install tldr
    echo "INSTALLED TLDR"
fi
if ! command -v zsh &> /dev/null
then
    sudo apt install -y zsh
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

### don't touch picky .zshrc
echo source $HOME/.oh-my-zsh/custom/custom_zshrc.zsh >> $HOME/.zshrc

chsh -s $(which zsh)
echo "CHANGED DEFAULT SHELL TO ZSH"
echo "SETUP DONE"
