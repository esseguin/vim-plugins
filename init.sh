#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd bundle/YouCompleteMe
./install.sh
cd ../..

cd bundle/command-t/ruby/command-t/
ruby extconf.rb
make
cd ../../../..

#git submodule init && git submodule update && git submodule foreach git pull origin master
