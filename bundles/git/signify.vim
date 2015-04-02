" Bundle file for furry-vim
"
" NAME: Vim-Signify
" DESC: Show a VCS diff using Vim's sign column.
" URL:  https://github.com/mhinz/vim-signify 

if !has('signs')
    finish
endif

NeoBundle 'mhinz/vim-signify'

let g:signify_mapping_toggle_highlight = 'cog'
let g:signify_mapping_next_hung = ']h'
let g:signify_mapping_prev_hung = '[h'
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]
let g:signify_sign_change = '~'
let g:signify_difftool = 'vimdiff'
