#!/bin/bash
ln -s ~/.vim ~/.config/nvim
ln -s ~/.config/nvim/init.vim ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
