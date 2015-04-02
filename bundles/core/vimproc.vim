" Bundle file for furry-vim
"
" NAME: vimproc
" DESC: Interactive command execution in Vim
" URL:  https://github.com/Shougo/vimproc.vim

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build': {
            \ 'mac': 'make -f make_mac.mak',
            \ 'linux': 'make',
            \ 'unix': 'gmake',
            \ 'cygwin': 'make -f make_cygwin.mak',
            \ 'windows': 'tools\\update-dll-mingw',
            \ },
            \ }
