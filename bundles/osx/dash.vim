" Bundle file for furry-vim
"
" NAME: Dash.vim
" DESC: Search Dash.app from Vim
" URL:  https://github.com/rizzatti/dash.vim

if !has('macunix')
    finish
endif

NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim', { 'depends': 'rizzatti/funcoo.vim' }

nmap <silent> <leader>d <Plug>DashSearch
vmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>dg <Plug>DashGlobalSearch
vmap <silent> <leader>dg <Plug>DashGlobalSearch
