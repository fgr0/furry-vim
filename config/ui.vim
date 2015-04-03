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
