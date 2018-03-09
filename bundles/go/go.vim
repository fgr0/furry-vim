" Bundle file for furry-vim
"
" NAME: vim-go
" DESC: Go development plugin for Vim
" URL:  https://github.com/fatih/vim-go

" You will want to install gocode:
" go get github.com/nsf/gocode
NeoBundle 'fatih/vim-go'

let g:go_snippet_engine = "neosnippet"
" let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

let g:go_metalinter_command = "--enable=vet --enable=vetshadow --enable=gotype --enable=golint --enable=varcheck --enable=structcheck --enable=aligncheck --enable=errcheck --enable=dupl --enable=ineffassign --enable=interfacer --enable=unconvert --enable=goconst --enable=gosimple --enable=staticcheck --enable=gas --enable=unparam --enable=unused --aggregate"

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
" autocmd FileType go setlocal 
