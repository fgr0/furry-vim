" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0 ft=vim

" Load Configuration

let s:config_directory = '~/.vim/config'
let s:after_config = []

for fpath in glob(fnameescape(s:config_directory).'/*.vim', 1, 1)
    if fnamemodify(fpath, ':t:r:e') ==? "after"
        call add(s:after_config, fpath)
        continue
    endif

    " Source config file
    exec 'source' fpath
endfor

for fpath in s:after_config
    exec 'source' fpath
endfor
