" Bundle file for furry-vim
"
" NAME: Markdown for Vim
" DESC: A complete environment to create Markdown files with a syntax highlight
"       that doesn't suck!
" URL:  https://github.com/gabrielelana/vim-markdown

NeoBundle 'gabrielelana/vim-markdown', {'autoload':{'filetypes':['markdown','pandoc']}}

let g:markdown_mapping_switch_status = '<Leader>s'
let g:markdown_enable_insert_mode_mappings = 0
