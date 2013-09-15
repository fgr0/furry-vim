" Modeline and Notes { 
" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:"
" 
"        ________ ++     ________
"       /VVVVVVVV\++++  /VVVVVVVV\
"       \VVVVVVVV/++++++\VVVVVVVV/
"        |VVVVVV|++++++++/VVVVV/'
"        |VVVVVV|++++++/VVVVV/'
"       +|VVVVVV|++++/VVVVV/'+
"     +++|VVVVVV|++/VVVVV/'+++++
"   +++++|VVVVVV|/VVV___++++++++++
"     +++|VVVVVVVVVV/##/ +_+_+_+_
"       +|VVVVVVVVV___ +/#_#,#_#,\
"        |VVVVVVV//##/+/#/+/#/'/#/
"        |VVVVV/'+/#/+/#/+/#/ /#/
"        |VVV/'++/#/+/#/ /#/ /#/
"        'V/'  /##//##//##//###/
"                 ++
"
"   This is a Vim Config File (.vimrc) by Franz Greiling. It gives
"   a general Idea of what Options and Configurations are possible. It
"   should work on (hopefully) every System with at least Vim 7.2"
"   installed. You can simply clone the repository, but it is probably
"   better if you just cherry-pick the parts you want and understand.
"
"   For a more general Informationsource full with credits, check out
"   the Readme in the Repository at https://github.com/laerador/furry-vim
" } 

" Startup {
    " Versioncheck {
        if v:version < 703
            finish
        endif
    " }

    " Windows or *nix? {
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
            let os = "win"
        else
            let os = substitute(system('uname'), '\n', '', '')
        endif
    " }

    set nocompatible
" }

" Source Plugin Vimrc {
    if filereadable(expand("~/.plugins.vim"))
        source ~/.plugins.vim
    elseif filereadable(expand("~/.vim/plugins.vim"))
        source ~/.vim/plugins.vim
    endif
" }

