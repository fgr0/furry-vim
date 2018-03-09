" vim: fdm=marker fdl=1 ts=4 sts=4 sw=4 ft=vim
" Notes {{{
"
" Sets UI Options
"
" Author:   Franz Greiling
" Date:     2015-04-03
"
" Note: This repository is a personal vim configuration and not intended for
"   widespread use. While it is highly adaptable, it is recommended that one
"   cherrypicks the parts they want and understand
"
" Url:      https://github.com/laerador/furry-vim 
" }}}

syntax on

set number
set relativenumber
set ruler

" Cursorline {{{ {{{
    set cursorline
    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
" }}}

set showcmd
set noshowmode
set cmdheight=2
set lazyredraw
set laststatus=2

" set splitbelow
set splitright

set scrolloff=3
set scrolljump=5
set sidescroll=1
set selection=old
set virtualedit+=onemore,block

set diffopt+=vertical

set printoptions+=syntax:y
set printoptions+=number:y

" Wildmenu {{{
    set wildmenu
    set wildignorecase

    " Do not show these files in the Tabcompletion (in CMD)
    set wildignore+=.hg,.git,.svn
    set wildignore+=*.aux,*.out,*.toc
    set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
    set wildignore+=*.o,*.obj,*.exe,*.dll
    set wildignore+=*.pyc,*.class
    set wildignore+=*.~,*.aux,*.fdb_latexmk,*.pdf
    set wildignore+=*.DS_Store
" }}}

" Whitespaces {{{
    set linespace=2
    set backspace=indent,eol,start
    set autoindent
    set expandtab
    set smarttab
    set tabstop=4
    set softtabstop=2
    set shiftwidth=2
    set copyindent
    set shiftround
    set linebreak
    set list
    set display=lastline

    set textwidth=80
" }}}

" Search {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set wrapscan

    set showmatch
    set matchtime=1
    set matchpairs+=<:>

    set gdefault
" }}}

" Folds {{{
    set foldenable
    set foldlevelstart=99
" }}}


" GUI & Terminal Settings {{{
    set background=dark

    if has('gui_running')
        set guifont=Source\ Code\ Pro:h12
        set guioptions=mcg
        set transparency=0

        set showbreak="↪ \ "
        set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
    else
        set t_Co=256
        set t_ut=

        set restorescreen

        set showbreak="\\\ "
        set listchars=tab:»\ ,extends:>,precedes:<,nbsp:~,trail:~
    endif
" }}} }}}
