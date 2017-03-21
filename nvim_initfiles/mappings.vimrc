
"section============================================================================
" MAPPING
"===================================================================================

"Useful Tip:
"- :verbose map <KEY> will tell you if the mapping is already taken by other function.

" LEADER KEY
let mapleader = ","
inoremap <c-e> <esc>
nnoremap <c-e> <esc>
vnoremap <c-e> <esc>

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
"SAVE << this is killing my fingers. I'll change ctrl to leader
nnoremap <leader>s :update<CR>
inoremap <leader>s <ESC>:update<CR>
vnoremap <leader>s <esc>:w<CR>gv
nnoremap <leader>s :update<CR>

"QUIT
" ctrl+q quits all which is not working // now works 
nnoremap <c-q> :q<CR>
inoremap <c-q> <ESC>:q<CR>
nnoremap <c-q> :q<CR>
nnoremap <leader>q :q<CR>
inoremap <leader>q <ESC>:q<CR>
nnoremap <leader>q :q<CR>
")

nnoremap sq <esc>:wq<esc>
"inoremap sq <esc>:wq<esc>
vnoremap sq <esc>:wq<esc>



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
nnoremap :sudow :w !sudo tee > /dev/null %

"SAVE & QUIT IN INSERT MODE
inoremap ZZ <c-c>ZZ

"Suspend
nnoremap <leader>z <esc><c-z>

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

au filetype python nnoremap <buffer> <leader>py :w<CR>:exec '!python3' shellescape(@%, 1)<cr>
au filetype python nnoremap <buffer> <F8> :w<CR>:exec '!python3' shellescape(@%, 1)<cr>
au filetype python nnoremap <buffer> <leader>run :w<CR>:exec '!python3' shellescape(@%, 1)<cr>

"CLisp
au filetype lisp nnoremap <buffer> <F8> :w<CR>:exec '!clisp' shellescape(@%, 1)<cr>

"- C,CPP
"Create an executable file named a.out.
"noremap <leader>gcc :w <CR>:!gcc-6 % && ./a.out <CR>
"noremap <leader>gpp :w <CR>:!g++-6 % && ./a.out <CR>
"noremap <leader>g++ :w <CR>:!g++-6 % && ./a.out <CR>
"IMPORTANT: if bugs occured, change gcc-6 to gcc
" creates an executable file that has the same name with its .c file
au filetype c nnoremap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
au filetype c nnoremap <leader>cpp :w <CR> :!gcc % -o %< && ./%< <CR>
")

"Replace Windows ^m enter return into Unix
nnoremap <leader>winm :%s/\r/\r/g<CR>

"Buffer shortcuts
nnoremap ,bn :bn<cr>
nnoremap ,bp :bp<cr>
nnoremap ,bd :bd<cr>
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

" EXPERIMENTAL
" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>

" highlight last inserted text // seems like not working? for me?: It does not work if file is saved. I escape the file using <c-s>. That was the reason this does not work.
"nnoremap gV `[v`]
"set timeoutlen=1000 " still the above command does not properly work << not required anymore
"set ttimeoutlen=10 " 



" visual select whole line except for the carriage return (enter) <c-r>
nnoremap gwb ^v$h

"fugitive alias
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gad :Gwrite<cr>
nnoremap <leader>gap :Git add -p %<cr>
nnoremap <leader>ap :Git add -p %<cr>
nnoremap <leader>gco :Gcommit --verbose<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>cvc :Gcommit --verbose<cr>
nnoremap <leader>gps :Gpush<cr>
nnoremap <leader>gdi :Gvdiff<cr>
nnoremap <leader>di :Gvdiff<cr>
" not fugitive but useful for visual select + stage
vnoremap dp :diffput<cr>

" #############################
" Extra personal aliases or shortcuts (informal)
" #############################
" command to show the file path
nnoremap :filepath :echo expand('%:p')<cr>
nnoremap :fullpath :echo expand('%:p')<cr>

" mapping for replace all / substitute all 
nnoremap :repa :%s/
nnoremap :repl :%s/
nnoremap :suba :%s/
nnoremap :subs :%s/

" put date on document timestamp
nnoremap :date :put =strftime('%Y-%b-%d %a %T')<cr><esc>
inoremap :date <esc>:put =strftime('%Y-%b-%d %a %T')<cr><esc>

" FZF
nnoremap <leader>fz :FZF 

nnoremap :sovimrc :so $MYVIMRC<cr>

let g:BASH_Ctrl_j = 'off' " does not work
let g:ZSH_Ctrl_j = 'off'

" ,pa acts the same as pasting system clipboard
nnoremap <leader>pa "*p
"inoremap <c-r> <c-r>* don't know why I did this


inoremap <c-BS> <DEL>

nnoremap U :echo "<< ===== CHECK CAPSLOCK =====>>"<cr>

nnoremap ; :

