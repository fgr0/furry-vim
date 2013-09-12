" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:"
" Settings for Colors and Themeing

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
