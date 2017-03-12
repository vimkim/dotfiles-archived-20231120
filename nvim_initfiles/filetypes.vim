"(FILETYPE
filetype plugin indent on
" turn off auto commenting when <cr>
"autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o 
" Opposite to above, turn on auto commenting 
autocmd FileType * setlocal formatoptions +=cro comments-=fb:- comments+=b:-

" Check the status by set formatoptions?, then you would see jql

" Syntax of these languages is fussy over tabs Vs spaces - by VimCast
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab "the original settings were noexpandtab but this does not work for yaml files for tmuxinator

" Customizations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
" Turn on auto listing
autocmd FileType markdown setlocal formatoptions +=r formatoptions +=o comments+=b:00. comments-=b:- comments+=b:-\ [\ ] comments+=b:-

" {{{ CHECKBOX-VIM 
" Thanks to Jonas Kramer (jkramer) for his 'checkbox.vim' plugin 
" And modom for his pull request
if exists('g:loaded_checkbox') " what is the usage of this?
	" finish
endif

"fu! checkbox#ToggleCB()
fu! ToggleCB()
	let line = getline('.')

	if(match(line, "\\[ \\]") != -1)
		let line = substitute(line, "\\[ \\]", "[x]", "")
	elseif(match(line, "\\[x\\]") != -1)
		let line = substitute(line, '\[x\]\s*', "", "")
    else 
        let line = substitute(line, '\(^\s*[\*-]\s\)', '\1[ ] ', "")
        "let line = substitute(line, '^\s*[\*-]\s', '\0[ ] ', "") "both works
	endif

	call setline('.', line)
endf

"command! ToggleCB call checkbox#ToggleCB()
autocmd filetype markdown command! ToggleCB call ToggleCB()
"nmap <silent> <leader>tt :ToggleCB<cr>
"autocmd filetype markdown nmap <silent> <leader>tt :ToggleCB<cr> 
" {{{ repeat.vim implementation
autocmd filetype markdown nmap <plug>ToggleCheckBox :ToggleCB<cr>:call repeat#set("\<plug>ToggleCheckBox")<cr>
autocmd filetype markdown nmap <leader>tt <plug>ToggleCheckBox
let g:loaded_checkbox = 1
" }}}
"}}}

"{{ Markdown tab means indent
"fu! IndentTab()
    "let line = getline('.')
    "if(match(line, '^\s*[\*-]\s') != -1)
        " - let line = substitute(line, '^\s*


" Check the status by set formatoptions? and then you will see jqtlncro

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

"add *.anki as a file extension
au BufNewFile,BufRead *.anki set filetype=anki
" add anki comments and format options
autocmd FileType anki setlocal formatoptions +=r formatoptions +=o formatoptions +=l formatoptions +=n comments+=b:*,b:+,b:> comments-=fb:- comments+=b:-
"<leader>anki pastes the clipboard
autocmd Filetype anki nnoremap <leader>anki :set paste<cr>i<c-r>*<esc>:set nopaste<cr>
"above process is automated when opening a new file
function! AnkiAutoPaste()
    set paste
    "! prevents mapping
    """""normal! "*p 
    " removes ^m in win enter
    """""normal! :silent %s/\r/\r/g
    """""Either the above two commands or the below one works fine
    normal! i*
    set nopaste
endfunction
autocmd BufNewFile *.anki call AnkiAutoPaste()
"anki auto copy to clipboard when exit
autocmd Filetype anki nnoremap <c-q> gg"*yG:q<cr>


" Enter insert mode automatically when editing git commit messages 
"autocmd FileType gitcommit 1 | startinsert "by benjifisher from so "error
"when fugitive
