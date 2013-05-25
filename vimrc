" Modeline and Notes  
" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:"{
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
"   should work on (hopefully) every System with at least Vim 7.2"}
"   installed. You can simply clone the repository, but it is probably
"   better if you just cherry-pick the parts you want and understand.
"
"   For a more general Informationsource full with credits, check out
"   the Readme in the Repository at https://github.com/laerador
" 

" Startup {
    " Versioncheck {
        if v:version < 703
            echo 'This .vimrc requires at least Vim 7.3 or greater'
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

    filetype off

    " Initializing Vundle {
        " Use Bundle as Plugin Manager
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " Update/Manage Vundle with Vundle
        Bundle 'gmarik/vundle'
    " }

    " Source local vimrc {
        " This file should be used to have systemspecific 
        " Plugins instead of .local.vimrc
        if filereadable(expand("~/.local.vimrc"))
            source ~/.local.vimrc
            let g:furry_local = 1
        elseif filereadable(expand("~/.before.local.vimrc"))
            source ~/.before.local.vimrc
            let g:furry_local = 1
        else
            let g:furry_local = 0
        endif
    " }
" }

" Plugins -- Vundle {
    " Set Packages {
        if ! exists('g:furry_packages')
            let g:furry_packages = [
                        \'colors',
                        \'environment',
                        \'utility',
                        \'autocompletion',
                        \'views',
                        \'devel',
                        \'git',
                        \'markup', 
                        \'latex',
                        \'html',
                        \'python',
                        \'go',
                        \'osx',
                        \'ctags']
        endif
    " }

    " Plugins themselfes {
        " Colors {
            if count(g:furry_packages, 'colors')
                if has('python') || has('python3')
                    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
                endif

                Bundle 'sjl/badwolf'
                Bundle 'altercation/vim-colors-solarized'
                Bundle 'chriskempson/vim-tomorrow-theme'

                Bundle 'ricardovaleriano/vim-github-theme'
                Bundle 'roman/golden-ratio'
            endif
        " }

        " Environment {
            if count(g:furry_packages, 'environment')
                Bundle 'file-line'

                if has('python') || has('python3')
                    Bundle 'sjl/gundo.vim'
                    Bundle 'gregsexton/VimCalc'
                elseif g:furry_local != 1
                    echo "To use some Bundles from the Environment-Package you need to have Pythonsupport in vim"
                endif
            endif
        " }

        " Utility {
            if count(g:furry_packages, 'utility')
                Bundle 'tpope/vim-unimpaired'
                Bundle 'Align'
                Bundle 'nathanaelkane/vim-indent-guides'
                Bundle 'tpope/vim-repeat'
                Bundle 'tomtom/tcomment_vim'
                Bundle 'laerador/vim-speeddating'
                Bundle 'tpope/vim-surround'
                Bundle 'Townk/vim-autoclose'
                Bundle 'matchit.zip'
                Bundle 'milkypostman/vim-togglelist'

                if executable('ack')
                    Bundle 'mileszs/ack.vim'
                endif
            endif
        " }

        " Autocompletion and Snippets {
            if count(g:furry_packages, 'autocompletion')
                Bundle 'Shougo/neocomplcache'
                Bundle 'Shougo/neosnippet'
            endif
        " }

        " Views {
            if count(g:furry_packages, 'views')
                " CARE! Restore view automates Views
                " This can get some unintendet behavior!
                Bundle 'vim-scripts/restore_view.vim'
                Bundle 'xolox/vim-session'
            endif
        " }

        " Developing {
            if count(g:furry_packages, 'devel')
                Bundle 'xuhdev/SingleCompile'
                Bundle 'scrooloose/syntastic'
            endif
        " }

        " Git {
            if count(g:furry_packages, 'git')
                Bundle 'tpope/vim-fugitive'
                Bundle 'gregsexton/gitv'
                Bundle 'tpope/vim-git'
                if has('signs')
                    Bundle 'airblade/vim-gitgutter'
                endif
                
                if executable('curl')
                    Bundle 'mattn/webapi-vim'
                    Bundle 'mattn/gist-vim'
                endif
            endif
        " }
        
        " Markup {
            if count(g:furry_packages, 'markup')
                Bundle 'tpope/vim-liquid'
                Bundle 'vim-pandoc/vim-pandoc'
                Bundle 'xolox/vim-notes'
            endif
        " }

        " LaTeX {
            if count(g:furry_packages, 'latex')
                Bundle 'LaTeX-Box-Team/LaTeX-Box'
            endif
        " }

        " HTML & CSS {
            if count(g:furry_packages, 'html')
                Bundle 'othree/html5.vim'
                Bundle 'mattn/zencoding-vim'
                Bundle 'hail2u/vim-css3-syntax'
                Bundle 'tpope/vim-haml'
                Bundle 'jQuery'
            endif
        " }

        " Python {
            if count(g:furry_packages, 'python')
                " Bundle 'klen/python-mode'
                Bundle 'davidhalter/jedi-vim'
            endif
        " }

        " Go {
            if count(g:furry_packages, 'go')
                set rtp+=$GOROOT/misc/vim
                Bundle 'nsf/gocode', {'rtp': 'vim/'}
            endif
        " }

        " OS X {
            if count(g:furry_packages, 'osx')
                Bundle 'zhaocai/applescript.vim'

                if count(g:furry_packages, 'latex')
                    Bundle 'keflavich/macvim-skim'
                endif
            endif
        " }

        " Ctags {
            if executable('ctags') && count(g:furry_packages, 'ctags')
                Bundle 'majutsushi/tagbar'
                Bundle 'xolox/vim-easytags'
            elseif !executable('ctags') && count(g:furry_packages, 'ctags') && g:furry_local != 1
                echo "To use ctags-Packages you must have ctags installed!"
            endif
        " }
    " }

    " Let the Magic happen
    filetype plugin indent on
