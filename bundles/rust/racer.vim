" Bundle file for furry-vim
"
" NAME: Racer
" DESC: Rust Code Completion utility
" URL:  https://github.com/phildawes/racer

if !executable('racer')
    finish
endif

" Use NeoBundle to add the plugin
" refer to :h neobundle for Options/Settings
NeoBundle 'phildawes/racer'

" Set plugin options like mappings after this point
" WARN: things like 'call some#plugin#function()' will not! work in this file,
" because the plugins are only loaded after all bundle.vim files have been
" parsed. Use the *.after.vim file to call such functions.
let g:racer_cmd = exepath('racer')
let $RUST_SRC_PATH=expand("~/.local/rust/src/")
