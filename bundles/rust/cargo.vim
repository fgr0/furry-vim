" Bundle file for furry-vim
"
" NAME: Cargo
" DESC: Rust Cargo command bindings
" URL:  https://github.com/timonv/vim-cargo

" Use NeoBundle to add the plugin
" refer to :h neobundle for Options/Settings
NeoBundle 'timonv/vim-cargo'

" Set plugin options like mappings after this point
" WARN: things like 'call some#plugin#function()' will not! work in this file,
" because the plugins are only loaded after all bundle.vim files have been
" parsed. Use the *.after.vim file to call such functions.

" function to determine if Cargo.toml is present
function! s:find_cargo_project()
    if findfile("Cargo.toml", '.;$HOME', 1) != ""
        " found Cargo.toml
        compiler cargo
        nmap <buffer> <F9> :make build<CR><CR><CR>
        nmap <buffer> <F10> :make test<CR>
    endif
endfunction
au FileType rust call s:find_cargo_project()
