" Bundle file for furry-vim
"
" NAME: Latex-Box
" DESC: Lightweight Toolbox for Latex
" URL:  https://github.com/LaTeX-Box-Team/LaTeX-Box

NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box', {'autoload':{'filetypes':['latex','tex']}}

let g:LatexBox_Folding = 1
let g:LatexBox_show_warnings = 0
let g:LatexBox_latexmk_async = 1
let g:LatexBox_viewer = "open -a Skim"

nmap <Leader>ce <Plug>LatexChangeEnv
vmap <Leader>we <Plug>LatexWrapSelection
