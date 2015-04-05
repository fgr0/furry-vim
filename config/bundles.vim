" vim: fdm=marker fdl=1 ts=4 sts=4 sw=4 ft=vim
" Notes {{{
"
" Initializes and loads Plugins 
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

" Initializing Neobundle {{{ {{{
    if has('vim_starting')
        set rtp+=~/.vim/external/neobundle/
    endif

    " Start Neobundle
    try " Will fail if submodule is not installed
        call neobundle#begin(expand('~/.vim/cache/bundles/'))
    catch /E117/
        " Display an appropriate message about the missing plugin
        echo "Neobundle submodule is not installed!"
        echo "You must install it with 'git submodule update --init --recursive'!"
        finish
    endtry

    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim', 'master'
" }}}

" Load local bundle rc {{{
    if filereadable(expand('~/.vimrc.bundles.local'))
        source ~/.vimrc.bundles.local
    endif

    " Set nonoverwritten varialbes
    if !exists("g:furry_ignore_bundle_groups")
        let g:furry_ignore_bundle_groups = []
    endif

    if !exists("g:furry_bundles_directory")
        let g:furry_bundles_directory = '~/.vim/bundles'
    endif

    let s:after_bundles = []
" }}}

" Source bundle groups {{{
    " Match bundle groups and files
    for bdir in glob(fnameescape(g:furry_bundles_directory).'/*/', 1, 1)
        " Skip bundle group if in ignore_bundle_groups
        if count(g:furry_ignore_bundle_groups, fnamemodify(bdir, ":h:t"))
            continue
        endif

        " Get bundle-files inside group and source them
        for fpath in glob(fnameescape(bdir).'/*.vim', 1, 1)
            " Checks if second extention is 'after'
            " e.g. matches 'foo.after.vim' but not 'after.vim' or 'vim.after'
            if fnamemodify(fpath, ':t:r:e') ==? "after"
                call add(s:after_bundles, fpath)
                continue
            endif
            " Source bundle file
            exec 'source' fpath
        endfor
    endfor
" }}}

" Finalize NeoBundle settings {{{
    " Finish NeoBundle setup
    call neobundle#end()

    " Check for uninstalled Bundles
    NeoBundleCheck

    " Some settings (like 'call') need to be executed after 
    " call neobundle#end()
    for fpath in s:after_bundles
        exec 'source' fpath
    endfor

    filetype plugin indent on
" }}} }}}
