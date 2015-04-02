" Bundle file for furry-vim
"
" NAME: undotree
" DESC: Display your undo history in a graph.
" URL:  http://www.vim.org/scripts/script.php?script_id=4177

NeoBundleLazy 'mbbill/undotree', { 'autoload' : { 'commands' : 'UndotreeToggle' } }
let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1
nnoremap <F5> :UndotreeToggle<cr>
nnoremap <leader>gt :UndotreeToggle<cr>
