" Bundle file for furry-vim
"
" NAME: Python-mode
" DESC: Vim python-mode. PyLint, Rope, breakpoints from box
" URL:  https://github.com/klen/python-mode

NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}}

let g:pymode_doc = 0
let g:pymode_lint = 0
let g:pymode_virtualenv = 0

let g:pymode_run = 0
let g:pymode_run_bind = "<leader>pr"

let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'sys', 'shutil', 'datetime', 'django']
let g:pymode_rope_show_doc_bind = '<leader>pd'
let g:pymode_rope_goto_definition_bind = '<leader>pg'
let g:pymode_rope_rename_bind = '<leader>rr'
let g:pymode_rope_rename_module_bind = '<leader>r1r'
let g:pymode_rope_organize_imports_bind = '<leader>ro'
let g:pymode_rope_autoimport_bind = '<leader>ra'
let g:pymode_rope_change_signature_bind = '<leader>rs'

let g:pymode_syntax_space_errors = 0
