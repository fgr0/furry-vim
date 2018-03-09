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
let g:syntastic_error_symbol = "!!"
let g:syntastic_warning_symbol = "??"
let g:syntastic_style_error_symbol = ".!"
let g:syntastic_style_warning_symbol = ".?"

hi link SyntasticStyleErrorSign SyntasticStyleWarningSign
hi link SyntasticStyleError SpellRare 
hi link SyntasticStyleWarning None

" LaTeX
if executable('lacheck')
    let g:syntastic_tex_checkers = ['lacheck']
endif

" C
let g:syntastic_c_compiler_options = '-std=c99 -Wall -Wextra -Wpedantic'

" C++
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++ -Wall -Wextra -Wpedantic'

" Go
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = '--disable-all --enable=vet --enable=vetshadow --enable=gotype --enable=golint --aggregate'
" let g:syntastic_go_gometalinter_args = '--aggregate'

" Python
let g:syntastic_python_checkers = ['pylama']
let g:syntastic_python_pylint_quiet_messages = {
      \ "regex": [ '\[too-few-public-methods\]', '\[invalid-name\]' ]
      \ }
