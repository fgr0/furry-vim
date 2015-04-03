" Bundle file for furry-vim
"
" NAME: NERDTree
" DESC: A tree explorer plugin for vim
" URL:  https://github.com/scrooloose/nerdtree

NeoBundle 'scrooloose/nerdtree'

map <F7> :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

let NERDTreeBookmarksFile               = '~/.vim/cache/NERDTreeBookmarks'

let NERDTreeRespectWildIgnore           = 1
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1

let NERDTreeMouseMode                   = 2
let NERDTreeQuitOnOpen                  = 1
