" Bundle file for furry-vim
"
" NAME: Unite-Tag
" DESC: Tags source for unite.vim
" URL:  http://relaxedcolumn.blog8.fc2.com/

NeoBundle 'tsukkee/unite-tag'

nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
