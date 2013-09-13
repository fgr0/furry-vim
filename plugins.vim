" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:"
" Plugins using NeoBundle

" Setting up NeoBundle {
    " Initializing Vundle {
        if has('vim_starting')
            set rtp+=~/.vim/bundle/neobundle.vim/
        endif

        call neobundle#rc(expand('~/.vim/bundle'))

        " Let NeoBundle manage NeoBundle
        NeoBundleFetch 'Shougo/neobundle.vim'
    " }
    
    " Set Package Groups {
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
" }

" Plugin Groups {
    " Colors {
        if count(g:furry_packages, 'colors')
            if has('python') || has('python3')
                NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
            endif

            NeoBundle 'sjl/badwolf'
            NeoBundle 'roman/golden-ratio'
        endif
    " }

    " Environment {
        if count(g:furry_packages, 'environment')
            NeoBundle 'myusuf3/numbers.vim'
            NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \   'windows' : 'make -f make_mingw32.mak',
                \   'cygwin' : 'make -f make_cygwin.mak',
                \   'mac' : 'make -f make_mac.mak',
                \   'unix' : 'make -f make_unix.mak',
                \   },
                \ }
            NeoBundle 'Shougo/vimshell.vim'

            if has('python') || has('python3')
                NeoBundle 'sjl/gundo.vim'
            endif
        endif
    " }

    " Utility {
        if count(g:furry_packages, 'utility')
            NeoBundle 'Align'
            NeoBundle 'matchit.zip'
            NeoBundle 'tpope/vim-unimpaired'
            NeoBundle 'tpope/vim-surround'
            NeoBundle 'tpope/vim-repeat'
            NeoBundle 'laerador/vim-speeddating'
            NeoBundle 'tomtom/tcomment_vim'
            NeoBundle 'Townk/vim-autoclose'
            NeoBundle 'milkypostman/vim-togglelist'
            NeoBundle 'terryma/vim-multiple-cursors'
        endif
    " }

    " Autocompletion and Snippets {
        if count(g:furry_packages, 'autocompletion')
            NeoBundle 'Shougo/neocomplcache'
            NeoBundle 'Shougo/neosnippet'
        endif
    " }

    " Views {
        if count(g:furry_packages, 'views')
            " CARE! Restore view automates Views
            " This can get some unintendet behavior!
            NeoBundle 'vim-scripts/restore_view.vim'
        endif
    " }

    " Developing & Debugging {
        if count(g:furry_packages, 'devel')
            NeoBundle 'xuhdev/SingleCompile'
            NeoBundle 'scrooloose/syntastic'
        endif
    " }

    " Git {
        if count(g:furry_packages, 'git')
            NeoBundle 'tpope/vim-fugitive'
            NeoBundle 'tpope/vim-git'
            if has('signs')
                NeoBundle 'airblade/vim-gitgutter'
                NeoBundle 'kana/vim-textobj-user'
                NeoBundle 'gilligan/textobj-gitgutter'
            endif
        endif
    " }
    
    " Markup {
        if count(g:furry_packages, 'markup')
            NeoBundle 'tpope/vim-liquid'
            NeoBundle 'vim-pandoc/vim-pandoc'
        endif
    " }

    " LaTeX {
        if count(g:furry_packages, 'latex')
            NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box'
            autocmd FileType latex,tex NeoBundleSource LaTeX-Box
        endif
    " }

    " HTML & CSS {
        if count(g:furry_packages, 'html')
            NeoBundleLazy 'othree/html5.vim'
            autocmd FileType html NeoBundleSource html5.vim
            NeoBundleLazy 'mattn/zencoding-vim'
            autocmd FileType html NeoBundleSource zenconding-vim
            NeoBundleLazy 'hail2u/vim-css3-syntax'
            autocmd FileType css NeoBundleSource vim-css3
            NeoBundleLazy 'tpope/vim-haml'
            autocmd FileType html,haml NeoBundleSource vim-haml
            NeoBundleLazy 'jQuery'
            autocmd FileType html NeoBundleSource jQuery
        endif
    " }

    " Python {
        if count(g:furry_packages, 'python')
            " NeoBundle 'klen/python-mode'
            NeoBundleLazy 'davidhalter/jedi-vim'
            autocmd FileType py NeoBundleSource jedi-vim
        endif
    " }

    " Go {
        if count(g:furry_packages, 'go')
            set rtp+=$GOROOT/misc/vim
            NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
        endif
    " }

    " OS X {
        if count(g:furry_packages, 'osx')
            NeoBundleLazy 'zhaocai/applescript.vim'
            autocmd FileType scpt NeoBundleSource applescript.vim

            if count(g:furry_packages, 'latex')
                NeoBundle 'keflavich/macvim-skim'
            endif
        endif
    " }

    " Ctags {
        if executable('ctags') && count(g:furry_packages, 'ctags')
            NeoBundle 'majutsushi/tagbar'
            NeoBundle 'xolox/vim-misc'
            NeoBundle 'xolox/vim-easytags'
        endif
    " }
" }

" Finishing Up {
    " Let the Magic happen
    filetype plugin indent on

    " NeoBundleCheck
" }

" Configuring Plugins {
    " Define Leaders {
        let mapleader = ","
        let maplocalleader = '\\'
    " }
    
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
