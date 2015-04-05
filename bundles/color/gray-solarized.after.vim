" Bundle file for calls after neobundle#end()
"
" NAME: Gray Solarized Colorscheme for Vim
" BELONGS TO: unite/gray_solarized.vim

try " will fail if colorscheme is not installed
    colorscheme gray_solarized
    set background=dark
catch /E185/
    " silent fail
endtry
