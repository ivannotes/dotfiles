" Author: Ivan Lee
" Created: 2012-10-26

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Mouse 
set mouse=a

" set leader
let mapleader = ","
let g:mapleader = ","

" Syntax highlighting
filetype on 
filetype plugin indent on
syntax on

" pyflakes not use quickfix window
" let g:pyflakes_use_quickfix = 0

" Colors and Fornts
set t_Co=256
"colorscheme codeschool
color wombat256mod
"try
"	colorscheme desert
"catch
"endtry

set background=dark

set encoding=utf8

" auto load vimrc file
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Showing line numbers and length
set number

" Don't use tab but spaces change tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" set auto load file when be edited by other program
set autoread

" search ignore character case
set ignorecase

" show status
set laststatus=2
" power line configure
"set guifont=PowerlineSymbols\ for\ Pwerline
"set nocompatible
"let g:Powerline_symbols = 'fancy'

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" easier moving of code block
vnoremap < <gv
vnoremap > >gv

" Setup Pathogen to manage vim plugins
call pathogen#infect()
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1

let g:pymode_lint_write = 0

let g:pymode_folding = 0

" auto complete settings
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" python ctags file
set tags=/Workspace/Vim/tags/python/tags

" taglist settings
let Tlist_Ctags_Cmd = "/Workspace/Bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window = 1
map <F4> :TlistToggle<CR>

" key map for NERDTree
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" code folding
set foldmethod=indent
set foldlevel=99

" rope configure
map <leader>j :RopeGotoDefinition<CR>

" Ack search
nmap <leader>a <Esc>:Ack!
