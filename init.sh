#!/bin/bash
ln -s ~/.vim ~/.config/nvim
ln -s ~/.config/nvim/init.vim ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall

npm i -g yarn neovim diagnostic-languageserver

# must install silversearcher-ag and fd-find separately
