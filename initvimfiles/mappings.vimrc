
"section============================================================================
" MAPPING
"===================================================================================

"Useful Tip:
"- :verbose map <KEY> will tell you if the mapping is already taken by other function.

" LEADER KEY
let mapleader = ","

"ESC
"vmap ,, <ESC>
"imap ,, <ESC>
"cmap ,, <C-c>
"vnoremap fw <ESC>
"inoremap fw <ESC>
"cnoremap fw <C-c>
"vnoremap wf <ESC>
"inoremap wf <ESC>
"cnoremap wf <C-c>

"CURSOR
"cursor moves visual instead of actual line
noremap j gj
noremap k gk

"( ONLY WORKS when the terminal .*shrc file contains: stty -ixon
"SAVE
nnoremap <C-s> :update<CR>
inoremap <c-s> <ESC>:update<CR>
vnoremap <C-s> <esc>:w<CR>gv

"QUIT
" ctrl+q quits all which is not working // now works 
nnoremap <C-q> :q<CR>
inoremap <C-q> <ESC>:q<CR>
")

"DISABLE EX-MODE
:map Q <nop>

"Try quit in insert mode.
inoremap QQ <c-c>:q<cr>
nnoremap QQ <c-c>:q<cr>

"NEW LINE
" insert new line without entering insert mode.
nnoremap <Enter> o<ESC>
" insert new line above the cursor without entering insert mode.
nnoremap <Leader><Enter> O<ESC>
" Unfortunately, a more intuitive  choice of <S-Enter> O<ESC> not working on CLI

"SUDO SAVE
cnoremap sudow w !sudo tee %

"SAVE & QUIT IN INSERT MODE
inoremap ZZ <c-c>ZZ

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

" Map local replace
nnoremap gr gd[{V%::s/<c-r>///gc<left><left><left>
"gd moves to the definition
"[{ bring the cursor to the scope begin
"V% visual-line mode and go to the opposite } thus selecting the whole scope.

" Map global replace
nnoremap gR gD:%s/<c-r>///gc<left><left><left>

"(COMPILE & RUN MAPPING
"- PYTHON
nnoremap <buffer> <leader>py :w<CR>:exec '!python3' shellescape(@%,1)<cr>

"- C,CPP
"Create an executable file named a.out.
nnoremap <leader>gcc :w <CR>:!gcc-6 % && ./a.out <CR>
nnoremap <leader>gpp :w <CR>:!g++-6 % && ./a.out <CR>
nnoremap <leader>g++ :w <CR>:!g++-6 % && ./a.out <CR>
"IMPORTANT: if bugs occured, change gcc-6 to gcc
" creates an executable file that has the same name with its .c file
""map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
")

"Replace Windows ^m enter return into Unix
nnoremap <leader>winm :%s/\r/\r/g<CR>

"Buffer shortcuts
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
nnoremap gd :bd<cr>

"Line-opeation shortcut
nnoremap gw $
nnoremap gb ^
vnoremap gw $h

"Add space in normal mode
nnoremap <space> i<space><esc>

"Y behaves y$, like C or D, instead of yy
nnoremap Y y$

" put date on document
cnoremap date :put =strftime('%Y-%b-%d %a %T')

" EXPERIMENTAL
" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>

"fugitive alias
cnoremap gst Gstatus
cnoremap gad Gwrite
cnoremap gco Gcommit -m "
cnoremap gps Gpush

" command to show the file path
cnoremap filepath echo expand('%:p')<cr>
cnoremap fullpath echo expand('%:p')<cr>

" mapping for replace / substitute
cnoremap repl %s/
cnoremap subs %s/

" put date on document
cnoremap date put =strftime('%Y-%b-%d %a %T')
