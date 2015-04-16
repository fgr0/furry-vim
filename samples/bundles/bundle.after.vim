" Bundle file for calls after neobundle#end()
"
" NAME: Name of the Bundle
" BELONGS TO: group/name.vim

" Use this file to set any options which need to be set after the plugin has
" loaded, like 'call some#plugin#function()'. You should also wrap them inside a
" try-catch block, since they will still fail, if a plugin is not jet installed
" (only if it is supposed to be installed) or if it is broken (by an update for
" example)

try " will fail if bundle is not installed/broken
    " put your function calls here
catch 
    " silent fail
endtry
