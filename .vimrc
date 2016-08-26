"
" Created by dequ[_macOS,_WSL]
" All comments copied are referenced with '-by John Doe' format.
" partly referred to Janus .vimrc
"
"===================================================================================
"TABLE OF CONTENTS
"- TIPs & Reminders
"- NECESSARY
"- ACCESSORY
"- MAPPING
"- SCHEME
"- PLUGIN
"- MISC

"===================================================================================
" Tips 
"===================================================================================
" - :windo makes all windows do the same command
" - Look up the register file by :reg
" - Paste from registry by using "<char>p
" - Copy to registry by using "<char>y (visual select might be useful)
" - Change the case of a letter by [visual_mode] + (u,U,~)
" - ctags should be updates using command: $ ctags -R .
" - RECOVERY: if .swp file was created, you can recover that file by $vim -r
"   <filename>
"   Or, just press R and it sometimes works. Save the file with different
"   name (or backup the original file with different name and then recover).
"   $ vimdiff filename1 filename2 << this is a helpful tool
" - <c-w><c-w> goes to the next window, while <c-w><c-p> goes to the last
"   window.
" - <c-w>+j,h,k,l works.
" - G; will bring you to the last location of the cursor.


"===================================================================================
" NECESSARY
"===================================================================================
" * Tips
" - You can determine the status of a variable <myvar> by typing :set myvar?

set nocompatible
" For Pathogen, "This is what you should have at the top of your ~/.vimrc" - by romainl 
filetype off
filetype plugin indent off
syntax off
" now go down to the plugin section and see these turned on
let g:minimap_close='<leader>gc'
" mouse
set mouse=a
" indenting
set smartindent
" tab control
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
" Show partial commands in the last line of the saoc 
<<<<<<< HEAD
set showcmd 
=======
set showcmd
>>>>>>> ea9b35d124080e611a0d204ac620cb3f97a21e0d
" Search pattern becomes case-insensitive.
set ignorecase
" Search pattern becomes case-insensitive when it has lowercase letters only. 
" * This should be turned on together with :set ignorecase.
set smartcase
" scrolling control
set scrolloff=7
" line number
set number
" relative line number
set relativenumber
" make backspace work like most other apps. Alternatives: set backspace=2
set backspace=indent,eol,start 
" MACVIM ZOOM
set guifont=Meslo\ LG\ M\ DZ\ For\ Powerline:h22
" visual bell
set vb
" show invisibles
set list
set listchars=tab:▸\ ,eol:¬
" tells vim to look for a tags file in the directory of the current file, in
" the current directory and up and up until your $HOME (that's the meaning of
" the semicolon), stopping on the first hit. -by romainl from SO
""set tags=./tags;tags; -disabled for easytags
" change working directory as the file location????
"set autochdir
"Highlight selected word on cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" Better command-line completion
set wildmenu
set wildmode=list:longest,full
" Have Vim jump to the last position when a file reopened.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"===================================================================================
" ACCESSORY
"===================================================================================
" Asks before quit without save
set confirm
" set command line height to 2
set cmdheight=2
" toggle paste mode
set pastetoggle=<F11>
" Annoying
set laststatus=2
" emphasize the line which the cursor is on 
set cursorline
" ??
set showmatch
" ??
set mat=2
" ??
set incsearch
" Highlight searches (use <C-L> to temporarily turn off highligting)
set hlsearch
" ??
set ruler
" HTML indenting issue
let g:html_indent_inctags = "html,body,head,tbody"
" ??
set showmode
set showcmd
set hidden
"zc will close the fold, zo will open the fold, za will toggle the fold under
"the current cursor.
"zC, zO, zA applies the same, recursively.
"zR opens all folds, zM closes all folds
set foldmethod=indent


"===================================================================================
" MAPPING
"===================================================================================
" * :verbose map <KEY> will tell you if the mapping is already taken by other
" function.
"
" ESC
vmap ,, <ESC> 
imap ,, <ESC>
cmap ,, <C-c>

" LEADER KEY
let mapleader = ","

" CURSOR
" cursor moves visual instead of actual line
noremap j gj
noremap k gk

" ONLY WORKS when terminal rc files contain: stty -ixon
"{{{{{{{{{{{{{{{{{{{{
" SAVE
" ctrl+s saves
nnoremap <C-s> :update<CR>
inoremap <c-s> <ESC>:update<CR>
vnoremap <C-s> <esc>:w<CR>gv

" QUIT
" ctrl+q quits all which is not working
nnoremap <C-q> :qa<CR>
"}}}}}}}}}}}}}}}}}}}}

" NEW LINE 
" insert new line without entering insert mode.
nnoremap <Enter> o<ESC>
" insert new line above the cursor without entering insert mode.
nnoremap <Leader><Enter> O<ESC>
" Unfortunately, a more intuitive  choice of <S-Enter> O<ESC> not working on CLI

