#!/bin/sh
sudo pacman -Syy && pacman -S --noconfirm vim git python2 lua cscope ctags
# fetch .vim folder
git clone --depth 1 https://github.com/ghostylee/dotVim.git ~/.vim
ln -sfn ~/.vim/vimrc ~/.vimrc
mkdir ~/.fonts && cp -rf ~/.vim/fonts/* ~/.fonts
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

