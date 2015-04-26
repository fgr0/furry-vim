" Bundle file for furry-vim
"
" NAME: Rust
" DESC: Vim support for Rust file detection and syntax highlighting
" URL:  https://github.com/wting/rust.vim

" Use NeoBundle to add the plugin
" refer to :h neobundle for Options/Settings
NeoBundle 'rust-lang/rust.vim'

" Set plugin options like mappings after this point
" WARN: things like 'call some#plugin#function()' will not! work in this file,
" because the plugins are only loaded after all bundle.vim files have been
" parsed. Use the *.after.vim file to call such functions.
hi def link rustModPathSep    Include
