" Bundle file for furry-vim
"
" NAME: Unite-Colorscheme
" DESC: A unite.vim plugin
" URL:  https://github.com/ujihisa/unite-colorscheme

NeoBundle 'ujihisa/unite-colorscheme'

nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<cr>
