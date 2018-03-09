" Bundle file for furry-vim
"
" NAME: Rust
" DESC: Vim support for Rust file detection and syntax highlighting
" URL:  https://github.com/wting/rust.vim

" Use NeoBundle to add the plugin
" refer to :h neobundle for Options/Settings
NeoBundle 'rust-lang/rust.vim'

" Set plugin options like mappings after this point
hi def link rustModPathSep    Include
let g:rust_recommended_style = 0
let g:rust_fold = 1