" COMPILE & RUN MAPPING
" - Python: "If F9 is pressed then run python
" rp : run python code
nnoremap <buffer> <leader>rp :w <CR> :exec '!python3' shellescape(@%,1)<cr>
" - C,CPP: "If F8 is pressed then run gcc and a.out
" creates an executable file named a.out
" crc : compile and run c code / ccp : compile and run cpp code
nnoremap <leader>crc :w <CR>:!gcc % && ./a.out <CR>
nnoremap <leader>ccp :w <CR>:!gcc % && ./a.out <CR>
" creates an executable file that has the same name with its .c file
""map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" EXPERIMENTAL
" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>
" window split and scrollbind (experimental)
""map <Leader>wsb = :lclose:vsplit:windo set scrollbind:Errors


"===================================================================================
" SCHEMES 
"===================================================================================
" MONOKAI BEGIN
"colorscheme monokain
" MONOKAI END
"gruvbox BEGIN
""colorscheme gruvbox
""set bg=dark
"GRUVBOX END
"MOLOKAI BEGIN
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"MOLOKAI END


"===================================================================================
" PLUGINS
"===================================================================================
" * Tips
" - You can change the plugin variable within vim command mode by just typing
"   let g:something_blah=foo

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled=['neocomplete.vim']
" PATHOGEN
execute pathogen#infect()
" this helptags function is decprecated, but who cares. I'm lazy.
execute pathogen#helptags()   
filetype plugin indent on
syntax on
" * IMPORTANT: It is required that the user should run :Helptags command everytime a
" new plugin is installed. This method helps trigger :help <plugin_name>
" function. -by tpope, the creater of pathogen.

" NEOCOMPLETE
""let g:neocomplete#enable_at_startup = 1
""let g:neocomplcache_enable_cursor_hold_i=1
"for neocomplete, enable <TAB>: completion. It also helps tabs recover its
"original functionality.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
""            \ <SID>check_back_space() ? "\<TAB>" :
""            \ neocomplete#start_manual_complete()
""function! s:check_back_space() "{{{
"    h""let col = col('.') - 1
"    ""return !col || getline('.')[col - 1]  =~ '\s'
""endfunction"}}}

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CTRLP.VIM
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map= '<leader>p'
let g:ctrlp_cmd = 'ctrlp'

" TAGBAR
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_width=30
autocmd VimEnter * Tagbar


" SEMANTIC HIGHLIGHT
nnoremap <Leader>h :SemanticHighlightToggle<cr>
""let g:semanticTermColors = [1,2,3,9,10,12,13,14,15,125]
""autocmd VimEnter * SemanticHighlightToggle
" also highlight words starting with $ in javascript.
""autocmd FileType javascript setlocal iskeyword+=$


" NERDTREE
let NERDTreeShowHidden=1

" AIRLINE
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" AUTOCMD
""autocmd VimEnter * NERDTree


" VIM-MINIMAP BY SEVERIN LEMAIGNAN
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>mm'
let g:minimap_highlight='Visual'
"autocmd VimEnter * Minimap

" INDENTLINE PLUGIN
let g:indentLine_char = '▶'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_term = 100
" special:·│¦┆➤▶

" EASYMOTION
" Disable default mapping
let g:EasyMotion_do_mapping = 0
" This allows you to jump onto a specific letter.
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
""nmap s <Plug>(easymotion-overwin-f)
" or `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
""nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions << what is this for?
""map <Leader>j <Plug>(easymotion-j)
""map <Leader>k <Plug>(easymotion-k)


" EASYTAGS
" * Tip: 
""echo join(sort(map(items(filter(copy(g:), 'v:key =~ "^easytags"')), 'string(v:val)')), "\n")
" The above command will list all the settings.
" This requirse both vim-easytags and vim-misc bundle
" By default the tags will be updated and highlighted if cursor on hold for a
" moment. In order to disable, see below.
" auto highlight disable
""let g:easytags_auto_highlight = 0 
" Disable automatic highlighting only in Python files
"":autocmd FileType python let b:easytags_auto_highlight = 0
" highlight member variables in cpp and java
let g:easytags_include_members = 1
" special scheme for member variables? Italics also available?
"highlight link cMember Special
highlight link cMember Italics
""let g:easytags_on_cursorhold=1
" run asynchronouse tags file updates
let g:easytags_async = 1

" VIM-MULTI-CURSOR
" help: <c-n> for highlighting a word and continue if pressed again
let g:minimap_close='<leader>gc'
" help: <c-p> for going back, <c-x> for skipping and continue
" help: multipleCursorsFind for regular expression
" multi_cursor_quit_key
let g:multi_cursor_quit_key=','
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


" VIM-SEEK

" VIM-GUTTER
" mapping disabled





"===================================================================================
" MISC
"===================================================================================




