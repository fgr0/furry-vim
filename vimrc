" Modeline and Notes  
" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:
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
"   should work on (hopefully) every System with at least Vim 7.2
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
        elseif filereadable(expand("~/.before.local.vimrc"))
            source ~/.before.local.vimrc
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
                        \'ctags']
        endif
    " }

    " Plugins themselfes {
        " Colors {
            if count(g:furry_packages, 'colors')
                Bundle 'Lokaltog/vim-powerline'

                Bundle 'altercation/vim-colors-solarized'
                Bundle 'chriskempson/vim-tomorrow-theme'
                Bundle 'sjl/badwolf'

                Bundle 'roman/golden-ratio'
            endif
        " }

        " Environment {
            if count(g:furry_packages, 'environment')
                Bundle 'kien/ctrlp.vim'

                if has('python') || has('python3')
                    Bundle 'sjl/gundo.vim'
                    Bundle 'gregsexton/VimCalc'
                else
                    echo "To use some Bundles from the Environment-Package you need to have Pythonsupport in vim"
                endif

                Bundle 'file-line'
                Bundle 'ZoomWin'
            endif
        " }

        " Utility {
            if count(g:furry_packages, 'utility')
                Bundle 'Align'
                Bundle 'tpope/vim-commentary'
                Bundle 'tpope/vim-unimpaired'
                Bundle 'tpope/vim-surround'
                Bundle 'Townk/vim-autoclose'
                Bundle 'matchit.zip'
                Bundle 'milkypostman/vim-togglelist'
                Bundle 'spiiph/vim-space'
            endif
        " }

        " Autocompletion and Snippets {
            if count(g:furry_packages, 'autocompletion')
                " Still not sure which Snippet-Engine to use...
                Bundle 'Shougo/neocomplcache'
                Bundle 'Shougo/neocomplcache-snippets-complete'

                Bundle 'garbas/vim-snipmate'
                Bundle 'MarcWeber/vim-addon-mw-utils'
                Bundle 'tomtom/tlib_vim'
                Bundle 'spf13/snipmate-snippets'
                if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
                    source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
                endif
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
                
                if executable('curl')
                    Bundle 'mattn/gist-vim'
                    Bundle 'mattn/webapi-vim'
                endif
            endif
        " }
        
        " Markup {
            if count(g:furry_packages, 'markup')
                Bundle 'plasticboy/vim-markdown'
                Bundle 'tpope/vim-liquid'
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
                Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

                Bundle 'hail2u/vim-css3-syntax'
                Bundle 'jQuery'

                Bundle 'Rykka/colorv.vim'
            endif
        " }

        " Python {
            if count(g:furry_packages, 'python')
                Bundle 'klen/python-mode'
            endif
        " }

        " Ctags {
            if executable('ctags') && count(g:furry_packages, 'ctags')
                Bundle 'majutsushi/tagbar'
                " Removed because it causes errors with Powerline - and
                " PL is way more important ;)
                " Bundle 'xolox/vim-easytags'
            elseif !executable('ctags') && count(g:furry_packages, 'ctags')
                echo "To use ctags-Packages you must have ctags installed!"
            endif
        " }
    " }

    " Let the Magic happen
    filetype plugin indent on
" }

