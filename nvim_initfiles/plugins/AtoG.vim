" not working
"Plug 'vim-scripts/vim-bgimg'

" FFFFFFFFFF
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" GGGGGGGGGG

"Plug 'raghur/vim-ghost' {'do': ':GhostInstall' }
Plug 'pandysong/ghost-text.vim'
" Spitting "this plugin needs python3 support." everytime.
" for leetcode
" autocmd BufNewFile,BufRead *.txt set filetype=python "does not work
nnoremap ;ftpy :set filetype=python<cr>


