" Bundle file for furry-vim
"
" NAME: Dash.vim
" DESC: Search Dash.app from Vim
" URL:  https://github.com/rizzatti/dash.vim

if !has('macunix')
    finish
endif

NeoBundle 'rizzatti/funcoo.vim'
NeoBundleLazy 'rizzatti/dash.vim', {'autoload': {
            \ 'commands': [ 'Dash', 'Dash!', 'DashKeywords', 'DashSettings' ]}, 
            \ 'depends': 'rizzatti/funcoo.vim' }

nmap <silent> <leader>d <Plug>Dash
vmap <silent> <leader>d <Plug>Dash