" }

" Plugins -- Settings {
    " Define Leaders
    let mapleader = ","
    let maplocalleader = '\\'
    
    " Badwolf {
        let g:badwolf_tabline = 2
        let g:badwolf_css_props_highlight = 1
    " }

    " Solarized {
        let g:solarized_termcolors = 256
    " } 
    
    " Golden Ratio {
        let g:golden_ratio_autocommand = 0   
    " }
    
    " Indent Guides {
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
    " }

    " Autoclose {
        let g:AutoCloseSelectionWrapPrefix="<leader>a"
        let g:AutoCloseExpandSpace = 0
    " }

    " Togglelist {
        let g:toggle_list_no_mappings = 1
    " }

    " SingleCompile {
        let g:SingleCompile_usedialog = 0
        let g:SingleCompile_menumode = 0
        let g:SingleCompile_showquickfixiferror = 1
        let g:SingleCompile_silentcompileifshowquickfix = 1
        let g:SingleCompile_showresultafterrun = 1 

        nmap <F9> :SCCompile<CR><CR>
        nmap <F10> :SCCompileRun<CR><CR>
        nmap <S-F10> :SCCompileRunAsync<CR>
        nmap <S-F11> :SCViewResult<CR>
    " }

    " netrw {
        let g:netrw_menu = 0
        let g:netrw_use_errorwindow = 0
        let g:netrw_liststyle = 1
        " let g:netrw_browse_split = 4

        " Make it Toggleble (Function) {
            function! ToggleVExplorer()
                if exists("t:expl_buf_num")
                    let expl_win_num = bufwinnr(t:expl_buf_num)
                    if expl_win_num != -1
                        let cur_win_nr = winnr()
                        exec expl_win_num . 'wincmd w'
                        close
                        exec cur_win_nr . 'wincmd w'
                        unlet t:expl_buf_num
                    else
                        unlet t:expl_buf_num
                    endif
                else
                    exec '1wincmd w'
                    Vexplore
                    let t:expl_buf_num = bufnr("%")
                endif
            endfunction
            nmap <silent><F6> :call ToggleVExplorer()<CR>
            nmap <S-F6> :45Vex<CR>
        " }
    " }

    " Syntastic {
        let g:syntastic_check_on_open = 1
        let g:syntastic_auto_loc_list = 2
        let g:syntastic_always_populate_loc_list=1

        " Pyflakes
        if executable('pyflakes')
            let g:syntastic_python_checkers = ['pyflakes']
        endif

        " LaTeX
        if executable('lacheck')
            let g:syntastic_tex_checkers = ['lacheck']
        endif
    " }

    " neocomplcache {
        " Keine Ahnung was das hier eigentlich genau macht, aber es funktioniert.
        let g:neocomplcache_enable_at_startup = 1

        let g:neocomplcache_auto_completion_start_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_enable_auto_select = 0
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_fuzzy_completion = 1
        let g:neocomplcache_auto_close_preview = 1

        " Enable omni completion. 
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
        autocmd FileType python setlocal omnifunc=jedi#complete
        autocmd FileType go setlocal omnifunc=gocomplete#Complete

        set completeopt-=preview

        " " Enable heavy omni completion. 
        if !exists('g:neocomplcache_omni_patterns') 
            let g:neocomplcache_omni_patterns = {} 
        endif 

        if !exists('g:neocomplcache_force_omni_patterns')
            let g:neocomplcache_force_omni_patterns = {}
        endif

        let g:neocomplcache_omni_patterns.python = '[^. \t]\.\w*'
        let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
        let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
        " let g:neocomplcache_force_omni_patterns.go = '\h\w*\.\?'

        if !exists('g:neocomplcache_same_filetype_lists')
            let g:neocomplcache_same_filetype_lists = {}
        endif

        let g:neocomplcache_same_filetype_lists.c = 'cpp,h'
        let g:neocomplcache_ctags_program = "/usr/local/bin/ctags"

        " Plugin key-mappings.
        vmap <TAB>     <Plug>(neosnippet_expand_target)
        
        inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><BS>     neocomplcache#smart_close_popup() . "\<C-h>"

        " SuperTab like snippets behavior.
        imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
            " return neocomplcache#smart_close_popup() . "\<CR>"
            " For no inserting <CR> key.
            return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2
          set concealcursor=""
        endif
    " }

    " Jedi {
        let g:jedi#auto_initialization = 1
        let g:jedi#show_function_definition = 0
        let g:jedi#popup_on_dot = 0

        let g:jedi#goto_command = '<leader>jg'
        let g:jedi#get_definition_command = '<leader>jd'
        let g:jedi#pydoc = '<leader>jk'
        let g:jedi#rename_command = '<leader>jn'
    " }

    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :ListSession<CR>
        nmap <leader>ss :SaveSession<CR>
        let g:session_autosave = 'no'
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " }

    " Gist {
        if (os == 'darwin' || os == 'mac')
            let g:gist_clip_command = 'pbcopy'
        elseif (os == 'linux')
            let g:gist_clip_command = 'xclip -selection clipboard'
        endif

        let g:gist_detect_filetype = 1
        let g:gist_open_browser_after_post = 1
        let g:gist_show_privates = 1
        hi link cMember Special
    " }

    " Easytags {
        set tags=$HOME/.tags/*
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
    " }

    " Pandoc {
        let g:pandoc_use_hard_wraps = 1
        let g:pandoc_auto_format = 1
    " }

    " LatexBox {
        imap <buffer> [[ 		    \begin{
        imap <buffer> ]]		    <Plug>LatexCloseCurEnv
        nmap <buffer> <leader>lc	<Plug>LatexChangeEnv
        vmap <buffer> <F7>		    <Plug>LatexWrapSelection
        vmap <buffer> <S-TAB>		<Plug>LatexEnvWrapSelection
        imap <buffer> (( 		    \eqref{
    " } } }
    
    " Macvim-Skim {
        let g:macvim_skim_app_path = "/Applications/Skim.app"
    " }

" }

" Environment {
    " Basic Behavior {
        " Mouse Movement, Encoding
        " Commandlineoptions, Messagesettings
        " Default Clipboard
        set encoding=utf-8
        set nofsync

        set autoread
        set autochdir
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

        set number
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

    " GUI Options {
        if has('gui_running')
            set guifont=Source\ Code\ Pro\ for\ Powerline:h11

            set guioptions=mcg
            set transparency=10

            if has('gui_macvim')
                set fuopt+=maxvert,maxhorz

                let macvim_hig_shift_movement=1
            endif
        endif
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

    " Source .theme.vim vimrc {
        let g:furry_usertheme = 0
        if filereadable(expand("~/.theme.vimrc"))
            source ~/.theme.vimrc
        elseif filereadable(expand("~/.theme.local.vimrc"))
            source ~/.theme.local.vimrc
        endif
    " }

    " Theme & Customization {
        " Luminance Calculation by Sorin Ionescu
        " https://github.com/sorin-ionescu/dot-files/blob/master/vimrc
        if g:furry_usertheme == 0
            set background=dark
            colorscheme badwolf

            " Set Highlighting Options
            hi LineNR ctermfg=237 
            hi Folded ctermfg=darkgrey
        endif
    " }

    " Statusline -- Powerline {
        set laststatus=2
" 
"         if count(g:furry_packages, 'colors')
"             let g:powerline_config_path = expand('~/.vim/bundle/powerline/powerline/config_files')
"         endif
    " }
" }

" Key Mappings {
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

        " Provide 'unimpaired' Mappings for Tabs
        nmap <silent> <leader>t :tabnext<CR>
        nmap <silent> <leader>T+ :tabmove +1<CR>
        nmap <silent> <leader>T- :tabmove -1<CR>
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

" Filetype Specific Settings (FSS) {
    " The Principle is: Using only one autocmd per filetype 
    " but set several options through filetypespecific functions

    if has('autocmd')

        " Functions {
        function! AppleScriptFile() " {
            setlocal ft=applescript
            if  && (os == 'Darwin' || os == 'Mac')
                call SingleCompile#SetCompilerTemplate('applescript','osascript', 'AppleScript Interpreter', 'osascript', '-e $(FILE_TITLE)$')
                call SingleCompile#ChooseCompiler('applescript', 'osascript')
            endif
        endfunction " }  

        function! CSSFile() " {
            setlocal ft=css syntax=css3
            setlocal nowrap
        endfunction " }

        function! MarkdownFile() " {
            if getline(1) == '---'
                let b:liquid_subtype = 'pandoc'
                set ft=liquid
            elseif filereadable(expand('~/.vim/bundle/vim-pandoc/plugin/pandoc.vim'))
                set ft=pandoc
            endif
            
            set formatoptions+=t
            set conceallevel=0
        endfunction " }

        function! PythonFile() " {
            setlocal ft=python syntax=python3
            setlocal commentstring=#\ %s
            let b:bib_ftplugin = 1
            if executable('python3')
                call SingleCompile#ChooseCompiler('python', 'python3')
            endif
        endfunction " }

        function! LaTeXFile() " {
            if executable('latexmk')
                call SingleCompile#SetCompilerTemplate('tex','latexmk','latexmk','latexmk','-pdf','open %<.pdf')
                call SingleCompile#ChooseCompiler('tex', 'latexmk')
            endif
" 
"             nmap <Leader>lt :LatexTOCToggle<CR>
" 
            set conceallevel=0
        endfunction " }

        function! CommitFile() " {
            call setpos('.', [0, 1, 1, 0])
            setlocal formatoptions+=a
        endfunction " }

        function! HtmlFile() " {
            call SingleCompile#SetCompilerTemplate('html', 'open', 'open', 'open','','')
            call SingleCompile#ChooseCompiler('html', 'open')
            nmap <F10> :SCCompile<CR><CR>
        endfunction   " }

        function! MaildropFile() " {
            setlocal syntax=perl ft=maildrop
        endfunction   " }

        function! GoFile() " {
            nmap <buffer> <Leader>gf :!gofmt -tabs=false -tabwidth=4 -w=true %<CR>
            set path+=$GOROOT/**
        endfunction " }
        " }

        " Autocommands {
        autocmd BufRead,BufNewFile *.css                 call CSSFile()
        autocmd BufRead,BufNewFile *.mkd,*.md,*.markdown call MarkdownFile()
        autocmd BufRead,BufNewFile *.scpt                call AppleScriptFile()
        autocmd BufRead,BufNewFile *.tex                 call LaTeXFile()
        autocmd BufRead,BufNewFile *.py                  call PythonFile()
        autocmd filetype git,svn,*commit*                call CommitFile()
        autocmd FileType gitcommit                       call CommitFile()
        autocmd BufRead,BufNewFile *.html                call HtmlFile()
        autocmd BufRead,BufNewFile .maildrop*            call MaildropFile()
        autocmd FileType go                              call GoFile()
        " }
    endif
" }

" Source after.local vimrc {
    " If vimconfiguration is shared over several systems
    " localrc can be used to have system-specific settings
    if filereadable(expand("~/.after.local.vimrc"))
        source ~/.after.local.vimrc
    endif
    if filereadable(expand("~/.after.vimrc"))
        source ~/.after.vimrc
    endif
" }
