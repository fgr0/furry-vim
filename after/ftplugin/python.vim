setlocal commentstring=#\ %s
let b:bib_ftplugin = 1
if executable('python3')
    call SingleCompile#ChooseCompiler('python', 'python3')
endif
