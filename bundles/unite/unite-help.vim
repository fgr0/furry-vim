" Bundle file for furry-vim
"
" NAME: Unite-Help
" DESC: help source for unite.vim 
" URL:  http://relaxedcolumn.blog8.fc2.com/

NeoBundleLazy 'Shougo/unite-help', {'autoload':{'unite_sources':'help'}}

nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
