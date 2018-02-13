" lisp-family + scheme
"Plug 'kovisoft/slimv'
if has('mac')
    " does not work
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sblc --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
endif
" - this made me install brew sbcl (steel bank common lisp).. ??

Plug 'vim-scripts/paredit.vim'

" scheme
so ~/runtime_config/nvim_initfiles/plugins/lang/scheme.vim
