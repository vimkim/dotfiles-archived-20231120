"section============================================================================
" NECESSARY
"===================================================================================

"indenting
"set cindent
set autoindent "tells vim to apply the indentation of the current line to the next(enter, o, O)
set smartindent "reacts to syntax/style of code. 'autoindent' must be on.

" tab control
set tabstop=4
set softtabstop=4
set shiftwidth=4
" This changes the first tab to spaces
set expandtab
"set noexpandtab
set smarttab

" Show partial commands in the last line
set showcmd

" Search pattern becomes case-insensitive.
set ignorecase

" Search pattern becomes case-insensitive when it has lowercase letters only.
" * This should be turned on together with :set ignorecase.
set smartcase

set scrolloff=100 " scrolling control - leave some lines at both sides
"set sidescrolloff=100 " for columns

set number " line number
set relativenumber " relative line number

" make backspace work like most other apps. Alternatives: set backspace=2
set backspace=indent,eol,start

" MACVIM ZOOM
set guifont=Meslo\ LG\ M\ DZ\ For\ Powerline:h22

" visual bell
set visualbell
set noerrorbells

"Auto read when a file is changed on disk
set autoread

" show invisibles
set list
set listchars=tab:▸\ ,eol:¬

" tells vim to look for a tags file in the directory of the current file, in
" the current directory and up and up until your $HOME (that's the meaning of
" the semicolon), stopping on the first hit. -by romainl from SO
""set tags=./tags;tags; -disabled for easytags

"Highlight selected word on cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

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

" Better buffer management - hide buffers instead of closing them - by mojotech
set hidden

" Default history is only 20
set history=100
" Use more levels of undo
set undolevels=100  

"zc will close the fold, zo will open the fold, za will toggle the fold under
"the current cursor.
"zC, zO, zA applies the same, recursively.
"zR opens all folds, zM closes all folds
set foldmethod=indent
set nofoldenable

" Omny? this sucks
"set omnifunc=syntaxcomplete#Complete

" spell check, but not grammar. Useful for writing README
"set spell << Currently set for txt, md, anki

" auto change directory, works same as autochdir with less errors
autocmd BufEnter * silent! lcd %:p:h

" Saves undo's after file closes
set undofile

" Full path to the status line visible
"set statusline+=%F

"set zsh to default
set shell=/usr/local/bin/zsh "brew zsh location for macos
" with l option, this somehow sources the .zshrc
"set shell=zsh\ -l " Works fine but disabled due to conflicts with Fugitive Gdiff
"set shell=bash\ --login " Source .bashrc file
"set shell=zsh\ -i " behave strange; interactive mode which seems wrong. This produces tts error or something like that

"latex conceal unwanted strange math mode
let g:tex_conceal = "" "maybe for vim-markdown or general

set lazyredraw " redraw only when we need to 

"jumplist gotojump " in order to invoke, :call GotoJump()
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
"jumplist mapping
nnoremap <leader>ju :call GotoJump()<cr>


"auto source vimrc
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

set path+=** " from the thoughtbot youtube How to do 90% of what plugins do. use :find plug*

set scrolljump=1

map <ScrollWheelUp> <C-y>
map <mouseup> <C-y>
map <ScrollWheelDown> <c-e>
map <mousedown> <C-e>

let g:vim_json_syntax_conceal = 0 "not working. It is said that it works for vim-json
set conceallevel =0

