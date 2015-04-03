" Bundle file for calls after neobundle#end()
"
" NAME: Easytags
" BELONGS TO: develop/easytags.vim

if filereadable(expand('~/.vim/cache/bundles/vim-easytags/README.md'))
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
