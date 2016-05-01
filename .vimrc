set nocompatible

imap ,, <ESC>

set number
syntax on
set mouse=a

set smartindent
filetype indent on

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
"set smartcase


set confirm

set wildmenu

set visualbell

set cmdheight=2

set pastetoggle=<F11>

"Annoying
"set laststatus=2

"Bug
"set cursorline

set showmatch
set mat=2

set incsearch

nnoremap j gj
nnoremap k gk

set noerrorbells
set novisualbell

syntax enable

try
    colorscheme molokai
catch
endtry

"Always show the status line
set laststatus=2

autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
