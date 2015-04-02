" Bundle file for furry-vim
"
" NAME: Tagbar
" DESC: Vim plugin that displays tags in a window, ordered by scope 
" URL:  http://majutsushi.github.com/tagbar/

NeoBundleLazy 'majutsushi/tagbar', {'autoload':{'commands':'TagbarToggle'}}

nmap <F6> :TagbarToggle<CR>
