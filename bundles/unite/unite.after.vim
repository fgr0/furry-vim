" Bundle file for calls after neobundle#end()
"
" NAME: Unite
" BELONGS TO: unite/unite.vim

call unite#filters#matcher_default#use(['matcher_context'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'context.smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
