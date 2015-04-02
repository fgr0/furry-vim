" Bundle file for furry-vim
"
" NAME: Neocomplcache
" DESC: Ultimate auto-completion system for Vim
" URL:  http://www.vim.org/scripts/script.php?script_id=2620

" Neocomplcache is outdated, but its replacement requires lua
" So, if lua is present do not load this plugin
if has('lua')
    finish
endif

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/context_filetype.vim'

let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_auto_close_preview = 1

" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown,pandoc setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
" autocmd FileType python setlocal omnifunc=jedi#complete
" autocmd FileType go setlocal omnifunc=gocomplete#Complete

set completeopt-=preview

" " Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
    let g:neocomplcache_omni_patterns = {} 
endif 

if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif

" let g:neocomplcache_omni_patterns.python = '[^. \t]\.\w*'
" let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
" let g:neocomplcache_force_omni_patterns.go = '\h\w*\.\?'

if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
endif

let g:neocomplcache_same_filetype_lists.c = 'cpp,h'
let g:neocomplcache_ctags_program = "/usr/local/bin/ctags"

" Plugin key-mappings.
vmap <TAB>     <Plug>(neosnippet_expand_target)

inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>     neocomplcache#smart_close_popup() . "\<C-h>"

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    " return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
