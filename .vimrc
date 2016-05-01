set nocompatible              " be iMproved, required

filetype indent plugin on

imap ,, <ESC>

set number
set relativenumber

set scrolloff=7

syntax on
set mouse=a

set smartindent

set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

"mapping esc to ee

"Better command-line completion
set wildmenu

"Show partial commands in the last line of the saoc 
set showcmd

"Highlight searches (use <C-L> to temporarily turn off highligting
"set hlsearch

set ruler

set ignorecase
set smartcase


set confirm

set wildmenu


set cmdheight=2

set pastetoggle=<F11>

"Annoying
"set laststatus=2

"Bug
"set cursorline

set showmatch
set mat=2

set incsearch

"cursor moves visual instead of actual line
nnoremap j gj
nnoremap k gk


syntax enable

try
    colorscheme molokai
catch
endtry

"Always show the status line
set laststatus=2

"Highlight selected word on cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"""""Pathogen
execute pathogen#infect()
"""""

"""""neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_enable_cursor_hold_i=1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
"""""

"""""easytags
set tags=./tags;/
"let g:easytags_cmd='/usr/local/bin/ctags'
"let g:easytags_syntax_keyword='always'
"let g:easytags_on_cursorhold=0
"

