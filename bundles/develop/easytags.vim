" Bundle file for furry-vim
"
" NAME: Easytags
" DESC: Automated tag file generation and syntax highlighting of tags in Vim 
" URL:  http://peterodding.com/code/vim/easytags/

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'

let g:easytags_suppress_ctags_warning = 1
let g:easytags_by_filetype = "~/.tags/"
" let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1

