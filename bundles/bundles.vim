" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0 ft=vim

" Bundle Config

" Initializing Neobundle
if has('vim_starting')
    set rtp+=~/.vim/external/neobundle/
endif

" Start Neobundle
call neobundle#begin(expand('~/.vim/cache/bundles/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim', 'master'

" Source bundle groups
if !exists("g:furry_ignore_bundle_groups")
    let g:furry_ignore_bundle_groups = []
endif
call add(g:furry_ignore_bundle_groups, 'after')

let s:bundles_directory = '~/.vim/bundles'
for bdir in glob(fnameescape(s:bundles_directory).'/*/', 1, 1)
    " Skip bundle group if in ignore_bundle_groups
    if count(g:furry_ignore_bundle_groups, fnamemodify(bdir, ":h:t"))
        continue
    endif

    " Get bundle-files inside group and source them
    for fpath in sort(split(globpath(bdir, '*.vim'), '\n'))
        exe 'source' fpath
    endfor
endfor

" Finish NeoBundle setup
call neobundle#end()

" Load final Bundle settings
for fpath in sort(split(globpath('~/.vim/bundles/after', '*.vim'), '\n'))
    exe 'source' fpath
endfor

filetype plugin indent on

" Check for uninstalled Bundles
NeoBundleCheck
