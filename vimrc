" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0 ft=vim

" Startup {{{
    " OS detection {{{
        let s:is_windows = has('win32') || has('win64')
        let s:is_cygwin = has('win32unix')
        let s:is_macvim = has('gui_macvim')
    " }}}

    set nocompatible
    if has('vim_starting')
        set all& " Reset everything to their defaults
    endif

    set rtp+=~/.vim

    " Source local rc {{{
        if filereadable(expand("~/.local.vimrc"))
            source ~/.local.vimrc
        endif
    " }}}

    " Initializing default Settings {{{
        if !exists('g:furry_settings')
            let g:furry_settings = {}
        endif

        let s:settings = {}
        let s:settings.colorscheme = 'badwolf'
        let s:settings.tabstopsize = 4

        " Set Plugin Groups
        if exists('g:furry_settings.plugin_groups')
            let s:settings.plugin_groups = g:furry_settings.plugin_groups
        else
            let s:settings.plugin_groups = []
            call add(s:settings.plugin_groups, 'core')
            call add(s:settings.plugin_groups, 'colors')
            call add(s:settings.plugin_groups, 'editing')
            call add(s:settings.plugin_groups, 'autocompletion')
            call add(s:settings.plugin_groups, 'unite')
            " call add(s:settings.plugin_groups, 'development')
            call add(s:settings.plugin_groups, 'scm')
            " call add(s:settings.plugin_groups, 'markup')
            " call add(s:settings.plugin_groups, 'latex')
            " call add(s:settings.plugin_groups, 'web')
            " call add(s:settings.plugin_groups, 'python')
            " call add(s:settings.plugin_groups, 'go')
            " call add(s:settings.plugin_groups, 'osx')
            " call add(s:settings.plugin_groups, 'java')
            call add(s:settings.plugin_groups, 'misc')
        endif

        " override defaults with the ones specified in g:furry_settings
        for key in keys(s:settings)
            if has_key(g:furry_settings, key)
                let s:settings[key] = g:furry_settings[key]
            endif
        endfor
    " }}}
" }}}

" Base Config {{{
    set timeoutlen=300      " mapping timeout
    set ttimeoutlen=150      " keycode timeout

    set ttyfast
    set encoding=utf-8
    set hidden
    set fileformats+=mac
    set nrformats-=octal
    set modeline
    set modelines=5
    set autoread

    set shortmess=aIoOtT
    set more

    set clipboard+=unnamed

    if has('mouse')
        set mouse=a
        set mousehide
    endif

    silent! language en_US
    set nospell

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
    syntax enable

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

    " if has('conceal')
    "     set conceallevel=2
    "     set listchars+=conceal:Δ
    " endif

    " Wildmenu {{{
        set wildmenu
        " set wildmode=list:full
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
        set backspace=indent,eol,start
        set autoindent
        set expandtab
        set smarttab
        let &tabstop     = s:settings.tabstopsize
        let &softtabstop = s:settings.tabstopsize
        let &shiftwidth  = s:settings.tabstopsize
        set copyindent
        set shiftround
        set linebreak
        let &showbreak='↪ '
        set display=lastline
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

        if executable('ack')
            set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
            set grepformat=%f:%l:%c:%m
        endif
        if executable('ag')
            set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
            set grepformat=%f:%l:%c:%m
        endif

        set gdefault
    " }}}

    " Folds {{{
        set foldenable
        set foldlevelstart=99
        " set foldmethod=syntax
    " }}}

    " GUI & Terminal Settings {{{
        if has('gui_running')
            set guifont=Sauce\ Code\ Powerline\ Light:h11
            set guioptions=mcg
            set transparency=5
        else
            set t_Co=256

            set restorescreen
        endif
    " }}}
    
    " Colors {{{
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
    " }}}
" }}}

