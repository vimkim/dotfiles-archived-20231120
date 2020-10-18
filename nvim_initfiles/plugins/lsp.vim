Plug 'neoclide/coc.nvim', {'branch': 'release'}
" must not be a string like '~'
let g:coc_config_home=$HOME.'/dkenv/runtime_config/vim'

" No Mapping Found error occurs
"so ~/dkenv/runtime_config/nvim_initfiles/plugins/coc.vim
"

" popup remains after c-c. what to do?
command Redraw :call popup_clear()
nnoremap ,red :Redraw<cr>
nnoremap ;red :Redraw<cr>


Plug 'jackguo380/vim-lsp-cxx-highlight'

"so ~/dkenv/runtime_config/nvim_initfiles/plugins/ycm.vim
