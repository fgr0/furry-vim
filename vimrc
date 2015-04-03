" vim: fdm=marker fdl=1 ts=4 sts=4 sw=4 ft=vim
" Notes {{{
"
" Initializes Vim
"
" Author:   Franz Greiling
" Date:     2015-04-03
"
" Note: This repository is a personal vim configuration and not intended for
"   widespread use. While it is highly adaptable, it is recommended that one
"   cherrypicks the parts they want and understand
"
" Url:      https://github.com/laerador/furry-vim 
" }}}

" Startup {{{ {{{
    if has('vim_starting')
        if &compatible
            " Be iMproved
            set nocompatible
        endif

        " Reset everything to their defaults
        set all&
    endif
" }}}

" Source local configuration {{{
    " Source further config
    source ~/.vim/init.vim

    " Use this to overwrite configs
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }}} }}}
