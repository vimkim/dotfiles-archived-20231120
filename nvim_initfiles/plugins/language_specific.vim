" C
Plug 'vim-scripts/a.vim'
nnoremap ,aa :A<cr>
Plug 'tenfyzhong/vim-gencode-cpp'

" lisp-family + scheme
"Plug 'kovisoft/slimv'
if has('mac')
    " does not work
"let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sblc --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
endif
" - this made me install brew sbcl (steel bank common lisp).. ??


"(( PAREDIT
"Plug 'vim-scripts/paredit.vim'
" bug of this plugin: mess up with julia .jl extension.

" scheme
so ~/dkenv/runtime_config/nvim_initfiles/plugins/lang/scheme.vim

Plug 'JuliaEditorSupport/julia-vim'
Plug 'AtsushiSakai/julia.vim'
autocmd BufRead, BufNewFile *.jl set filetype=julia
" julia-vim plugin is not enough. It does not load auto pairs plugin.

"javascript
so ~/dkenv/runtime_config/nvim_initfiles/plugins/lang/js.vim

"ocaml
so ~/dkenv/runtime_config/nvim_initfiles/plugins/lang/ocaml.vim

" verilog
Plug 'vhda/verilog_systemverilog.vim'
