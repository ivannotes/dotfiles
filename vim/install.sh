#!/bin/bash

# install command-t
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make

sudo pip install jedi
