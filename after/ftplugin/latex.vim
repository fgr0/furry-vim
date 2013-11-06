if executable('latexmk')
    call SingleCompile#SetCompilerTemplate('tex','latexmk','latexmk','latexmk','-pdf','open %<.pdf')
    call SingleCompile#ChooseCompiler('tex', 'latexmk')
endif
nmap <Leader>lt :LatexTOCToggle<CR>
set conceallevel=0
