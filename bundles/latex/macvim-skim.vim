" Bundle file for furry-vim
"
" NAME: Macvim-skim
" DESC: Interlink macvim & skim for an integrated LaTeX DE
" URL:  https://github.com/keflavich/macvim-skim

if !has("gui_macvim")
    finish
endif

NeoBundleLazy 'keflavich/macvim-skim', {'autoload':{'filetypes':['latex','tex']}}

let g:macvim_skim_app_path = "/Applications/Skim.app"
