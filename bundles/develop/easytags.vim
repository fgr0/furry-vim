" Bundle file for furry-vim
"
" NAME: Easytags
" DESC: Automated tag file generation and syntax highlighting of tags in Vim 
" URL:  http://peterodding.com/code/vim/easytags/

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'

let g:easytags_suppress_ctags_waring = 1
let g:easytags_by_filetype = "~/.tags/"
let g:easytags_include_members = 1

if filereadable(expand('~/.vim/bundle/vim-easytags/README.md'))
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'go',
                \ 'hlgroup': 'goFunc',
                \ 'tagkinds': '[f]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'go',
                \ 'hlgroup': 'goType',
                \ 'tagkinds': '[t]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'go',
                \ 'hlgroup': 'goVar',
                \ 'tagkinds': '[v]'})

    highlight def link goFunc Function
    highlight def link goType Type
endif
