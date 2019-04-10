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

set guifont=Courier\ New:h20

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

" disable cursorline because it slows typing
"highlight cursor
"set cursorline
"set cursorcolumn
"hi CursorLine cterm=None ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=None ctermfg=white guibg=white

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
"   colorscheme desert
"catch
"endtry

set background=dark

set encoding=utf8
set fileencoding=utf8

" auto load vimrc file
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" disable use of included files in default completion
set complete-=i

" Showing line numbers and length
set number

" Don't use tab but spaces change tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
autocmd FileType go setlocal noexpandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2
autocmd FileType less setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

noremap <Leader>r :Autoformat<CR>
autocmd FileType javascript nnoremap <buffer> <Leader>r :Prettier<CR>
autocmd FileType scss nnoremap <buffer> <Leader>r :Prettier<CR>

"let g:typescript_indent_disable = 1

" prettier configure
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'

" set auto load file when be edited by other program
set autoread

" search ignore character case
set ignorecase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" easier moving of code block
vnoremap < <gv
vnoremap > >gv

" Setup Pathogen to manage vim plugins
call pathogen#infect()

" exploring the code with hot key
" Python
" autocmd FileType python map <Leader>g :call RopeGotoDefinition()<CR>
" autocmd FileType python map <Leader>s :call RopeShowDoc()<CR>

autocmd FileType typescript map <Leader>g :TsuDefinition<CR>

" let ropevim_enable_shortcuts = 0
" autocmd FileType python setlocal omnifunc=RopeCompleteFunc
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:ropevim_goto_def_newwin = 1
"let ropevim_vim_completion = 1
"let ropevim_extended_complete=1

" airline configure
" show status
set laststatus=2
" need font support in terminal
"let g:airline_powerline_fonts = 1
" disable tagbar
let g:airline_section_x = airline#section#create_right(['filetype'])

" jedi
" temporary disable jedi because it's too slow
" let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
"""let g:jedi#completions_enabled = 0
let g:jedi#completions_command = "<C-Space>"
""let g:jedi#popup_select_first = 0
let g:jedi#goto_definitions_command = "<leader>g"
let g:jedi#show_call_signatures = "0"
let g:jedi#rename_command = "<leader>m"
" force jedi use python 2 to make it consistent with it subprocess
" otherwise pickle format will raise exception
let g:jedi#force_py_version = 3

let g:pymode_lint_write = 0

let g:pymode_folding = 0

" auto complete settings
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" python ctags file
" set tags=/workspace/Vim/tags/python/tags


" auto remove trailing space
autocmd BufWritePre *.py :%s/\s\+$//e

" taglist settings
let Tlist_Ctags_Cmd = "/workspace/installs/ctags"
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

" ctrlp options
set wildignore+=*.pyc,*.pyo
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](binary|node_modules|media|static_dist)',
            \ 'file': '\v\.(csv|xls)$',
            \ }
"let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0

" code folding
set foldmethod=indent
set foldlevel=99

" Ack search
" nmap <leader>a <Esc>:Ack!

" Ag search
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "*bundle*" --ignore "static_dist*" '
nmap <leader>a <Esc>:Ag!
nmap <leader>s :Ag --python <cword><CR>

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

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
