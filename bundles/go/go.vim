" Bundle file for furry-vim
"
" NAME: vim-go
" DESC: Go development plugin for Vim
" URL:  https://github.com/fatih/vim-go

set rtp+=$GOROOT/misc/vim

" You will want to install gocode:
" go get github.com/nsf/gocode
NeoBundle 'fatih/vim-go'

let g:go_snippet_engine = "neosnippet"
