" Bundle file for furry-vim
"
" NAME: togglelist.vim
" DESC: Functions to toggle the [Location List] and the [Quickfix List] windows
" URL:  https://github.com/milkypostman/vim-togglelist

NeoBundle 'milkypostman/vim-togglelist'

nmap <silent> <F11> :call ToggleLocationList()<CR>
nmap <silent> <F12> :call ToggleQuickfixList()<CR>
