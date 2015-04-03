" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0 ft=vim

" Startup {{{
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
" }}}
