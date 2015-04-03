" vim: fdm=marker fdl=1 ts=4 sts=4 sw=4 ft=vim
" Notes {{{
"
" Loads individual rc files
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

" Set variables
let s:config_directory = '~/.vim/config'
let s:after_config = []

" Source config/*.vim files  {{{ {{{
for fpath in glob(fnameescape(s:config_directory).'/*.vim', 1, 1)
    " Checks if second extention is 'after'
    " e.g. matches 'foo.after.vim' but not 'after.vim' or 'vim.after'
    if fnamemodify(fpath, ':t:r:e') ==? "after"
        call add(s:after_config, fpath)
        continue    " Defer loading of file
    endif

    " Source config file
    exec 'source' fpath
endfor
" }}}

" Source deferred files {{{
for fpath in s:after_config
    exec 'source' fpath
endfor
" }}} }}}
