set backspace=indent,eol,start " make backspace work like most other apps. Alternatives: set backspace=2

filetype indent plugin on

"""""""""""""""""""""""""MAPPING""""""""""""""""""""""""""""""
" mapping ESC to ,,  
vmap ,, <ESC> 
imap ,, <ESC>
cmap ,, <C-c>

" mapping dot(.) to :norm.<CR> so it can be used in visual mode.
""vnoremap . :norm.<CR>

"line number
set number
set relativenumber

"scrolling control"
set scrolloff=7

"syntax highlighting"
syntax on

"monokai scheme
colorscheme monokain
"gruvbox scheme
"colorscheme gruvbox
"set bg=dark



"mouse"
set mouse=a

"indenting"
set smartindent

"tab control"
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

"Better command-line completion
set wildmenu

"Show partial commands in the last line of the saoc 
set showcmd

"Highlight searches (use <C-L> to temporarily turn off highligting
"set hlsearch

set ruler

"when searching, ignore case sensitivity, but smart enough"
set ignorecase
set smartcase

"probably this asks before quit
set confirm

set cmdheight=2

set pastetoggle=<F11>

"Annoying
set laststatus=2

"Bug
"set cursorline

set showmatch
set mat=2

set incsearch

"cursor moves visual instead of actual line
nnoremap j gj
nnoremap k gk



"""""Python"""""
"If F9 is pressed then run python
nnoremap <buffer> <F9> :w <CR> :exec '!python3' shellescape(@%,1)<cr>

"""""C,CPP"""""
"If F8 is pressed then run gcc and a.out
map <F8> :w <CR>:!gcc % && ./a.out <CR>
"map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>


""""""""""""""Color Scheme molokai"""""""""""Begin
try
    "colorscheme molokai
catch
endtry

"let g:molokai_original = 1
"let g:rehash256 = 1
""""""""""""""Color Scheme molokai"""""""""""End


"Always show the status line
"set laststatus=2

"Highlight selected word on cursor
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


"""""""""""""""""""""""""PLUGINS""""""""""""""""""""""""""""""

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


"""""Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map ='<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"""""TagBar
nmap <F2> :TagbarToggle<CR>

"""""Semantic Highlight
:nnoremap <F12> :SemanticHighlightToggle<cr>
let g:semanticTermColors = [1,2,3,9,10,12,13,14,15,125]

"""""NerdTree

"""""AirLine
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"""""MacVim ZOOM"""""
set guifont=Menlo:h22

"""""Autocmd

"autocmd VimEnter * SemanticHighlightToggle
"autocmd VimEnter * NERDTree
autocmd VimEnter * Tagbar

