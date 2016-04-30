" paren-indentations should be a normal shiftwidth
let b:pyindent_open_paren = '&sw'
let b:pyindent_continue = '&sw'
let b:pyident_nested_paren = '&sw'

" open all folds by default
exec "normal zR"

let b:syntastic_checkers = ['flake8']
let b:syntastic_python_flake8_show_pep8='true'
let b:syntastic_python_flake8_max_line_length='131'

set foldlevelstart=20

" rathan than binding K to Vman like it is in my vimrc, bind it to pydoc. we
" will prompt for a python module or class, since what the user needs to look
" up will likely *not* be the current word
nmap K  :Pydoc <space>
vmap K  :Pydoc <space>
