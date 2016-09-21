
"section============================================================================
" NECESSARY
"===================================================================================

" indenting
set autoindent
set smartindent
set cindent

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

"Better command-line completion
set wildmenu
set wildmode=list:longest,full

"Mouse
set mouse=a

" Have Vim jump to the last position when a file reopened.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"section============================================================================
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


