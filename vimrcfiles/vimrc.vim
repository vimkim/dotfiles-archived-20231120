
" VIMRC / INIT.VIM FILE
" Created by dequ[_macOS,_WSL]
" All comments copied are referenced with '-by John Doe' format.
" partly referred to Janus .vimrc
" From 20160825, this .vimrc file has been transformed into init.vim.
" Functionality for (not-neo)vim rarely tested since then.
"
"===================================================================================
"TABLE OF CONTENTS
"- TIPS & Reminders
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
" - vimdiff can compare files. ]c,[c to jump to differences, do, dp each
"   stands for obtain and put.
" - * will move you to the next identifier (variable name), while g* does the
"   same but does not care whether it is blank-separated. eg. var1 -> myvar1this
" - :%s/\s\+$// << Delete all spaces and tabs at the end of my lines


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
" mouse
set mouse=a
" indenting
set smartindent
" tab control
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
" Show partial commands in the last line
set showcmd
" Search pattern becomes case-insensitive.
set ignorecase
" Search pattern becomes case-insensitive when it has lowercase letters only.
" * This should be turned on together with :set ignorecase.
set smartcase
" scrolling control
set scrolloff=9
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
"set pastetoggle=<F11> << not necessary
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
" Highlight searches (use :noh to temporalily turn off)
set hlsearch
" ??
set ruler
" HTML indenting issue
let g:html_indent_inctags = "html,body,head,tbody"
" ??
set showmode
set showcmd
" buffer control
set hidden
"zc will close the fold, zo will open the fold, za will toggle the fold under
"the current cursor.
"zC, zO, zA applies the same, recursively.
"zR opens all folds, zM closes all folds
set foldmethod=indent
" Omny? this sucks
set omnifunc=syntaxcomplete#Complete
" spell check, but not grammar. Useful for writing README
""set spell
" auto change directory, works same as autochdir with less errors
autocmd BufEnter * silent! lcd %:p:h
" Saves undo's after file closes
set undofile


"===================================================================================
" MAPPING
"===================================================================================
" * :verbose map <KEY> will tell you if the mapping is already taken by other
" function.

" ARROWS FOR COLEMAK
"noremap k j
"noremap h k
"noremap j h

" ESC
vmap ,, <ESC>
imap ,, <ESC>
cmap ,, <C-c>
vmap wf <ESC>
imap wf <ESC>
cmap wf <C-c>
" LEADER KEY
let mapleader = ","

" CURSOR
" cursor moves visual instead of actual line
"noremap j gj
"noremap k gk

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
nnoremap <buffer> <leader>py :w<CR>:exec '!python3' shellescape(@%,1)<cr>
" - C,CPP: "If F8 is pressed then run gcc and a.out
" creates an executable file named a.out
" crc : compile and run c code / ccp : compile and run cpp code
nnoremap <leader>gcc :w <CR>:!gcc-6 % && ./a.out <CR>
nnoremap <leader>g++ :w <CR>:!g++-6 % && ./a.out <CR>
" creates an executable file that has the same name with its .c file
""map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" EXPERIMENTAL
" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>


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
"colorscheme molokai
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
"let g:pathogen_disabled=['neocomplete.vim']
" PATHOGEN
"execute pathogen#infect()
" this helptags function is decprecated, but who cares. I'm lazy.
"execute pathogen#helptags()

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

"vim-plug session
" To install, type :
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('$HOME/.vim/plugged') "TODO
Plug 'yggdroot/indentline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" GOYO
"autocmd VimEnter * Goyo

" LIMELIGHT
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = "gray"
let g:limelight_conceal_ctermfg = 245
"autocmd VimEnter * Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" SOLARIZED
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set bg=light
colorscheme solarized

" DEOPLETE
let g:deoplete#enable_at_startup = 1
" Use smartcase
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" Let <TAB> also do completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" close preview window on leaving the insert mode
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt-=preview

"deoplete-clang
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/3.8.1/lib/clang'
let g:deoplete#eable_refresh_always = 1

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CTRLP.VIM
" help: ,p toggles
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map= '<leader>p'
let g:ctrlp_cmd = 'CtrlPBuffor .'

" TAGBAR
" help: ,tb toggles tagbar. <c-w><c-w> changes window and press ? for details.
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_width=30
"autocmd VimEnter * Tagbar

" SEMANTIC HIGHLIGHT
nnoremap <Leader>h :SemanticHighlightToggle<cr>
""let g:semanticTermColors = [1,2,3,9,10,12,13,14,15,125]
""autocmd VimEnter * SemanticHighlightToggle
" also highlight words starting with $ in javascript.
""autocmd FileType javascript setlocal iskeyword+=$

" NERDTREE
" help: ,nt toggles. Then type ? for details.
let NERDTreeShowHidden=1
map <leader>nt :NERDTreeToggle<CR>
""autocmd VimEnter * NERDTree

" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'light'

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

" TABULAR

" VIM-MARKDOWN
nnoremap <leader>>> V:HeaderIncrease<CR>
nnoremap <leader><< V:HeaderDecrease<CR>

" VIM-INSTANT-MARKDOWN

" EASYTAGS
" * Tip:
""echo join(sort(map(items(filter(copy(g:), 'v:key =~ "^easytags"')), 'string(v:val)')), "\n")
" The above command will list all the settings.
" This requires both vim-easytags and vim-misc bundle
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
" help: <c-p> for going back, <c-x> for skipping and continue
" help: multipleCursorsFind for regular expression
" By default, multicursor starts with <c-n>. Change with the following:
let g:multi_cursor_start_key='<leader>mc'
" multi_cursor_quit_key
let g:multi_cursor_quit_key=','
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
" Called once only when the multiple selection is canceled(default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" VIM-SEEK

" VIM-GUTTER
" help: [c, ]c jumps to hunk
" help: <leader>hp for preview, <leader>hs for stage, <leader>hu for undo

filetype plugin indent on

" turn off auto commenting when <cr>
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o

" Syntax of these languages is fussy over tabs Vs spaces - by VimCast
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 noexpandtab

" Customizations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

if !exists("g:syntax_on")
    syntax enable
endif " by Andy Ray from SO

"===================================================================================
" MISC
"===================================================================================

hi NonText ctermfg=1 guifg=gray
