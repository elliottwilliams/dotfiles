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
