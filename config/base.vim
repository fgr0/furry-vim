" vim: fdm=marker fdl=1 ts=4 sts=4 sw=4 ft=vim
" Notes {{{
"
" Sets core options
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

set timeoutlen=300      " mapping timeout
set ttimeoutlen=150     " keycode timeout

set ttyfast
set encoding=utf-8
set hidden
set fileformats+=mac
set nrformats-=octal
set nrformats-=hex
set modeline
set modelines=1
set autoread

set shortmess=aIoOtT
set more

let mapleader=","


if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

if has('mouse')
    set mouse=a
    set mousemodel=popup_setpos
    set mousehide
endif

silent! language en_US
set nospell
set spellfile=$HOME/.vim/cache/spell/.utf-8.add

set tags=$HOME/.tags/*,./tags;/
set showfulltag

" Backup, Swap & Undo {{{ {{{
set history=1000
set backupskip=/tmp/*,/private/tmp/*
set nobackup
set nowritebackup

if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim/cache/undo
    set undolevels=1000
    set undoreload=10000
endif

if has('mksession')
    set viewdir=$HOME/.vim/cache/view
    set viewoptions=folds,options,cursor,unix,slash
endif

set directory=$HOME/.vim/cache/swap
" }}} }}}
