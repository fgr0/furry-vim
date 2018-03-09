" vim: fdm=marker fdl=1 ts=4 sts=4 sw=4 ft=vim
" Notes {{{
"
" Sets keyboard mappings
"
" Author:   Franz Greiling
" Date:     2015-04-03
"
" Note: This repository is a personal vim configuration and not intended for
"   widespread use. While it is highly adaptable, it is recommended that one
"   cherrypicks the parts they want and understand
"
" Url:      https://github.com/laerador/furry-vim 
" }}}


inoremap jk <esc>

" Simpler paste
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

" Movement {{{ {{{
    " Easier Move between Splits
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h

    " Easier Movement between wraped lines
    noremap j gj
    noremap k gk
    noremap 0 g0
    noremap $ g$

    nnoremap Y y$

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Quick mappings for 0 and $
    noremap H 0
    noremap L $
" }}}

" Code Folding {{{
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
" }}}

" Fast editing & saving of the vimrc
map <leader>ev :e! ~/.vimrc<CR>
map <leader>sv :source ~/.vimrc<CR>

" Search
nnoremap <silent><leader>n :noh<CR>

" Spell checking {{{
    nmap <silent> <leader>sp :set spell!<cr>
    nmap <leader>sd :set spelllang=de_20<cr>
    nmap <leader>se :set spelllang=en_us<cr>
    nmap <leader>z 1z=
" }}}

" Adjust viewports to the same size
map <Leader>= <C-W>=

" Display Highlighing Group under cursor
map <Leader>hg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