" Plugins -- Settings {
    " Autoclose {
        let g:AutoCloseSelectionWrapPrefix="<leader>a"
        let g:AutoCloseExpandSpace = 0
    " }

    " Easytags {
        let g:easytags_include_members = 1
        highlight link cMember Special
        let g:easytags_by_filetype = "~/.ctags"
        let g:easytags_python_enabled = 1
    " }

    " SingleCompile {
        let g:SingleCompile_usedialog = 0
        let g:SingleCompile_menumode = 0
        nmap <F9> :SCCompile<CR>
        nmap <F10> :SCCompileRun<CR>
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

        " Pyflakes
        if executable('pyflakes')
            let g:syntastic_python_checker = 'pyflakes'
        endif
    " }
    
    " neocomplcache {
        " Keine Ahnung was das hier eigentlich genau macht, aber es funktioniert.
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_auto_completion_start_length = 3
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_enable_auto_select = 1
        let g:neocomplcache_snippets_dir = '~/.vim/bundle/snipmate-snippets/snippets/'

        " Enable omni completion. 
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

        " Enable heavy omni completion. 
        if !exists('g:neocomplcache_omni_patterns') 
            let g:neocomplcache_omni_patterns = {} 
        endif 
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)

        " SuperTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2
          set concealcursor=""
        endif
    " }

    " Tabularize {
        nmap <Leader>t= :Tabularize /=<CR>
        vmap <Leader>t= :Tabularize /=<CR>
        nmap <Leader>t: :Tabularize /:<CR>
        vmap <Leader>t: :Tabularize /:<CR>
        nmap <Leader>t:: :Tabularize /:\zs<CR>
        vmap <Leader>t:: :Tabularize /:\zs<CR>
        nmap <Leader>t, :Tabularize /,<CR>
        vmap <Leader>t, :Tabularize /,<CR>
        nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
    " }
    
     " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
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
        if (os == 'Darwin' || os == 'Mac')
            let g:gist_clip_command = 'pbcopy'
        elseif (os == 'Linux')
            let g:gist_clip_command = 'xclip -selection clipboard'
        endif

        let g:gist_detect_filetype = 1
        let g:gist_open_browser_after_post = 1
        let g:gist_show_privates = 1
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
        set autowrite
        set clipboard+=unnamed
        set hidden
    " }

    " Language Settings {
        language en_US
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
        set textwidth=72

        set linebreak

        " set formatoptions=crqnj1
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
            set guifont=Mensch\ for\ Powerline:h12

            set guioptions+=m
            set guioptions-=TlLRa

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
        set term=screen-256color
        set t_Co=256

        if &term =~ 'xterm'
            if &termencoding == ''
                set termencoding=utf-8
            endif

            set restorescreen
        endif
    " }

    " Theme & Customization {
        if match($TERM_PROGRAM, 'Apple_Terminal') != -1
            let term_bg_rgb = split(system("oascript -e 'tell application \"Terminal\" to get background color of current settings of selected tab of front window'"), ', ')
        elseif match($TERM_PROGRAM, 'iTerm') != -1
            let term_bg_rgb = split(system("osascript -e 'tell application \"iTerm\" to get background color of current session of current terminal'"), ', ')
        else
            let term_bg_rgb = [0, 0, 0]
        endif

        " Calculate luminance
        " Y = 0.21206 * R + 0.7152 * G + 0.0722 * B
        let coefficients = [0.2126, 0.7152, 0.0722]
        let luminance = 0

        for i in range(3)
            let luminance += coefficients[i] * term_bg_rgb[i]
        endfor

        if luminance < (65535 * 0.3)
            set background=dark
            if count(g:furry_packages, 'colors')
                colorscheme badwolf
            endif
        else
            set background=light
            if count(g:furry_packages, 'colors')
                colorscheme Tomorrow
            endif
        endif

        " Set Highlighting Options
        hi LineNR ctermfg=237 
        hi Folded ctermfg=darkgrey
        hi SignColumn ctermbg=blue

        " Set Diff Highlighting Options
        hi DiffAdd term=reverse cterm=bold ctermfg=green ctermbg=black
        hi DiffChange term=reverse cterm=bold ctermfg=cyan ctermbg=black
        hi DiffText term=reverse cterm=bold 
        hi DiffDelete term=reverse ctermfg=red
    " }

    " Statusline -- Powerline {
        set laststatus=2

        if count(g:furry_packages, 'colors')
            let g:Powerline_stl_path_style = "short"
             
            " For Fancy symbols you need a supporting Font!
            let g:Powerline_symbols = "fancy"
        endif
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

        " Provide 'unimpaired' Mappings for Tabs
        nnoremap <silent> [t :tabnext<CR>
        nnoremap <silent> ]t :tabprevious<CR>
        nnoremap <silent> [T :tabmove +1<CR>
        nnoremap <silent> ]T :tabmove -1<CR>
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
    map <leader>sv :source $MYVIMRC<CR>
    
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
               au InsertEnter * hi CursorLine ctermbg=NONE
               au InsertLeave * hi CursorLine ctermbg=235
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
            " setlocal formatoptions+=a

            if getline(1) == '---'
                let b:liquid_subtype = 'markdown'
                set ft=liquid
            endif
        endfunction " }

        function! PythonFile() " {
            setlocal ft=python syntax=python3
            if executable('python3')
                call SingleCompile#ChooseCompiler('python', 'python3')
            endif
        endfunction " }

        function! LaTeXFile() " {
            if executable('latexmk')
                call SingleCompile#SetCompilerTemplate('tex','latexmk','latexmk','latexmk','-pdf','open %<.pdf')
                call SingleCompile#ChooseCompiler('tex', 'latexmk')
            endif
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
        " }
    endif
" }

" Source after.local vimrc {
    " If vimconfiguration is shared over several systems
    " localrc can be used to have system-specific settings
    let s:localrc = expand($HOME . '/.after.local.vimrc')
    if filereadable(s:localrc)
        source s:localrc
    endif
" }
