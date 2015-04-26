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

    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustFunc',
                \ 'tagkinds': '[f]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustStruct',
                \ 'tagkinds': '[v]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustType',
                \ 'tagkinds': '[T]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustEnum',
                \ 'tagkinds': '[g]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustModule',
                \ 'tagkinds': '[m]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustConst',
                \ 'tagkinds': '[c]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustTraits',
                \ 'tagkinds': '[t]'})
    call xolox#easytags#define_tagkind({
                \ 'filetype': 'rust',
                \ 'hlgroup': 'rustImpl',
                \ 'tagkinds': '[i]'})

    highlight def link rustFunc Function
    highlight def link rustType Type
    highlight def link rustConst Constant
    highlight def link rustEnum Structure
    highlight def link rustStruct Structure
endif
