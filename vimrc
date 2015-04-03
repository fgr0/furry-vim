" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0 ft=vim

" Startup {{{
    set nocompatible                
    if has('vim_starting')
        set all&                " Reset everything to their defaults
    endif
" }}}

" Base Config {{{
    set timeoutlen=300      " mapping timeout
    set ttimeoutlen=150      " keycode timeout

    set ttyfast
    set encoding=utf-8
    set hidden
    set fileformats+=mac
    set nrformats-=octal
    set nrformats-=hex
    set modeline
    set modelines=1
    set autoread

    set shortmess=aIoOtT
    set more

    if has('clipboard')
        if has('unnamedplus')
            set clipboard=unnamedplus
        else
            set clipboard=unnamed
        endif
    endif

    if has('mouse')
        set mouse=a
        set mousemodel=popup_setpos
        set mousehide
    endif

    silent! language en_US
    set nospell
    set spellfile=$HOME/.vim/cache/spell/.utf-8.add

    set tags=$HOME/.tags/*,./tags;/
    set showfulltag

    " Backup, Swap & Undo {{{
        set history=1000
        set backupskip=/tmp/*,/private/tmp/*
        set nobackup
        set nowritebackup

        if has('persistent_undo')
            set undofile
            set undodir=$HOME/.vim/cache/undo
            set undolevels=1000
            set undoreload=10000
        endif

        if has('mksession')
            set viewdir=$HOME/.vim/cache/view
            set viewoptions=folds,options,cursor,unix,slash
        endif

        set directory=$HOME/.vim/cache/swap
    " }}}

    let mapleader=","
" }}}

" UI Config {{{
    syntax on

    set number
    set relativenumber
    set ruler

    " Cursorline {{{
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
        set softtabstop=4
        set shiftwidth=4
        set copyindent
        set shiftround
        set linebreak
        let &showbreak='↪ '
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
            set guifont=Sauce\ Code\ Powerline:h12
            set guioptions=mcg
            set transparency=1
        else
            set t_Co=256
            set t_ut=

            set restorescreen
        endif
    " }}}
" }}}

" Keymaps {{{
    " Insane Magic {{{ 
        map ; :
    " }}}

    " Movement {{{
        " Easier Move between Splits
        map <C-J> <C-W>j
        map <C-K> <C-W>k
        map <C-L> <C-W>l
        map <C-H> <C-W>h

        " Easier Movement between wraped lines
        noremap j gj
        noremap k gk
        noremap 0 g0
        noremap $ g$

        nnoremap Y y$

        " visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv

        " Quick mappings for 0 and $
        noremap H 0
        noremap L $
    " }}}

    " Code Folding {{{
        nmap <leader>f0 :set foldlevel=0<CR>
        nmap <leader>f1 :set foldlevel=1<CR>
        nmap <leader>f2 :set foldlevel=2<CR>
        nmap <leader>f3 :set foldlevel=3<CR>
        nmap <leader>f4 :set foldlevel=4<CR>
        nmap <leader>f5 :set foldlevel=5<CR>
        nmap <leader>f6 :set foldlevel=6<CR>
        nmap <leader>f7 :set foldlevel=7<CR>
        nmap <leader>f8 :set foldlevel=8<CR>
        nmap <leader>f9 :set foldlevel=9<CR>
    " }}}

    " Fast editing & saving of the vimrc
    map <leader>ev :e! ~/.vimrc<CR>
    map <leader>sv :source ~/.vimrc<CR>
    
    " Search
    nnoremap <silent><leader>n :noh<CR>

    " Spell checking
    nmap <silent> <leader>sp :set spell!<cr>
    nmap <leader>sd :set spelllang=de_20<cr>
    nmap <leader>se :set spelllang=en_us<cr>
    nmap <leader>z 1z=
    
    " Adjust viewports to the same size
    map <Leader>= <C-W>=
    
    map <Leader>hg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Finishing up {{{
    " Source local configuration
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif

    " Source Bundle Config {{{
        source ~/.vim/bundles.vim
    " }}} 

    colorscheme gray_solarized
    set background=dark
" }}}
