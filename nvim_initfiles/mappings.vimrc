" ##### mapping #####

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
noremap gj j
noremap gk k
nnoremap gI g^i
au filetype text,markdown nnoremap I g^i
au filetype text,markdown nnoremap gI I
nnoremap gA g$a
au filetype text,markdown nnoremap A g$a
au filetype text,markdown nnoremap gA A
nnoremap go g$a
"au filetype text,markdown nnoremap o g$a
"au filetype text,markdown nnoremap go o
nnoremap gO g^i
"au filetype text,markdown nnoremap O g^i
"au filetype text,markdown nnoremap gO O
"noremap gdd g^dg$
"au filetype text,markdown nnoremap dd g^dg$
"au filetype text,markdown nnoremap gdd dd
noremap gcc g^dg$i
au filetype text,markdown nnoremap cc g^dg$i
au filetype text,markdown nnoremap gcc cc
noremap gC dg$i
au filetype text,markdown nnoremap C dg$i
au filetype text,markdown nnoremap gC C


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
nnoremap <leader>q :bd<CR>
inoremap <leader>q <ESC>:bd<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>w :Gwrite<cr>:Gcommit --verbose<cr>
"nnoremap <c-x><c-c> :q<cr> "does not work, why?
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
"nnoremap <Enter> o<ESC>
" insert new line above the cursor without entering insert mode.
nnoremap <Leader><Enter> O<ESC>
" Unfortunately, a more intuitive  choice of <S-Enter> O<ESC> not working on CLI

"SUDO SAVE
nnoremap ;sudow :w !sudo tee > /dev/null %

"SAVE & QUIT IN INSERT MODE
inoremap ZZ <c-c>ZZ

"Suspend
nnoremap <leader>z <esc><c-z>

" Map Ctrl-Backspace to delete the previous word in insert mode.
" does not work
inoremap <C-BS> <C-W>
" seems terminal does not identify the difference between <c-bs> and <bs>
"inoremap <C-Q> <C-\><C-O>dB

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
au filetype python nnoremap <buffer> <leader>ru :!python3 % <CR>

"CLisp
au filetype lisp nnoremap <buffer> <F8> :w<CR>:exec '!clisp' shellescape(@%, 1)<cr>

"HTML
au filetype html nnoremap <buffer> <leader>ru :!open -a /Applications/Google\ Chrome.app %<cr>

"matlab
au filetype matlab nnoremap <buffer> <leader>ru :MatlabCliOpenInMatlabEditor<cr>

"- C,CPP
"Create an executable file named a.out.
"noremap <leader>gcc :w <CR>:!gcc-6 % && ./a.out <CR>
"noremap <leader>gpp :w <CR>:!g++-6 % && ./a.out <CR>
"noremap <leader>g++ :w <CR>:!g++-6 % && ./a.out <CR>
"IMPORTANT: if bugs occured, change gcc-6 to gcc
" creates an executable file that has the same name with its .c file
au filetype c nnoremap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
au filetype c nnoremap <leader>ru :w <CR> :!gcc % -o %< && ./%< <CR>
au filetype c nnoremap <leader>cpp :w <CR> :!gcc % -o %< && ./%< <CR>
")

"- JAVA
au filetype java nnoremap <F8> :w<cr>:!javac % && java %< <cr>
au filetype java nnoremap <leader>ru <esc>:w<cr>:!javac % && java %< <cr>

"Replace Windows ^m enter return into Unix
nnoremap <leader>enter :%s/\r/\r/g<CR>
nnoremap ;enter :%s/\r/\r/g<CR>

"Buffer shortcuts
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bq :bd<cr>
nnoremap <leader>bf :buffers<CR>:buffer<Space>
"nnoremap gn :bn<cr>
"nnoremap gp :bp<cr>
"nnoremap gd :bd<cr>
"nnoremap gq :bd<cr>

"Line-opeation shortcut
nnoremap gw $
nnoremap gb ^
vnoremap gw $h
" visual select whole line except for the carriage return (enter) <c-r> if followed by h
"nnoremap V 0v$ "not work with easy-motion

"Add space in normal mode "some conflict with ultisnips
"nnoremap <space> i<space><esc>

"Y behaves y$, like C or D, instead of yy
nnoremap Y y$

" EXPERIMENTAL
" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>

" highlight last inserted text // seems like not working? for me?: It does not work if file is saved. I escape the file using <c-s>. That was the reason this does not work.
"nnoremap gV `[v`]
"set timeoutlen=1000 " still the above command does not properly work << not required anymore
"set ttimeoutlen=10 " 




