"(FILETYPE
filetype plugin indent on
" turn off auto commenting when <cr>
"autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o 
" Opposite to above, turn on auto commenting 
autocmd FileType * setlocal formatoptions +=cro
" Check the status by set formatoptions?, then you would see jql

" Syntax of these languages is fussy over tabs Vs spaces - by VimCast
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 noexpandtab

" Customizations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
" Turn on auto listing
autocmd FileType markdown setlocal formatoptions +=r formatoptions +=o
" Anki '- enter' autolisting not working
"add *.anki as a file extension
au BufNewFile,BufRead *.anki set filetype=anki
" add anki comments and format options
autocmd FileType anki setlocal formatoptions +=r formatoptions +=o formatoptions +=l formatoptions +=n comments+=b:*,b:+,b:>,
" Check the status by set formatoptions? and then you will see jqtlncro

" Enter insert mode automatically when editing git commit messages 
autocmd FileType gitcommit 1 | startinsert "by benjifisher from so
")

"Spell check for txt, md, anki
autocmd filetype text setlocal spell
autocmd filetype markdown setlocal spell
autocmd filetype anki setlocal spell

"(SYNTAX ENABLE
if !exists("g:syntax_on")
    syntax enable
endif " by Andy Ray from SO
")