" Plugin Config {{{
    " Initializing Vundle {{{
        if has('vim_starting')
            set rtp+=~/.vim/bundle/neobundle.vim/
        endif

        call neobundle#rc(expand('~/.vim/bundle'))

        " Let NeoBundle manage NeoBundle
        NeoBundleFetch 'Shougo/neobundle.vim', 'master'
    " }}}

    " Set Package Groups {{{
        if count(s:settings.plugin_groups, 'core') " {{{
            NeoBundle 'bling/vim-airline' " {{{
                let g:airline#extensions#whitespace#enabled = 0
                let g:airline#extensions#syntastic#enabled = 1
                let g:airline_powerline_fonts = 1

                " if !exists('g:airline_symbols')
                "     let g:airline_symbols = {}
                " endif
                " let g:airline_left_sep = '⮀'
                " let g:airline_left_alt_sep = '⮁'
                " let g:airline_right_sep = '⮂'
                " let g:airline_right_alt_sep = '⮃'
                " let g:airline_symbols.branch = '⎇'
                " let g:airline_symbols.linenr = '⭡'
                " let g:airline_symbols.readonly = '⭤'
            " }}}
            NeoBundle 'bling/vim-bufferline' "{{{
                let g:bufferline_echo = 0
            " }}}
            NeoBundleLazy 'mbbill/undotree', {'autoload':{'commands':'UndotreeToggle'}} "{{{
                let g:undotree_SplitWidth = 40
                let g:undotree_SetFocusWhenToggle = 1
                nnoremap <F5> :UndotreeToggle<cr>
                nnoremap <leader>gt :UndotreeToggle<cr>
            "}}}

            NeoBundle 'matchit.zip'
            NeoBundle 'tpope/vim-unimpaired'
            NeoBundle 'tpope/vim-repeat'
            NeoBundle 'bogado/file-line'

            NeoBundle 'Shougo/vimproc.vim', {
                        \ 'build': {
                        \ 'mac': 'make -f make_mac.mak',
                        \ 'unix': 'make -f make_unix.mak',
                        \ 'cygwin': 'make -f make_cygwin.mak',
                        \ 'windows': '"C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\nmake.exe" make_msvc32.mak',
                        \ },
                        \ }
        endif " }}}

        if count(s:settings.plugin_groups, 'colors') " {{{
            NeoBundle 'sjl/badwolf' " {{{
                let g:badwolf_tabline = 2
                let g:badwolf_css_props_highlight = 1
            " }}}
            NeoBundle 'nielsmadan/harlequin'
            NeoBundle 'tomasr/molokai'
            NeoBundle 'chriskempson/vim-tomorrow-theme'
            NeoBundle 'john2x/flatui.vim'
            NeoBundle 'nanotech/jellybeans.vim'
            NeoBundle 'w0ng/vim-hybrid'
        endif " }}}

        if count(s:settings.plugin_groups, 'editing') " {{{
            NeoBundle 'tpope/vim-endwise'
            NeoBundle 'laerador/vim-speeddating'
            NeoBundle 'tpope/vim-surround'
            NeoBundle 'tomtom/tcomment_vim'
            NeoBundle 'terryma/vim-expand-region'
            NeoBundle 'terryma/vim-multiple-cursors'
            NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}} "{{{
                nmap <Leader>t& :Tabularize /&<CR>
                vmap <Leader>t& :Tabularize /&<CR>
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
            " }}}
            NeoBundle 'jiangmiao/auto-pairs' " {{{
                " let g:AutoPairsFlyMode = 1
                " let g:AutoPairsShortcutBackInsert = '<C-b>'
            " }}}
        endif " }}}

        if count(s:settings.plugin_groups, 'autocompletion') " {{{
            if has('lua')
                NeoBundleLazy 'Shougo/neocomplete.vim', { 'autoload':{'insert':1}, 'vim_version':'7.3.885' } " {{{
                    " Start Neocomplete
                    let g:neocomplete#enable_at_startup = 1
                    let g:neocomplete#data_directory='~/.vim/cache/neocomplete'

                    " Use Smartcase
                    let g:neocomplete#enable_ignore_case = 1
                    let g:neocomplete#enable_smart_case = 1

                    " Insert Delimiter Automatically
                    let g:neocomplete#enable_auto_delimiter = 1

                    " Set Completion Options
                    let g:neocomplete#enable_fuzzy_completion = 1
                    let g:neocomplete#enable_prefetch = 1

                    " Where is ctags?
                    let g:neocomplete#ctags_command = '/usr/local/bin/ctags'

                    " Enable omni completion. 
                    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
                    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
                    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
                    autocmd FileType java setlocal omnifunc=javaapi#complete
                    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
                    autocmd FileType python setlocal omnifunc=jedi#complete
                    autocmd FileType go setlocal omnifunc=gocomplete#Complete

                    set completeopt-=preview

                    " Enable heavy omni completion.
                    if !exists('g:neocomplete#sources#omni#input_patterns')
                        let g:neocomplete#sources#omni#input_patterns = {}
                    endif
                    if !exists('g:neocomplete#force_omni_input_patterns')
                        let g:neocomplete#force_omni_input_patterns = {}
                    endif
                    let g:neocomplete#sources#omni#input_patterns.python = '[^. \t]\.\w*'
                    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
                    let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

                    " Same Filetypes
                    if !exists('g:neocomplete#same_filetypes')
                        let g:neocomplete#same_filetypes = {}
                    endif
                    let g:neocomplete#same_filetypes.c = 'cpp,d,h'
                    let g:neocomplete#same_filetypes.cpp = 'c'
                    let g:neocomplete#same_filetypes.gitconfig = '_'
                    let g:neocomplete#same_filetypes._ = '_'

                    " let g:neocomplete#enable_auto_select = 1

                    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
                    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

                    " Tab Completion
                    imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
                    " imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
                    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
                    imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
                    smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""

                    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
                    function! s:my_cr_function()
                        " return neocomplete#smart_close_popup() . "\<CR>"
                        " For no inserting <CR> key.
                        return pumvisible() ? neocomplete#close_popup() : "\<CR>"
                    endfunction
                " }}}
                NeoBundle 'Shougo/context_filetype.vim'
            else
                NeoBundle 'Shougo/neocomplcache' " {{{
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
                    autocmd FileType html,markdown,pandoc setlocal omnifunc=htmlcomplete#CompleteTags 
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
                " }}}
            endif

            NeoBundle 'Shougo/neosnippet'
            NeoBundle 'honza/vim-snippets' " {{{
                let g:neosnippet#snippets_directory = "~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets"
                let g:neosnippet#enable_snipmate_compatibility = 1

                " Plugin key-mappings.
                imap <C-k>     <Plug>(neosnippet_expand_or_jump)
                smap <C-k>     <Plug>(neosnippet_expand_or_jump)
                xmap <C-k>     <Plug>(neosnippet_expand_target)

                " For snippet_complete marker.
                " if has('conceal')
                "     " set conceallevel=2 concealcursor=i
                " endif
            " }}}
        endif " }}}

        if count(s:settings.plugin_groups, 'unite') " {{{
            NeoBundle 'Shougo/unite.vim' " {{{
                let g:unite_data_directory = '~/.vim/cache/unite'
                let g:unite_enable_start_insert = 1
                let g:unite_source_history_yank_enable = 1
                let g:unite_source_rec_max_cache_files = 10000

                let g:unite_prompt='» '

                " To track long mru history.
                let g:unite_source_file_mru_long_limit = 3000
                let g:unite_source_directory_mru_long_limit = 3000

                call unite#filters#matcher_default#use(['matcher_context'])
                call unite#filters#sorter_default#use(['sorter_rank'])
                call unite#set_profile('files', 'smartcase', 1)
                call unite#custom#source('line,outline','matchers','matcher_fuzzy')

                function! s:unite_settings()
                    nmap <buffer> Q <plug>(unite_exit)
                    nmap <buffer> <esc> <plug>(unite_exit)
                    " inoremap <buffer> <esc> <plug>(unite_exit)
                endfunction
                autocmd FileType unite call s:unite_settings()

                if executable('ag')
                    let g:unite_source_grep_command='ag'
                    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
                    let g:unite_source_grep_recursive_opt=''
                elseif executable('ack')
                    let g:unite_source_grep_command='ack'
                    let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
                    let g:unite_source_grep_recursive_opt=''
                endif

                " Keymaps {{{
                    " Setting up Prefix Key
                    nmap <space> [unite]
                    nnoremap [unite] <Nop>

                    " File-Search
                    if s:is_windows
                        nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec buffer file_mru bookmark<cr><c-u>
                        nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec:!<cr><c-u>
                    else
                        nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async file/new buffer file_mru bookmark<cr><c-u>
                        nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file file_rec/async:!<cr><c-u>
                    endif
                    nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
                    nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
                    nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
                    nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
                    nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
                    nnoremap <silent> [unite]r :<C-u>Unite -toggle -auto-resize -buffer-name=mru file_mru directory_mru<cr>
                    nnoremap <silent> [unite]s :<C-u>Unite -toggle -auto-resize -buffer-name=snippets snippet<cr>
                    nnoremap <silent> [unite]n :<C-u>Unite -toggle -auto-resize -buffer-name=new file/new directory/new<cr>
                " }}}
            " }}}
            NeoBundleLazy 'Shougo/unite-help', {'autoload':{'unite_sources':'help'}} "{{{
                nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
            "}}}
            NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}} "{{{
                nnoremap <silent> [unite]o :<C-u>Unite -vertical -buffer-name=outline outline<cr>
            "}}}
            NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file']}} "{{{
                nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
            "}}}
            NeoBundleLazy 'osyo-manga/unite-airline_themes', {'autoload':{'unite_sources':'airline_themes'}} "{{{
                nnoremap <silent> [unite]a :<C-u>Unite -winheight=10 -auto-preview -buffer-name=airline_themes airline_themes<cr>
            "}}}
            NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':'colorscheme'}} "{{{
                nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<cr>
            "}}}
        endif " }}}

        if count(s:settings.plugin_groups, 'development') " {{{
            NeoBundle 'xuhdev/SingleCompile' " {{{
                let g:SingleCompile_usedialog = 0
                let g:SingleCompile_menumode = 0
                let g:SingleCompile_showquickfixiferror = 1
                let g:SingleCompile_silentcompileifshowquickfix = 1
                let g:SingleCompile_showresultafterrun = 1 

                nmap <F9> :SCCompile<CR><CR>
                nmap <F10> :SCCompileRun<CR><CR>
                nmap <S-F10> :SCCompileRunAsync<CR>
                nmap <S-F11> :SCViewResult<CR>
            " }}}
            NeoBundle 'scrooloose/syntastic' " {{{
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
            " }}}
            if executable('ctags')
                NeoBundleLazy 'majutsushi/tagbar', {'autoload':{'commands':'TagbarToggle'}} " {{{
                    nmap <F6> :TagbarToggle<CR>
                " }}}
                NeoBundle 'xolox/vim-misc'
                NeoBundle 'xolox/vim-easytags' " {{{
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
                " }}}
            endif
        endif " }}}

        if count(s:settings.plugin_groups, 'scm') " {{{
            NeoBundle 'tpope/vim-fugitive' " {{{
                nnoremap <silent> <leader>gs :Gstatus<CR>
                nnoremap <silent> <leader>gd :Gdiff<CR>
                nnoremap <silent> <leader>gc :Gcommit<CR>
                nnoremap <silent> <leader>gb :Gblame<CR>
                nnoremap <silent> <leader>gl :Glog<CR>
                nnoremap <silent> <leader>gp :Git push<CR>
                nnoremap <silent> <leader>gw :Gwrite<CR>
                nnoremap <silent> <leader>gr :Gremove<CR>
                autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
                autocmd BufReadPost fugitive://* set bufhidden=delete
            " }}}
            NeoBundle 'tpope/vim-git'
            if has('signs')
                NeoBundle 'mhinz/vim-signify'
                let g:signify_mapping_toggle_highlight = 'cog'
                let g:signify_mapping_next_hung = ']h'
                let g:signify_mapping_prev_hung = '[h'
                let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]
                let g:signify_sign_change = '~'
                let g:signify_difftool = 'vimdiff'
            endif
        endif " }}}

        if count(s:settings.plugin_groups, 'markup') " {{{
            NeoBundle 'tpope/vim-liquid'
            NeoBundle 'vim-pandoc/vim-pandoc'
        endif " }}}

        if count(s:settings.plugin_groups, 'latex') " {{{
            NeoBundle 'LaTeX-Box-Team/LaTeX-Box' " {{{
                let g:LatexBox_Folding = 1
                let g:LatexBox_show_warnings = 0
                let g:LatexBox_latexmk_async = 1
                let g:LatexBox_viewer = "open -a Skim"

                nmap <Leader>ce <Plug>LatexChangeEnv
                vmap <Leader>we <Plug>LatexWrapSelection
            " }}}
        endif " }}}

        if count(s:settings.plugin_groups, 'web') " {{{
            NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
            NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html']}}
            NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','html']}}
            NeoBundleLazy 'tpope/vim-haml', {'autoload':{'filetypes':['haml']}}
            NeoBundleLazy 'jQuery', {'autoload':{'filetypes':['html','javascript']}}
            NeoBundle 'leshill/vim-json'
        endif " }}}

        if count(s:settings.plugin_groups, 'python') " {{{
            NeoBundleLazy 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}} " {{{
                let g:jedi#show_call_signatures = 0
                let g:jedi#popup_on_dot = 0
            " }}}
        endif " }}}

        if count(s:settings.plugin_groups, 'go') "{{{
            set rtp+=$GOROOT/misc/vim
            NeoBundleLazy 'jnwhiteh/vim-golang', {'autoload':{'filetypes':['go']}}
            NeoBundleLazy 'nsf/gocode', {'autoload': {'filetypes':['go']}, 'rtp': 'vim'}
        endif "}}}

        if count(s:settings.plugin_groups, 'osx') " {{{
            NeoBundleLazy 'zhaocai/applescript.vim', {'autoload':{'filetypes':['applescript']}}
            NeoBundleDepends 'rizzatti/funcoo.vim'
            NeoBundleLazy 'rizzatti/dash.vim', {'autoload':{'commands':[ 'Dash', 'Dash!', 'DashKeywords', 'DashSettings' ]}, 'depends': 'rizzatti/funcoo.vim' } " {{{
                nmap <silent> <leader>d <Plug>DashSearch
                vmap <silent> <leader>d <Plug>DashSearch
            " }}}

            if count(s:settings.plugin_groups, 'latex')
                NeoBundleLazy 'keflavich/macvim-skim', {'autoload':{'filetypes':['latex','tex']}} " {{{
                    let g:macvim_skim_app_path = "/Applications/Skim.app"
                " }}}
            endif
        endif " }}}

        if count (s:settings.plugin_groups, 'java') " {{{
            NeoBundleLazy 'yuratomo/java-api-complete', {'autoload':{'filetypes':['java']}}
            NeoBundleLazy 'yuratomo/java-api-javax', {'autoload':{'filetypes':['java']}}
            NeoBundleLazy 'yuratomo/java-api-org', {'autoload':{'filetypes':['java']}}
            NeoBundleLazy 'yuratomo/java-api-sun', {'autoload':{'filetypes':['java']}}
            NeoBundleLazy 'yuratomo/java-api-servlet2.3', {'autoload':{'filetypes':['java']}}
            NeoBundleLazy 'yuratomo/java-api-android', {'autoload':{'filetypes':['java']}}
        endif " }}}

        if count(s:settings.plugin_groups, 'misc') " {{{
            NeoBundleLazy 'tpope/vim-scriptease', {'autoload':{'filetypes':['vim']}}
            NeoBundleLazy 'Shougo/vimshell.vim', {'autoload':{'commands':[ 'VimShell', 'VimShellInteractive' ]}} "{{{
                if s:is_macvim
                    let g:vimshell_editor_command='mvim'
                else
                    let g:vimshell_editor_command='vim'
                endif
                let g:vimshell_right_prompt='getcwd()'
                let g:vimshell_temporary_directory='~/.vim/cache/vimshell'
            "}}}
            NeoBundleLazy 'zhaocai/GoldenView.Vim', {'autoload':{'mappings':['<Plug>ToggleGoldenViewAutoResize']}} "{{{
                let g:goldenview__enable_default_mapping=0
                nmap <F4> <Plug>ToggleGoldenViewAutoResize
                nmap <leader>- <Plug>ToggleGoldenViewAutoResize
            "}}}
            NeoBundle 'milkypostman/vim-togglelist' " {{{
                nmap <silent> <F11> :call ToggleLocationList()<CR>
                nmap <silent> <F12> :call ToggleQuickfixList()<CR>
            " }}}
        endif " }}}
     " }}}

     filetype plugin indent on
" }}}

" Keymaps {{{
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
        " inoremap <Down> <C-o>gj
        " inoremap <Up> <C-o>gk

        nnoremap Y y$

        " visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv

        " Quick mappings for 0 and $
        noremap H 0
        noremap L $

        nmap [t :tabprevious<CR>
        nmap [T :tabfirst<CR>
        nmap ]t :tabnext<CR>
        nmap ]T :tablast<CR>
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
    
    " Funktionstasten {{{
        " Help Key!
        nnoremap <F1> :vert help<CR>

        nmap <silent> <F11> :call ToggleLocationList()<CR>
        nmap <silent> <F12> :call ToggleQuickfixList()<CR>
    " }}}
" }}}

" Finishing up {{{
    silent! exec 'colorscheme '.s:settings.colorscheme
    NeoBundleCheck
" }}}