" Environment {
    " Basic Behavior {
        " Mouse Movement, Encoding
        " Commandlineoptions, Messagesettings
        " Default Clipboard
        set encoding=utf-8
        set nofsync

        set autoread
        " set autochdir
        set autowrite
        set clipboard+=unnamed
        set hidden
    " }

    " Language Settings {
        silent! language en_US
        set nospell
    " }
    
    " Backup, Swap & Undo {
        " Longer Commandhistory
        set history=1000
        set backupskip=/tmp/*,/private/tmp/*

        " Persistent Undo and Session/view Magic
        " Need vim 7.3 + Compilerfeatures
        " Persistent Undo enabled by default,
        " for usage of views look :h mkview
        if ! exists('g:furry_persistent')
            let g:furry_persitent = 2
        endif

        if has('persistent_undo') && g:furry_persitent >= 2
            set undodir=$HOME/.vim/undo
            set undofile
            set undolevels=1000
            set undoreload=10000
        endif

        if has('mksession') && g:furry_persitent >= 1
            set viewdir=$HOME/.vim/view
            set viewoptions=folds,options,cursor,unix,slash
        endif

        if g:furry_persitent >= 0
            set directory=$HOME/.vim/swap
        endif
    " }
    
" }

" Userinterface {
    syntax on

    " Set some Layout {
        " Title {
            if has('title') && (has('gui_running') || &title)
                set titlestring=%f\
                set titlestring+=%h%m%r%w
                set titlestring+=\ -\ %{v:progname}
                set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
            endif

            if has('title') && &term =~ 'xterm'
                let &titleold = 'Terminal'
                set title
            endif
        " }

        set nu
        set rnu
        set ruler
        set cursorline

        set showcmd
        set cmdheight=2
        set showmode

        set winminheight=1

        set shortmess+=aIoOtT
        set more

        set visualbell
    " }

    " Fire up wildmenu {
        set wildmenu

        " Do not show these files in the Tabcompletion (in CMD)
        set wildignore+=.hg,.git,.svn
        set wildignore+=*.aux,*.out,*.toc
        set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
        set wildignore+=*.o,*.obj,*.exe,*.dll
        set wildignore+=*.pyc,*.class
        set wildignore+=*.~,*.aux,*.fdb_latexmk,*.pdf
        set wildignore+=*.DS_Store
    " }

    " Search {
        set ignorecase
        set smartcase
        set incsearch
        set hlsearch
        set wrapscan

        set showmatch
        set matchtime=3
        set matchpairs+=<:>

        set gdefault
    " }

    " Print {
        set printoptions+=syntax:y
        set printoptions+=number:y
    " }

    " Movement {
        set whichwrap+=<,>,h,l,[,]

        " Backspace
        set backspace=indent,eol,start

        set virtualedit+=onemore,block

        " Set Line, at which buffer starts moving
        set scrolloff=3
        set sidescroll=1

        set selection=old
    " }

    " Format {
        set wrap 
        set textwidth=80

        set linebreak

        set formatoptions=crqn1
    " }

    " Tabs {
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set smarttab
        set softtabstop=4

        set ai
        set copyindent
    " }

    " Folds {
        " Enable Folding, but start with a very low level
        set foldenable
        set foldlevel=8
        set foldnestmax=3
    " }

    " Mouse {
        if has('mouse')
            set mouse=a
            set mousemodel=popup_setpos
            set mousehide
            
            if has('mouse') && &term =~ 'xterm'
                set ttymouse=xterm2
            endif
        endif
    " }

    " GUI Options {
        if has('gui_running')
            set guifont=Sauce\ Code\ Powerline\ Light:h11

            set guioptions=mcg
            set transparency=5

            if has('gui_macvim')
                set fuopt+=maxvert,maxhorz

                let macvim_hig_shift_movement=1
            endif
        endif
    " }

    " Terminal {
        if  !(&term =~ 'screen-256color') && !has('gui_running')
            set term=xterm-256color
        endif
        set t_Co=256

        if &term =~ 'xterm'
            if &termencoding == ''
                set termencoding=utf-8
            endif

            set restorescreen
        endif
    " }

    " Theme & Customization {
        set background=dark
        silent! colorscheme badwolf

        " Set Highlighting Options
        hi LineNR ctermfg=237 
        hi Folded ctermfg=darkgrey

        " highlight lines in Sy and vimdiff etc.)
        highlight DiffAdd           cterm=bold ctermbg=1 guibg=#004225
        highlight DiffDelete        cterm=bold ctermbg=5 guibg=#343434
        highlight DiffChange        cterm=bold ctermbg=9 guibg=#7C0A02

        " highlight signs in Sy
        highlight SignifySignAdd    cterm=bold ctermfg=155 guifg=#aeee00
        highlight SignifySignChange cterm=bold ctermfg=215 guifg=#ffa724
        highlight SignifySignDelete cterm=bold ctermfg=9 guifg=#7C0A02
        highlight SignifyLineAdd    cterm=bold ctermfg=155 guifg=#aeee00
        highlight SignifyLineChange cterm=bold ctermfg=215 guifg=#ffa724
        highlight SignifyLineDelete cterm=bold ctermfg=9 guifg=#7C0A02
    " }

    " Statusline {
        set laststatus=2
    " }
" }

" Key Mappings {
    " Define Leaders
    let mapleader = ","
    let maplocalleader = '\\'

    " Movement {
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
        inoremap <Down> <C-o>gj
        inoremap <Up> <C-o>gk

        nnoremap Y y$
        
        " visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv

        " Quick mappings for 0 and $
        noremap H 0
        noremap L $
    " }

    " Code Folding {
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
    " }

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
    
    " Funktionstasten {
        " Help Key!
        nnoremap <F1> :vert help<CR>

        " Gundo
        if filereadable(expand('~/.vim/bundle/gundo.vim/autoload/gundo.vim'))
            nmap <F7> :GundoToggle<CR>
            nmap <leader>gt :GundoToggle<CR>
        endif

        " Tagbar
        if filereadable(expand('~/.vim/bundle/tagbar/autoload/tagbar.vim'))
            nmap <F8> :TagbarToggle<CR>
        endif

        " ToggleLists
        nmap <silent> <F11> :call ToggleLocationList()<CR>
        nmap <silent> <F12> :call ToggleQuickfixList()<CR>
    " }
" }

" Autocommands {
    " Commands which are automatically executed on special situations
    if has('autocmd')
        " Cursorline {
            " Show Cursorline only in some Modes
            augroup cline
               au WinLeave * set nocursorline
               au WinEnter * set cursorline
               au InsertEnter * set nocursorline
               au InsertLeave * set cursorline
            augroup END
        " }
    endif
" }

" Source additional vimrcs {
    " Vim will look for your additional configurations at two places
    " 1st vim will look for ~/.<file>.vim, if it can not find those
    " it will use the defaults from ~/.vim/<file>.vim

    " Source local vimrc {
        " This file should be used to have systemspecific 
        " Plugins instead of .local.vimrc
        if filereadable(expand("~/.local.vimrc"))
            source ~/.local.vimrc
        endif
    " }

    " Source .filetypes.vim vimrc {
        if filereadable(expand("~/.filetypes.vim"))
            source ~/.filetypes.vim
        elseif filereadable(expand("~/.vim/filetypes.vim"))
            source ~/.vim/filetypes.vim
        endif
    " }
" }
