" Bundle file for furry-vim
"
" NAME: Unite
" DESC: Unite and create user interfaces
" URL:  http://www.vim.org/scripts/script.php?script_id=3396

NeoBundle 'Shougo/unite.vim'

let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 10000

let g:unite_prompt='» '

" To track long mru history.
let g:unite_source_file_mru_long_limit = 3000
let g:unite_source_directory_mru_long_limit = 3000


function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    " inoremap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
    let g:unite_source_grep_recursive_opt=''
endif

" Setting up Prefix Key
nmap <space> [unite]
nnoremap [unite] <Nop>

" File-Search
nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async file/new buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file file_rec/async:!<cr><c-u>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]r :<C-u>Unite -toggle -auto-resize -buffer-name=mru file_mru directory_mru<cr>
nnoremap <silent> [unite]s :<C-u>Unite -toggle -auto-resize -buffer-name=snippets snippet<cr>
nnoremap <silent> [unite]n :<C-u>Unite -toggle -auto-resize -buffer-name=new file/new directory/new<cr>
