#!/bin/bash

#------------------------------------------------------------------------------
# check for updates and upgrade if necessary
#------------------------------------------------------------------------------
sudo apt upate
sudo apt upgrade -y

#------------------------------------------------------------------------------
# create symbolic link for dot/config files
#------------------------------------------------------------------------------
DOT_DIR="/home/ryu/Coding/dotfiles"
git clone https://github.com/chokoryu/dotfiles.git ${DOT_DIR}

#------------------------------------------------------------------------------
# install and setup vim
#------------------------------------------------------------------------------
sudo apt install vim
ln -sf ${DOT_DIR}/vim/.vimrc ~/.vimrc
mkdir ~/.vim/undo

#------------------------------------------------------------------------------
# install and setup tmux
#------------------------------------------------------------------------------
sudo apt install tmux
ln -sf ${DOT_DIR}/tmux/.tmux.conf ~/.tmux.conf

#------------------------------------------------------------------------------
# install and setup Python tools
#------------------------------------------------------------------------------
pip3 install flake8
pip3 install pytest
