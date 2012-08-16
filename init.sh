#!/bin/bash

git submodule init && git submodule update && git submodule foreach git pull origin master
cd bundle/command-t/ruby/command-t/
ruby extconf.rb
make
