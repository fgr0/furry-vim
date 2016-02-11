" Bundle file for furry-vim
"
" NAME: Syntastic
" DESC: Syntax checking hacks for vim
" URL:  https://github.com/scrooloose/syntastic

NeoBundle 'scrooloose/syntastic'

let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list=1

let g:syntastic_stl_format = '‼ %e ⁇ %w'

hi link SyntasticStyleErrorSign SyntasticStyleWarningSign

" LaTeX
if executable('lacheck')
    let g:syntastic_tex_checkers = ['lacheck']
endif

" C
let g:syntastic_c_compiler_options = '-std=c99 -Wall -Wextra -Wpedantic'

" C++
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++ -Wall -Wextra -Wpedantic'

" Pyflakes
if executable('flake8')
    let g:syntastic_python_checkers = ['flake8']
endif
