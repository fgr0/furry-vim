" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:"
" Settings for Colors and Themeing


" GUI Options {
    if has('gui_running')
        set guifont=Sauce\ Code\ Powerline\ Light:h11

        set guioptions=mcg
        set transparency=5

        if has('gui_macvim')
            set fuopt+=maxvert,maxhorz

            let macvim_hig_shift_movement=1
        endif
    endif
" }

" Terminal {
    if  !(&term =~ 'screen-256color') && !has('gui_running')
        set term=xterm-256color
    endif
    set t_Co=256

    if &term =~ 'xterm'
        if &termencoding == ''
            set termencoding=utf-8
        endif

        set restorescreen
    endif
" }

" Theme & Customization {
    set background=dark
    silent! colorscheme badwolf

    " Set Highlighting Options
    hi LineNR ctermfg=237 
    hi Folded ctermfg=darkgrey

    " highlight lines in Sy and vimdiff etc.)
    highlight DiffAdd           cterm=bold ctermbg=1 guibg=#004225
    highlight DiffDelete        cterm=bold ctermbg=5 guibg=#343434
    highlight DiffChange        cterm=bold ctermbg=9 guibg=#7C0A02

    " highlight signs in Sy
    highlight SignifySignAdd    cterm=bold ctermfg=155 guifg=#aeee00
    highlight SignifySignChange cterm=bold ctermfg=215 guifg=#ffa724
    highlight SignifySignDelete cterm=bold ctermfg=9 guifg=#7C0A02
    highlight SignifyLineAdd    cterm=bold ctermfg=155 guifg=#aeee00
    highlight SignifyLineChange cterm=bold ctermfg=215 guifg=#ffa724
    highlight SignifyLineDelete cterm=bold ctermfg=9 guifg=#7C0A02
    
" }
