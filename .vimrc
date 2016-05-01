set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"""error"""Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'shougo/neocomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

imap ,, <ESC>

set number
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
"set smartcase


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

nnoremap j gj
nnoremap k gk


syntax enable

try
    colorscheme molokai
catch
endtry

"Always show the status line
set laststatus=2

autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

execute pathogen#infect()

let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_enable_cursor_hold_i=1
