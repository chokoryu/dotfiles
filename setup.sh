#!/bin/bash

#------------------------------------------------------------------------------
# check for updates and upgrade if necessary
#------------------------------------------------------------------------------
sudo apt upate
sudo apt upgrade -y
sudo apt install -y unzip

#------------------------------------------------------------------------------
# create symbolic link for dot/config files
#------------------------------------------------------------------------------
DOT_DIR="$HOME/dotfiles"

#------------------------------------------------------------------------------
# install dein
#------------------------------------------------------------------------------
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache
rm ~/installer.sh

#------------------------------------------------------------------------------
# install and setup vim
#------------------------------------------------------------------------------
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/dein
mkdir -p ~/.vim/undo
sudo apt install -y vim
ln -sf ${DOT_DIR}/vim/vimrc/.vimrc ~/.vimrc
ln -sf ${DOT_DIR}/vim/dein/dein.toml ~/.vim/dein/dein.toml
ln -sf ${DOT_DIR}/vim/dein/dein_lazy.toml ~/.vim/dein/dein_lazy.toml

# install nord colourscheme and copy into .vim/color
wget https://github.com/arcticicestudio/nord-vim/archive/refs/heads/main.zip
unzip main.zip
cp nord-vim-main/colors/nord.vim ~/.vim/colors/nord.vim
rm -rf main.zip nord-vim-main/

#------------------------------------------------------------------------------
# install and setup tmux
#------------------------------------------------------------------------------
sudo apt install tmux
git clone https://github.com/arcticicestudio/nord-tmux.git ~/.tmux/themes/nord-tmux
ln -sf ${DOT_DIR}/tmux/.tmux.conf ~/.tmux.conf

#------------------------------------------------------------------------------
# install and setup fish
#------------------------------------------------------------------------------
sudo apt install fish

# change default shell to fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

mkdir -p ~/.config/fish/functions

# install fisher, the plug-in manager
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# create symbolic links for config files
ln -sf ${DOT_DIR}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${DOT_DIR}/fish/functions/fish_propt.fish ~/.config/fish/functions/fish_prompt.fish
