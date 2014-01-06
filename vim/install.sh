#!/bin/bash

# install command-t
#cd ~/.vim/bundle/command-t/ruby/command-t
#ruby extconf.rb
#make

sudo pip install jedi

go get -v code.google.com/p/rog-go/exp/cmd/godef
go install -v code.google.com/p/rog-go/exp/cmd/godef
