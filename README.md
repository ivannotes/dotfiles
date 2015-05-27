=========
Dot files
=========

My dot files for vim and git

VIM
========

Installation

I like tools which can be opened in terminal, so install vim from source is the perfect way for me, and it's also the reason why I don't use MacVim.
The following command is what I used to install my copy of vim::

get a copy of source code from https://vim.googlecode.com/hg/
$> ./configure --prefix={dir_to_install} --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope
$> make
$> make install

Plugins for vim:
Text Search: Ag
File Search: ctrp
File Navigation: NerdTree, minbuff
Code Exploring: ropevim, tlib, tagbar
Code Completion: ropevim
Status Line: ariline
Code Snippets: vim-snippets
YAML: vim-yaml
