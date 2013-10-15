" Figuring out, if we are dealing with a Liquid File
if getline(1) == '---'
    let b:liquid_subtype = 'pandoc'
    set ft=liquid
elseif filereadable(expand('~/.vim/bundle/vim-pandoc/plugin/pandoc.vim'))
    hi Conceal ctermfg=39 ctermbg=NONE guifg=#0a9dff guibg=NONE
endif

set formatoptions+=t
