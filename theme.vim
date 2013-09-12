" vim: set foldlevel=0 foldmethod=marker foldmarker={,} ft=vim:"
" Settings for Colors and Themeing


" GUI Options {
    if has('gui_running')
        set guifont=Source\ Code\ Pro\ for\ Powerline:h11

        set guioptions=mcg
        set transparency=10

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
" }
