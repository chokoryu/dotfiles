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
# install dein
#------------------------------------------------------------------------------
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache

#------------------------------------------------------------------------------
# install and setup vim
#------------------------------------------------------------------------------
mkdir -p ~/.vim/rc
mkdir ~/.vim/undo
sudo apt install vim
ln -sf ${DOT_DIR}/vim/.vimrc ~/.vimrc
ln -sf ${DOT_DIR}/vim/rc/dein.toml ~/.vim/rc/dein.toml
ln -sf ${DOT_DIR}/vim/rc/dein_lazy.toml ~/.vim/rc/dein_lazy.toml

#------------------------------------------------------------------------------
# install and setup tmux
#------------------------------------------------------------------------------
sudo apt install tmux
git clone https://github.com/arcticicestudio/nord-tmux.git ~/.tmux/themes/nord-tmux
ln -sf ${DOT_DIR}/tmux/.tmux.conf ~/.tmux.conf

#------------------------------------------------------------------------------
# install and setup fish
#------------------------------------------------------------------------------
mkdir -p ~/.config/fish/functions


#------------------------------------------------------------------------------
# install and setup Python tools
#------------------------------------------------------------------------------
pip3 install flake8
pip3 install pytest
