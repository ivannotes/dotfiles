" Author: Ivan Lee
" Created: 2012-10-26
" 
" Belows are how I build vim from source 
" ./configure --prefix=dir_to_install --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope
" make
" make install

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" Mouse 
set mouse=a

set clipboard=unnamed

set guifont=Courier\ New:h15

" set leader
let mapleader = ","
let g:mapleader = ","

" Syntax highlighting
" clear filetype flags before change runtimepath
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype on 
filetype plugin indent on
syntax on

" highlight search string
set hlsearch

" highlight cursor
set cursorline
set cursorcolumn
hi CursorLine cterm=None ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=None ctermfg=white guibg=white

" pyflakes not use quickfix window
let g:pyflakes_use_quickfix = 0

" Function for open and close quickfix window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

nmap <F2> :QFix<CR>

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
set fileencoding=utf8

" auto load vimrc file
autocmd FileType python set omnifunc=pythoncomplete#Complete
" disable use of included files in default completion
set complete-=i

" Showing line numbers and length
set number

" Don't use tab but spaces change tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
autocmd FileType go setlocal noexpandtab

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
map <Leader>s :call RopeShowDoc()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1

" jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0
"let g:jedi#completions_command = "<C-Space>"
let g:jedi#popup_select_first = 0
let g:jedi#goto_assignments_command = ""
let g:jedi#show_call_signatures = "0"

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
let Tlist_GainFocus_On_ToggleOpen = 1
map <F4> :TlistToggle<CR>

" copy file path to register
map <F7> :let @+ = expand("%")<CR>

" key map for NERDTree
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <leader>t :NERDTreeToggle<CR>
" find the current file in nerdtree panel
map <leader>f :NERDTreeFind<CR>

" make Command-T to ignore .pyc files
set wildignore=*.pyc,*.pyo

" code folding
set foldmethod=indent
set foldlevel=99

" Ack search
nmap <leader>a <Esc>:Ack!

" Map Ctrl + s to save files
"nmap <c-s> :update<CR>
"vmap <c-s> <C-C>:update<CR>
"imap <C-S> <C-O>:update<CR> 


" Go define config
let g:godef_split=0
let g:godef_same_file_in_same_window=1
" Disable preview when using autocomplete
set completeopt-=preview
" tar bar for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
map <F3> :TagbarToggle<CR>
