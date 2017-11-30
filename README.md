Dot files
=========

My dot files for vim and git

VIM
========

Install Vim
--------

I prefer tools which can be used with terminal, so install vim from source is
the perfect way for me, and it's also the reason why I don't use MacVim.

*   Get a copy of source code from https://vim.googlecode.com/hg/, before that please
make sure you have "hg" installed

        $> hg clone https://vim.googlecode.com/hg/

*   Installation with huge set of features

        $> ./configure --prefix={dir\_to\_install} --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope  
        $> make  
        $> make install  

Install Plugins
--------

There is a shell script which you can use to finish the installation of vim plugins
in this repository and you can find it here `vim/install.sh`

**Notice**: in this repository I use `,` as leader key, so don't be suprised when you see
a lot of `,` in the hot key of the following usage example

*   Text Search  
    Tools:
    Ag [https://github.com/rking/ag.vim](https://github.com/rking/ag.vim)  
    Usage:  
    `, + a` search text under the current workspace  
    `, + s` search the current word where the cursor is for **python** files
*   File Search  
    Tools:  
    ctrp [https://github.com/kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)  
    personaly I like ctrp more than command-t, ctrp is better than command-t in
    performance and search result
    Usage:   
    `Ctrl + p` fuzz search for files by name  
    `Ctrl + c` quit ctrlp
*   File Navigation  
    Tools:  
    NerdTree [https://github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)  
    Minbuff [https://github.com/fholgado/minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim)  
    Usage:   
    `, + t` open NerdTree sidebar  
    `, + f` open NerdTree sidebar and find the current file's location  
    `b + number` switch from different file from mimbuff  
*   Code Exploring  
    Tools:   
    ropevim [https://github.com/python-rope/ropevim](https://github.com/python-rope/ropevim)  
    tlib [https://github.com/tomtom/tlib\_vim](https://github.com/tomtom/tlib_vim)  
    tagbar [https://github.com/majutsushi/tagbar](https://github.com/majutsushi/tagbar)  
    Usage:   
    `, + g` following python code's definition  
    `Ctrl + o` back to the last cursor position during code exploring  
    `Ctrl + t` move forward to the last cursor position during code exploring  
    `f3` Open/Close right sidebar for code structure  
*   Code Completion  
    Tools: ropevim  
    Usage:  
    Code completion have to be under insert mode and by using rope you could apply completion  
    in python code  
    `Ctrl + x Ctrl + o` active auto completion for python code  
    `Ctrl + n` active auto completion for any code (not very intelligence)
*   Status Line  
    Tools:  
    ariline [https://github.com/bling/vim-airline](https://github.com/bling/vim-airline)  
    fancy status line tools which can show file type, cursor coordinates, encode type and etc
*   Code Snippets  
    Tools:  
    vim-snippets [https://github.com/honza/vim-snippets](https://github.com/honza/vim-snippets)  
    Usage:  
    when you type some keyword following with tab you can automatically bring out the code snippets  
    for example if you type ifmain and then following with a tab in a python file it will bring out
    the following code

        if __name__ == '__main__':
            main()

    type pdb with a following tab

        import pdb; pdb.set_trace()

    there are a lot other hot keys which are quite useful accross different lanuages and most  
    importantly you could be very productive
*   YAML  
    Tools:  
    vim-yaml [https://github.com/stephpy/vim-yaml](https://github.com/stephpy/vim-yaml)  
    vim's built-in YAML support is almost useless, it's super slow so this plugin can make a difference

Tips
---------
*   `f7` Copy current file path to system register
*   `f2` Open/Close preview window
*   `Ctrl + h` move cusor to the left window
*   `Ctrl + l` move cusor to the right window
*   `Ctrl + i` move cusor to the window upside
*   `Ctrl + k` move cusor to the window downside
*   `:vsp` split window vertically
*   `Ctrl + z` bring vim process to background
*   `fg` bring back background process this is a terminal command will be useful with `Ctrl + z`
*   `!command_line %` execute command line  
    for example use `:!git blame %` to blame the current file with git
*   shared register with system register  
    this means the text you copy from vim can been pasted to other program and the oppsite is also true
*   `:qa` quit vim

Intellij Vim
============

* Configure press and hold

    # for ultimate version
    defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
    # for community version
    defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