"fugitive alias
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gad :Gwrite<cr>
nnoremap <leader>gwi :Gwrite<cr>
nnoremap <leader>gap :Git add -p %<cr>
nnoremap <leader>ap :Git add -p %<cr>
nnoremap <leader>gco :Gcommit --verbose<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>cvc :Gcommit --verbose<cr>
nnoremap <leader>gps :Gpush<cr>
nnoremap <leader>gdi :Gvdiff<cr>
nnoremap <leader>di :Gvdiff<cr>
" not fugitive but useful for visual select + stage
vnoremap ,dp :diffput<cr>

" #############################
" Extra personal aliases or shortcuts (informal)
" #############################
" command to show the file path
nnoremap ;filepath :echo expand('%:p')<cr>
nnoremap ;fullpath :echo expand('%:p')<cr>
" filepath short
nnoremap ;fp :echo expand('%:p')<cr>
" filename short
nnoremap ;fn :echo expand('%:p')<cr>


" mapping for replace all / substitute all
nnoremap ;repa :%s/
nnoremap ;repl :%s/
nnoremap ;suba :%s/
nnoremap ;subs :%s/
" try to use cgn text object as well, much faster

" put date on document timestamp
nnoremap ;date <esc>:put =strftime('%Y-%b-%d %a %Hh')<cr>kJ<esc>
"inoremap ;date <esc>k<esc>:put =strftime('%Y-%b-%d %a %Hh')<cr><esc>
nnoremap ;time <esc>k:put =strftime('%Y-%b-%d %a %T')<cr><esc>
"inoremap ;time <esc>k<esc>:put =strftime('%Y-%b-%d %a %T')<cr><esc>

nnoremap ;sov :so $MYVIMRC<cr>

let g:BASH_Ctrl_j = 'off' " does not work
let g:ZSH_Ctrl_j = 'off'

" ,pa acts the same as pasting system clipboard
"au filetype text,markdown nnoremap <c-v> <esc>:set paste<cr>"*p<esc>:set nopaste<cr>
"au filetype text,markdown inoremap <c-v> <c-\><c-o>:set paste<cr><esc>"*p<esc>:set nopaste<cr>a
"au filetype text,markdown nnoremap ,vb <c-v>
"inoremap <c-r> <c-r>* don't know why I did this.. so stupid
"au filetype text,markdown vnoremap <leader>co "*y
"au filetype text,markdown vnoremap <c-c> "*y


inoremap <c-BS> <DEL>

nnoremap U :echo "<< ===== CHECK CAPSLOCK =====>>"<cr>

nnoremap ; :

nnoremap ;ffmt <esc>:set fileformat=dos

nnoremap ;ft :set filetype<cr>

nnoremap ;vm :verbose map 

nnoremap ;nl :put =range(

"better indentation
vnoremap > >gv
vnoremap < <gv


" continuous multicolumn scroll
noremap <silent> <Leader>tc :exe AddColumn()<CR>
function! AddColumn()
  exe "norm \<C-u>"
  let @z=&so
  set noscb so=0
  bo vs
  exe "norm \<PageDown>"
  setl scrollbind
  wincmd p
  setl scrollbind
  let &so=@z
endfunction\v useful as it interprets all symbols as special

"nnoremap <silent> <Leader>tc :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
"In order to close this, <c-w><c-c>

nnoremap ;tagen :!ctags -R .

" fold easy - toggle
nnoremap zt zA

" remove trailing whitespace
nnoremap ;rmt :%s/\s\+$//gc<cr>

" easier paste
nnoremap ;<c-v> "*p
inoremap ;<c-v> <esc>"*p
xnoremap ;<c-y> "*y "<c-c> does not work

" emacs style line
nnoremap <c-a> ^
nnoremap <c-e> $

" select last yanked text
nnoremap <leader>V `[v`]

" Ko-lang support " buggy; does not work as expected"
"nnoremap ,ㅇ <esc>:update<cr>
inoremap ,ㅇ <esc>:update<cr> " does not work cuz korean inputs 
"nnoremap ㅣ i
"nnoremap ㅁ a
"nnoremap ㅎㅎ dd
"nnoremap ㅗ h
"nnoremap ㅛ j
"nnoremap ㅜ k
"nnoremap ㅕ l

" markdown header mapping
nnoremap ,# yyp<c-v>$r-<cr>

" vim as a calculator
inoremap ;calc <c-o>yiW<End>=<c-r>=<c-r>0<cr>

"vim navigation enable
"nnoremap j n
"nnoremap k i
"nnoremap l e
"nnoremap n j
"nnoremap e k
"nnoremap i l

nnoremap ,ls :ls<cr>

nnoremap dq d

inoremap ,. <esc>:update<cr>
nnoremap ,. :update<cr>
