" paren-indentations should be a normal shiftwidth
let b:pyindent_open_paren = '&sw'
let b:pyindent_continue = '&sw'
let b:pyident_nested_paren = '&sw'

" open all folds by default
exec "normal zR"

let g:pymode_lint_unmodified = 1
let g:pymode_lint_checkers = ['pyflakes']

set foldlevelstart=20
