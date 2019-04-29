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
"set relativenumber " relative line number

" make backspace work like most other apps. Alternatives: set backspace=2
set backspace=indent,eol,start

" MACVIM ZOOM

set encoding=utf-8
set fileencoding=utf-8
" GUI
if has("mac")
    "set guifont=Meslo\ LG\ M\ DZ\ For\ Powerline:h22
    set guifont=Menlo:h22
    set guifontwide=NanumGothic:h22
endif


" visual bell
set visualbell
set noerrorbells

"Auto read when a file is changed on disk
set autoread

" show invisibles
"set list
"set listchars=tab:▸\ ,eol:¬

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
set undolevels=255

"zc will close the fold, zo will open the fold, za will toggle the fold under
"the current cursor.
"zC, zO, zA applies the same, recursively.
"zR opens all folds, zM closes all folds
"set foldmethod=indent
"set foldmethod=syntax
"set foldenable
"set nofoldenable

" Omny? this sucks
"set omnifunc=syntaxcomplete#Complete

" spell check, but not grammar. Useful for writing README
"set spell << Currently set for txt, md, anki


"set autochdir
" auto change directory, works same as `set autochdir` with less errors
autocmd BufEnter * silent! lcd %:p:h
" set the file's directory as pwd; useful for fzf opened files // set working directory.
" somehow fzf runs this command after opening new files..
nnoremap ;swd :silent! lcd %:p:h<cr>



" SWAPDIR
" Attempt to create the directory. If it already exists, mkdir will signal an error, but it is ignored.
" silent !mkdir ~/.vim/swapdir > /dev/null 2>&1
" This is operating system independent
if !isdirectory($HOME . "/.vim/swapdir")
    call mkdir($HOME . "/.vim/swapdir", "p")
endif
set backupdir=$HOME/.vim/swapdir
" $ ln -s ~/.local/share/nvim/swap ~/.vim/swapdir # recommended for nvim compatibility

" UNDODIR
" Saves undo's after file closes
" do not forget to clean undo file with unix cron
" if this option is not set, clean ~/.local/share/nvim/undo
if !isdirectory($HOME . "/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif
set undofile
set undodir=~/.vim/undodir

" VIEWDIR
if !isdirectory($HOME . "/.vim/viewdir")
    call mkdir($HOME . "/.vim/viewdir", "p")
endif
set viewdir=$HOME/.vim/viewdir
" Save fold in viewdir
"autocmd BufWinLeave ?*.* mkview
"autocmd BufWinEnter ?*.* silent loadview
set viewoptions-=options


" Full path to the status line visible
"set statusline+=%F

"set zsh to default
if has("mac")
    set shell=/usr/local/bin/zsh "brew zsh location for macos
elseif has("unix")
    set shell=/usr/bin/zsh
endif
" with l option, this somehow sources the .zshrc
"set shell=zsh\ -l " Works fine but disabled due to conflicts with Fugitive Gdiff
"set shell=bash\ --login " Source .bashrc file
"set shell=zsh\ -i " behave strange; interactive mode which seems wrong. This produces tts error or something like that

"latex conceal unwanted strange math mode
"let g:tex_conceal = "" "maybe for vim-markdown or general

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

" source vimrc - useful after adding plugins, etc.
noremap ;sov :so $MYVIMRC<cr>

set path+=** " from the thoughtbot youtube How to do 90% of what plugins do. use :find plug*

set scrolljump=1

map <ScrollWheelUp> <C-y>
map <mouseup> <C-y>
map <ScrollWheelDown> <c-e>
map <mousedown> <C-e>

"let g:vim_json_syntax_conceal = 0 "not working. It is said that it works for vim-json
"set conceallevel =0

" syntax highlight too slow. Test
set nocursorcolumn
set nocursorline
"set norelativenumber
"syntax sync minlines=256

"set magic "equivalent of :%s/\m

"syntax highlight limit for speed
set synmaxcol=255

" enable english even if korean
set noimd

" Pressing ESC while typing in Korean would automatically change the layout to English
"if has('mac') && filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
    "autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
"endif "strange behavior


" change statusline color based on mode
" http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
hi StatusLine ctermbg=22
hi TabLineSel ctermfg=144 ctermbg=22
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=52 gui=undercurl guisp=Magenta
  au InsertEnter * hi TabLineSel term=reverse ctermfg=144 ctermbg=52 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse  ctermbg=22 gui=bold,reverse
  au InsertLeave * hi TabLineSel term=reverse ctermfg=144 ctermbg=22 gui=bold,reverse
endif

" reference: ~/runtime_config/vimcolor.txt


" vim recognizes _ as a word boundary:
"set iskeyword-=_ " this is dangerous. vim cannot use tags jump with this as c-] does not work with abc_xyc function.
"Instead, use vim-textobj-underscore plugin.

" Completion menu
set completeopt=menuone "popup menu will showup even if there's one possible completion.
" TIP1: <c-y> to close the menu
" TIP2: <c-e> to cancel the completion and leave it as it was.

"Cscope
""" if has('cscope')
"""     set cscopetag cscopeverbose
"""
"""     if has ('quickfix')
"""         set cscopequickfix=s-,c-,d-,i-,t-,e-
"""     endif
"""
"""     cnoreabbrev csa cs add
"""     cnoreabbrev csf cs find
""" endif

"Tags
"cnoreabbrev upt UpdateTags -R
" $ vim -t <tag> goes to tag directly. e.g. vim -t main

"highlight Comment cterm=italic gui=italic

" for Tmux italics
" the first two lines force true color on
"let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors

" this makes the concealed letters appear
" autocmd vimenter * set concealcursor=c
" autocmd vimenter * setlocal concealcursor=c
" does not work with vim-schemer... finally disabling schemer
autocmd bufnewfile,bufread  * set concealcursor=c conceallevel=1
autocmd bufnewfile,bufread * setlocal concealcursor=c conceallevel=1

"detect realtime file changes
set autoread
au Cursorhold * checktime
" seems like this does not work with terminal vim.
" For temporary amendment, use :e! everytime if there is a change.
" I'll install vim-autoread plugin and see how it goes.
" Now it works. Awesome!

set t_Co=256

" system clipboard access for wsl vim
" https://vi.stackexchange.com/questions/12376/vim-on-wsl-synchronize-system-clipboard-set-clipboard-unnamed
let iswsl=$iswsl
if iswsl == 'true'
    " echo "this is wsl!"

    " ##### for copying #####
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
    end

    " ##### for pasting #####
    map <silent> "=p :r !powershell.exe -Command Get-Clipboard<CR>

    " not working version
    " map! <silent> <c-r>= :r !powershell.exe -Command Get-Clipboard<CR>

    " buggy version
    " noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>


endif

" if wsl, set file line ending to dos
if iswsl == 'true'
    "set ffs=dos
else
    "set ffs=unix
endif
" learn vim the hard way practice
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

nnoremap <leader>x :call QuickfixToggle()<cr>
