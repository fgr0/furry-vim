" Bundle file for furry-vim
"
" NAME: neocomplete
" DESC: Next generation completion framework after neocomplcache
" URL:  https://github.com/Shougo/neocomplete.vim

" requires lua support
if !has('lua')
    finish
endif

NeoBundleLazy 'Shougo/neocomplete.vim', { 'autoload':{'insert':1}, 'vim_version':'7.3.885' }

" Start Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#data_directory=expand('~/.vim/cache/neocomplete')

" Use Smartcase
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1

" Insert Delimiter Automatically
let g:neocomplete#enable_auto_delimiter = 1

" Set Completion Options
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_prefetch = 1

" Where is ctags?
let g:neocomplete#ctags_command = '/usr/local/bin/ctags'

" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType java setlocal omnifunc=javaapi#complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
" autocmd FileType python setlocal omnifunc=jedi#complete
" autocmd FileType go setlocal omnifunc=gocomplete#Complete

set completeopt-=preview

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.rust = '[^.[:digit:] *\t]\%(\.\|\::\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

" Same Filetypes
if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.c = 'cpp,d,h'
let g:neocomplete#same_filetypes.cpp = 'c'
let g:neocomplete#same_filetypes.gitconfig = '_'
let g:neocomplete#same_filetypes._ = '_'

" let g:neocomplete#enable_auto_select = 1

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Tab Completion
imap <expr><TAB> pumvisible() ? 
            \ "\<C-n>" : neosnippet#expandable_or_jumpable() ? 
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    " return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
