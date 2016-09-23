
"section============================================================================
" MAPPING
"===================================================================================

"Useful Tip:
"- :verbose map <KEY> will tell you if the mapping is already taken by other function.

" LEADER KEY
let mapleader = ","

"ARROWS FOR COLEMAK
"noremap k j
"noremap h k
"noremap j h

"ESC
vmap ,, <ESC>
imap ,, <ESC>
cmap ,, <C-c>
vmap fw <ESC>
imap fw <ESC>
cmap fw <C-c>
vmap wf <ESC>
imap wf <ESC>
cmap wf <C-c>

"CURSOR
"cursor moves visual instead of actual line
noremap j gj
noremap k gk

"( ONLY WORKS when the terminal .*shrc file contains: stty -ixon
"SAVE
nnoremap <C-s> :update<CR>
inoremap <c-s> <ESC>:update<CR>a
vnoremap <C-s> <esc>:w<CR>gv

"QUIT
" ctrl+q quits all which is not working
nnoremap <C-q> :qa<CR>
")

"NEW LINE
" insert new line without entering insert mode.
nnoremap <Enter> o<ESC>
" insert new line above the cursor without entering insert mode.
nnoremap <Leader><Enter> O<ESC>
" Unfortunately, a more intuitive  choice of <S-Enter> O<ESC> not working on CLI

"SUDO SAVE
cnoremap sudow w !sudo tee %

"(COMPILE & RUN MAPPING
"- PYTHON
nnoremap <buffer> <leader>py :w<CR>:exec '!python3' shellescape(@%,1)<cr>

"- C,CPP
"Create an executable file named a.out.
nnoremap <leader>gcc :w <CR>:!gcc-6 % && ./a.out <CR>
nnoremap <leader>g++ :w <CR>:!g++-6 % && ./a.out <CR>
"IMPORTANT: if bugs occured, change gcc-6 to gcc
" creates an executable file that has the same name with its .c file
""map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
")


" EXPERIMENTAL
" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>


