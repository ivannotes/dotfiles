#!/bin/bash

# install command-t
#cd ~/.vim/bundle/command-t/ruby/command-t
#ruby extconf.rb
#make

sudo pip install jedi

go get -v code.google.com/p/rog-go/exp/cmd/godef
go install -v code.google.com/p/rog-go/exp/cmd/godef
go get -u github.com/nsf/gocode
go get -u github.com/jstemmer/gotags

sh $GOPATH/src/github.com/nsf/gocode/vim/pathogen_update.sh
