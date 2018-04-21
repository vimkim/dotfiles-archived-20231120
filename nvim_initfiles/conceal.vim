""" lambda conceal for lisp family (lambdify for python, etc.)
" Strange: neovim-remote does not work with lisp conceal (while it works with lamdbify)
" Solved: use vim-lisp-conceal plugin. This file is commented out.

"https://github.com/DisassociationForComputingMachinery/vim-lisp-conceal/blob/master/after/syntax/lisp.vim
if exists('g:no_lisp_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax keyword lispNiceOperator member conceal cchar=∈
syntax keyword lispNiceOperator or conceal cchar=∨
syntax keyword lispNiceOperator and conceal cchar=∧
syntax keyword lispNiceOperator not conceal cchar=¬
syntax keyword lispNiceOperator + conceal cchar=∑
syntax keyword lispNiceOperator sqrt conceal cchar=√
syntax keyword lispNiceOperator pi conceal cchar=π
syntax keyword lispNiceOperator lambda conceal cchar=λ

hi link lispNiceOperator Operator
hi! link Conceal Operator

setlocal conceallevel=1
