" Bundle file for furry-vim
"
" NAME: SingleCompile
" DESC: A Vim plugin making it more convenient to compile or run single source
"       files
" URL:  http://singlecompile.topbug.net/

NeoBundle 'xuhdev/SingleCompile'

let g:SingleCompile_usedialog = 0
let g:SingleCompile_menumode = 0
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_showquickfixifwarning = 1
let g:SingleCompile_silentcompileifshowquickfix = 1
let g:SingleCompile_showresultafterrun = 1 

nmap <F9> :SCCompile<CR><CR>
nmap <F10> :SCCompileRun<CR><CR>
nmap <S-F10> :SCCompileRunAsync<CR>
nmap <S-F11> :SCViewResult<CR>
