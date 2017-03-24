"START_OF_FILE
"INIT.VIM FILE (.vimrc in past)
"Creator: dqgthb
"From 20160825, this .vimrc file has been transformed into init.vim.
"Functionality for (not-neo)vim rarely tested.
"
"section============================================================================
"TABLE OF CONTENTS
"===================================================================================

"- TIPS & REMINDERS
"- MAPPING
"- PLUGIN
"- FILETYPE
"- SCHEME
"- NECESSARY
"- ACCESSORY
"- MISC

"section============================================================================
"TIPS & REMINDERS
"===================================================================================

"[[Modal]]
"- <c-o> in insert mode would allow you to run a command in normal mode and restore back to insert mode.

"[[Windows]]
"- :windo makes all windows do the same command.
"- <c-w><c-w> goes to the next window, while <c-w><c-p> goes to the last window.
"- <c-w>+j,h,k,l works.

"[[Registry]]
"- Look up the register file by :reg.
"- Paste from registry by using "<char>p.
"- Copy to registry by using "<char>y (visual select might be useful).

"[[Case]]
"- Change the case of a letter by [visual_mode] + (u,U,~).

"[[Tags]]
"- ctags should be updates using command: $ ctags -R .

"[[Recovery]]
"- If .swp file was created, you can recover that file by $vim -r <filename> Or, just press R and it sometimes works. Save the file with different name (or backup the original file with different name and then recover).

"[[Difference]]
"- $ vimdiff filename1 filename2 << this is a helpful tool.
"- For neovim, it is nvim -d filename1 filename2.
"- c[,c] to just to difference chunks
"- do (diff obtain), dp (diff put) to equalize the differences.
"- If you want to undo your do/dp, you can just simply <c-w><c-w>u. 

"[[Cursor]]
"- g; will bring your cursor to the previous changelist.
"- g, will bring you cursor to the next changelist.
"- `` (two backticks) will bring you to the last location of the cursor.
"- TODO: figure out the actual mechanism of ``
"- * will move your cursor to the next word. eg) myvar -> myvar
"- g* will move your cursor to the next text. eg) myvar -> heymyvar3
"- gf will open the file under the cursor.
"- <c-o> will go back to the previous file (move cursor to an older position in jusp list).
"- <c-^> will alter between files.
"- :e# is equivalent to the above.
"- <c-w>f will open the file in a new window.
"- <c-w>gf will open the file in a new tab.

"[[Substitute]]
"- :%s/\s\+$// << Delete all spaces and tabs at the end of my lines

"[[Sort]]
":sort
":sort i "ignorecase
":sort! "reverse sort
":sort /{pattern}/ "skip pattern
":sort r /{pattern}/ "search for pattern

"[[vimgrep]]
"vimgrep /esc/gj {filename}
"vimgrep /esc/gj `find {directory} -type f -not -path "*.git*"`
" The one below is more efficient. It searches through the parent directory recursively.
"vimgrep /rc/gj ../**/* 
" Run the command and :copen, :cnext. Use QuickFix features.
" :cn will go to the next error.
" :cnf will go to the first error of the next file.

"[[.vimrc tips]]
"- You can change the plugin variable within vim command mode by just typing :let g:something_blah=foo
"- :set myvar? would determine the status of the variable <myvar>


"section============================================================================
" MAPPING
"===================================================================================

"Useful Tip:
"- :verbose map <KEY> will tell you if the mapping is already taken by other function.

" LEADER KEY
let mapleader = ","
inoremap <c-e> <esc>
nnoremap <c-e> <esc>
vnoremap <c-e> <esc>

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
nnoremap <Enter> o<ESC>
" insert new line above the cursor without entering insert mode.
nnoremap <Leader><Enter> O<ESC>
" Unfortunately, a more intuitive  choice of <S-Enter> O<ESC> not working on CLI

"SUDO SAVE
nnoremap :sudow :w !sudo tee > /dev/null %

"SAVE & QUIT IN INSERT MODE
inoremap ZZ <c-c>ZZ

"Suspend
nnoremap <leader>z <esc><c-z>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

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
au filetype python nnoremap <buffer> <leader>run :w<CR>:exec '!python3' shellescape(@%, 1)<cr>

"CLisp
au filetype lisp nnoremap <buffer> <F8> :w<CR>:exec '!clisp' shellescape(@%, 1)<cr>

"- C,CPP
"Create an executable file named a.out.
"noremap <leader>gcc :w <CR>:!gcc-6 % && ./a.out <CR>
"noremap <leader>gpp :w <CR>:!g++-6 % && ./a.out <CR>
"noremap <leader>g++ :w <CR>:!g++-6 % && ./a.out <CR>
"IMPORTANT: if bugs occured, change gcc-6 to gcc
" creates an executable file that has the same name with its .c file
au filetype c nnoremap <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
au filetype c nnoremap <leader>cpp :w <CR> :!gcc % -o %< && ./%< <CR>
")

"- JAVA
au filetype java nnoremap <F8> :w<cr>:!javac % && java %< <cr>
au filetype java nnoremap ,ru <esc>:w<cr>:!javac % && java %< <cr>

"Replace Windows ^m enter return into Unix
nnoremap <leader>winm :%s/\r/\r/g<CR>

"Buffer shortcuts
nnoremap ,bn :bn<cr>
nnoremap ,bp :bp<cr>
nnoremap ,bd :bd<cr>
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
nnoremap gd :bd<cr>
nnoremap ,bf :buffers<CR>:buffer<Space>

"Line-opeation shortcut
nnoremap gw $
nnoremap gb ^
vnoremap gw $ h
" visual select whole line except for the carriage return (enter) <c-r>
nnoremap gwb ^v$h

"Add space in normal mode
nnoremap <space> i<space><esc>

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
nnoremap <leader>gap :Git add -p %<cr>
nnoremap <leader>ap :Git add -p %<cr>
nnoremap <leader>gco :Gcommit --verbose<cr>
nnoremap <leader>gc :Gcommit --verbose<cr>
nnoremap <leader>cvc :Gcommit --verbose<cr>
nnoremap <leader>gps :Gpush<cr>
nnoremap <leader>gdi :Gvdiff<cr>
nnoremap <leader>di :Gvdiff<cr>
" not fugitive but useful for visual select + stage
vnoremap dp :diffput<cr>

" #############################
" Extra personal aliases or shortcuts (informal)
" #############################
" command to show the file path
nnoremap :filepath :echo expand('%:p')<cr>
nnoremap :fullpath :echo expand('%:p')<cr>

" mapping for replace all / substitute all 
nnoremap :repa :%s/
nnoremap :repl :%s/
nnoremap :suba :%s/
nnoremap :subs :%s/

" put date on document timestamp
nnoremap :date :put =strftime('%Y-%b-%d %a %T')<cr><esc>
inoremap :date <esc>:put =strftime('%Y-%b-%d %a %T')<cr><esc>

" FZF
nnoremap <leader>fz :FZF 

nnoremap :sov :so $MYVIMRC<cr>

let g:BASH_Ctrl_j = 'off' " does not work
let g:ZSH_Ctrl_j = 'off'

" ,pa acts the same as pasting system clipboard
nnoremap <leader>pa "*p
"inoremap <c-r> <c-r>* don't know why I did this


inoremap <c-BS> <DEL>

nnoremap U :echo "<< ===== CHECK CAPSLOCK =====>>"<cr>

nnoremap ; :

nnoremap ,ffmt <esc>:set fileformat=dos

nnoremap :ft :set filetype<cr>

nnoremap :vm :verbose map 

"section============================================================================
" PLUGINS
"===================================================================================

"Discard all previous settings.
set nocompatible

"(For Pathogen, "This is what you should have at the top of your ~/.vimrc" - by romainl
filetype off
filetype plugin indent off
syntax off
"Now go down to the plugin section and see these turned on.
")

"(PATHOGEN << not used anymore.
"Not using pathogen anymore. Changed to "vimplug.
""let g:pathogen_disabled=['neocomplete.vim']
""execute pathogen#infect()
"If this is executed, helptags of plugins are updated.
""execute pathogen#helptags()
"* IMPORTANT: It is required that the user should run :Helptags command everytime a new plugin is installed. This method helps trigger :help <plugin_name> function. -by tpope, the creater of pathogen
")



"(VIMPLUG 
"To install, type :
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"use :sort /.... '.*\// to sort the lines.
call plug#begin('$HOME/.config/nvim/plugged') "TODO
"pluglist:
Plug 'mileszs/ack.vim' "code search
Plug 'w0rp/ale' "saves my life
"Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'chrisbra/csv.vim' "it works for ;sv and tsv as well
" The below 2 plugins are not used for vim
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-clang'
else
"" Instead of the above two, neocomplete for vim
    Plug 'Shougo/neocomplete.vim'
endif
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'sjl/gundo.vim'
Plug 'yggdroot/indentline'
"Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/mathjax-support-for-mkdp' "should be above markdown-preview of iamcco
Plug 'iamcco/markdown-preview.vim'
"Plug 'Shougo/neoinclude.vim' "too slow
Plug 'scrooloose/nerdcommenter' "too slow
Plug 'scrooloose/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'vim-scripts/vim-niji' " has similar functionality with rainbow_parentheses
"Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
"Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' "Snippets Engine
Plug 'honza/vim-snippets' " Snippets, let me put next to ultisnips
Plug 'lervag/vimtex' 
Plug 'tpope/vim-abolish'
"Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'bling/vim-bufferline'
"Plug 'ap/vim-buftabline' 
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc' " must follow easytags
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
"Plug 'xuhdev/vim-latex-live-preview'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'zefei/vim-wintabs'
call plug#end()

"(ALE
let g:ale_sign_column_always = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
")



"(AUTO-PAIR
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
au Filetype markdown let b:autopairs_loaded=1
au filetype lisp let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
")
"(CTRLP.VIM
" help: ,p toggles
let g:ctrlp_map = '<leader>ctp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
nnoremap <leader>cp :CtrlP<Space>.<cr>
nnoremap <leader>cd <esc>:CtrlPDir ~/
")

"CSV.VIM
" :ArrangeColumn , :UnarrangeColumn useful
" HJKL navigation (capital letters)
" To override, let g:csv_delim=','
"let g:csv_delim='\t'
let g:csv_no_conceal = 1 " unlet g:csv_no_conceal to disable

"(FZF)
nnoremap :fz :FZF ~/
nnoremap ,fz :FZF ~/
"nnoremap <c-f> :FZF<cr>
")
"(FZF.VIM
nmap <c-x><c-f> <plug>(fzf-complete-path)
")

"(GOYO
"autocmd VimEnter * Goyo
")
"(GUNDO.VIM
nnoremap <leader>gu :GundoToggle<cr>
")

"(LIMELIGHT
" Color name (:help cterm-colors) or ANSI code
"let g:limelight_conceal_ctermfg = "gray"
let g:limelight_conceal_ctermfg = 245
"autocmd VimEnter * Limelight
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
")

"(LIGHTLINE
let g:lightline = {'colorscheme': 'PaperColor',}
")

"(MARKDOWN PREVIEW
let g:mkdp_path_to_chrome = "open -a Safari"
"let g:mkdp_path_to_chrome = "open -a '/Applications/Google Chrome.app'"
"let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1 " refresh when save the buffer or leave from insert mode
let g:mkdp_command_for_global = 0 " markdown preview command can be use for all files
")
"(SOLARIZED
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set bg=light
"colorscheme solarized
")

"(DEOPLETE
let g:deoplete#enable_at_startup = 1
" auto complete error temporary fix "https://github.com/Shougo/deoplete.nvim/issues/440
let g:deoplete#auto_complete_delay = 250
" Use smartcase
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#disable_auto_complete = 0
" Let <TAB> also do completion
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" close preview window on leaving the insert mode
"autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt-=preview
" Two lines for Disable buffer source
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
let b:deoplete_ignore_sources = ['buffer']

")

"(DEOPLETE-CLANG << broken now
"let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/3.8.1/lib/libclang.dylib'
"let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/3.8.1/lib/clang'
"let g:deoplete#enable_refresh_always = 1
")

"(NEOCOMPLETE
""let g:neocomplcache_enable_cursor_hold_i=1
"Enable <TAB> for Neocomplete. It also helps tabs recover its original functionality.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
""            \ <SID>check_back_space() ? "\<TAB>" :
""            \ neocomplete#start_manual_complete()
""function! s:check_back_space() "{{{
"    h""let col = col('.') - 1
"    ""return !col || getline('.')[col - 1]  =~ '\s'
""endfunction"}}}}}}}}}
")
"
"(NEOCOMPLETE
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
")

"(SYNTASTIC
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()} "TODO 
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"if has('mac')
    "let g:syntastic_python_python_exec = '/usr/local/bin/python3'
"else
    "let g:syntastic_python_python_exec = '/usr/bin/python3'
"endif
"")

"(TAGBAR
" help: ,tb toggles tagbar. <c-w><c-w> changes window and press ? for details.
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_width=30
"autocmd VimEnter * Tagbar
")

"(ULTISNIPS
let g:UltiSnipsListSnippets = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" Defines the directory private snippet definition files are stored in.
set runtimepath+=~/.vim/mySnips/"
let g:UltiSnipsSnippetsDir = "~/.vim/mySnips/UltiSnips"
" Defines the directories for looking for snippets. Do not mix up.
let g:UltiSnipsSnippetsDirectories = ["~/.vim/mySnips/UltiSnips"]

"for autocompletion
inoremap <c-x><c-k> <c-x><c-k>
inoremap <c-l> <c-l>
")

"(VIMTEX
" These are not working properly. It still opens the default system viewer
"let g:vimtex_view_general_viewer = 'open'
"let g:vimtex_view_general_options = '-a Skim'


")


"(SEMANTIC HIGHLIGHT
nnoremap <Leader>h :SemanticHighlightToggle<cr>
""let g:semanticTermColors = [1,2,3,9,10,12,13,14,15,125]
""autocmd VimEnter * SemanticHighlightToggle
" also highlight words starting with $ in javascript.
""autocmd FileType javascript setlocal iskeyword+=$
")

"( IAMCCO/MARKDOWN-PREVIEW.VIM
nnoremap :prev :MarkdownPreview<cr>
nnoremap :nprev :MarkdownPreviewStop<cr>
")

"(NERDCOMMENTER
"let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
")

"(NERDTREE
" help: ,nt toggles. Then type ? for details.
let NERDTreeShowHidden=1
"map <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nt <esc>:NERDTreeToggle ~/
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p " moves cursor to filesafter opening nerdtree
let g:NERDTreeWinSize=15
")

"(PAPERCOLOR-THEME (colorscheme)
"set t_Co=256 "This is may or may not needed.
set bg=dark
colorscheme PaperColor
")

"(RAINBOW-PARENTHESES.VIM
au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
")

"(NIJI PARENTHESES
"let g:niji_matching_filetypes = ['markdown', 'tex', 'python']
"let g:niji_use_legacy_colours = 1
")


"(AIRLINE
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1
"let g:airline_theme = 'light'
let g:airline_theme ='luna'
")

"(VIM-MINIMAP BY SEVERIN LEMAIGNAN
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>mm'
let g:minimap_highlight='Visual'
"autocmd VimEnter * Minimap
")

"(INDENTLINE PLUGIN
let g:indentLine_char = '▶'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_term = 100
" special:·│¦┆➤▶
")

"(EASYMOTION
" Disable default mapping
let g:EasyMotion_do_mapping = 0
" This allows you to jump onto a specific letter.
" the first line allows you to trigger in visual mode as well (very helpful)
map <leader>f <plug>(easymotion-bd-f)
" allows you to move regardless of buffer (for :vsplit, etc.)
nmap <Leader>fw <Plug>(easymotion-overwin-f)
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
""nmap s <Plug>(easymotion-overwin-f)
" or `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions << what is this for?
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
map <leader>L <plug>(easymotion-bd-jk)
nmap <leader>L <plug>(easymotion-overwin-line)
" Move to word
"map <leader>fw <plug>(easymotion-bd-w)
nmap <leader>emw <plug>(easymotion-overwin-w)
")

"(TABULAR
" :Tabularize /= useful
" :Tabularize /=\zs more useful
" align variable (\S <= non-whitespace character)
vnoremap :alivar :Tabularize /\S\+;
" MY function: undo tabularize
vnoremap :untab :s/\v(\s)\s+/\1/gc 
vnoremap :uncsv :s/\v\s+,\s+/,/gc
" expl: basically, replace two or more spaces as one space vnoremap :untab s/\v(\s)\s+/ /gc " this also works
")

"(VIM-MARKDOWN
nnoremap <leader>>> V:HeaderIncrease<CR>
nnoremap <leader><< V:HeaderDecrease<CR>
let g:vim_markdown_conceal = 0 " disable conceal regardless of conceallevel // I should enable this because meslo font that I'm currently using does not support bold nor italic.
"To disable math conceal with LaTex math syntax enabled
let g:tex_conceal = ""
let g:vim_markdown_math = 1
")

"(EASYTAGS
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
")

"(VIM-FUGITIVE
set statusline+=%{fugitive#statusline()}
"Problem: it does not work for symlinks
"Solution:

"First approach (broken: seems like this breaks for none symlink files 
"function! s:MyFollowSymlink()
    "silent! let s:fname = resolve(expand('%:p'))
    "silent! bwipeout
    "silent! exec "edit " .s:fname
"endfunction
"command! FollowSymlink call s:MyFollowSymlink()

"augroup followsymlink:
    "autocmd!
    "autocmd BufReadPost * FollowSymlink
"augroup END " 


"Second approach:

" Follow symlinks when opening a file {{{
" NOTE: this happens with directory symlinks anyway (due to Vim's chdir/getcwd
"       magic when getting filenames).
" Sources:
"  - https://github.com/tpope/vim-fugitive/issues/147#issuecomment-7572351
"  - http://www.reddit.com/r/vim/comments/yhsn6/is_it_possible_to_work_around_the_symlink_bug/c5w91qw
function! MyFollowSymlink(...)
if exists('w:no_resolve_symlink') && w:no_resolve_symlink
  return
endif
let fname = a:0 ? a:1 : expand('%')
if fname =~ '^\w\+:/'
  " Do not mess with 'fugitive://' etc.
  return
endif
let fname = simplify(fname)

let resolvedfile = resolve(fname)
if resolvedfile == fname
  return
endif
let resolvedfile = fnameescape(resolvedfile)
let sshm = &shm
set shortmess+=A  " silence ATTENTION message about swap file (would get displayed twice)
exec 'file ' . resolvedfile
let &shm=sshm

" Re-init fugitive.
call fugitive#detect(resolvedfile)
if &modifiable
  " Only display a note when editing a file, especially not for `:help`.
  redraw  " Redraw now, to avoid hit-enter prompt.
  echomsg 'Resolved symlink: =>' resolvedfile
endif
endfunction
command! FollowSymlink call MyFollowSymlink()
command! ToggleFollowSymlink let w:no_resolve_symlink = !get(w:, 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>" w:no_resolve_symlink
au BufReadPost * nested call MyFollowSymlink(expand('%'))


")

"(VIM-MULTIPLE-CURSOR
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
")

"(VIM-LATEX-LIVE-PREVIEW
"let g:livepreview_previewer = 'open -a Preview'
")

"(VIM-SEEK
")

"(VIM-GUTTER
" help: [c, ]c jumps to hunk
" help: <leader>hp for preview, <leader>hs for stage, <leader>hu for undo
")

"(Vim-repeat
nnoremap <plug>NextMatch ;
nnoremap <silent> f :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>f
nnoremap <silent> F :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>F
nnoremap <silent> t :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>t
nnoremap <silent> T :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>T
")

"(VIM-SLIME
let g:slime_target = "tmux"
"let isitwsl=$iswsl
"if isitwsl == 'true'
""if $iswsl == 'true' " also works  << was not the actual reason it was because of the absence of $TMUX variable
if $TMUX != '' "test wether I'm currently in tmux or not
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
endif
" Tip: for socket, default, for pane, $session:0.0 
" You can identify it with the command $tmux list-panes -a
"let g:slime_python_ipython = 1 "This not working
")

"(VIM-SURROUND
" mapping for anki cloze
let g:surround_99 = "{{c1::\r}}"
" mapping for markdown
let g:surround_98 = "**\r**" " press b
" mapping for latex mathmode
let g:surround_108 = "$$ \r $$" " press l
")

"(FILETYPE
filetype plugin indent on
" turn off auto commenting when <cr>
"autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o 
" Opposite to above, turn on auto commenting 
autocmd FileType * setlocal formatoptions +=cro comments-=fb:- comments+=b:-

" Check the status by set formatoptions?, then you would see jql

" Syntax of these languages is fussy over tabs Vs spaces - by VimCast
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab "the original settings were noexpandtab but this does not work for yaml files for tmuxinator

" Customizations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
" Turn on auto listing
autocmd FileType markdown setlocal formatoptions +=r formatoptions +=o comments+=b:00. comments-=b:- comments+=b:-\ [\ ] comments+=b:-

" {{{ CHECKBOX-VIM 
" Thanks to Jonas Kramer (jkramer) for his 'checkbox.vim' plugin 
" And modom for his pull request
if exists('g:loaded_checkbox') " what is the usage of this?
	" finish
endif

"fu! checkbox#ToggleCB()
fu! ToggleCB()
	let line = getline('.')

	if(match(line, "\\[ \\]") != -1)
		let line = substitute(line, "\\[ \\]", "[x]", "")
	elseif(match(line, "\\[x\\]") != -1)
		let line = substitute(line, '\[x\]\s*', "", "")
    else 
        let line = substitute(line, '\(^\s*[\*-]\s\)', '\1[ ] ', "")
        "let line = substitute(line, '^\s*[\*-]\s', '\0[ ] ', "") "both works
	endif

	call setline('.', line)
endf

"command! ToggleCB call checkbox#ToggleCB()
autocmd filetype markdown command! ToggleCB call ToggleCB()
"nmap <silent> <leader>tt :ToggleCB<cr>
"autocmd filetype markdown nmap <silent> <leader>tt :ToggleCB<cr> 
" {{{ repeat.vim implementation
" changed from nmap to nnoremap. Will see what happen
autocmd filetype markdown nnoremap <plug>ToggleCheckBox :ToggleCB<cr>:call repeat#set("\<plug>ToggleCheckBox")<cr>
autocmd filetype markdown nmap <leader>cb <plug>ToggleCheckBox
let g:loaded_checkbox = 1
" }}}
"}}}

"{{ Markdown tab means indent
"fu! IndentTab()
    "let line = getline('.')
    "if(match(line, '^\s*[\*-]\s') != -1)
        " - let line = substitute(line, '^\s*


" Check the status by set formatoptions? and then you will see jqtlncro

")

"Spell check for txt, md, anki
autocmd filetype text setlocal spell
autocmd filetype markdown setlocal spell
autocmd filetype anki setlocal spell

"(SYNTAX ENABLE
if !exists("g:syntax_on")
    syntax enable
endif " by Andy Ray from SO
")

"add *.anki as a file extension
au BufNewFile,BufRead *.anki set filetype=anki
" add anki comments and format options
autocmd FileType anki setlocal formatoptions +=r formatoptions +=o formatoptions +=l formatoptions +=n comments+=b:*,b:+,b:> comments-=fb:- comments+=b:-
"<leader>anki pastes the clipboard
autocmd Filetype anki nnoremap <leader>anki :set paste<cr>i<c-r>*<esc>:set nopaste<cr>
"above process is automated when opening a new file
function! AnkiAutoPaste()
    set paste
    "! prevents mapping
    """""normal! "*p 
    " removes ^m in win enter
    """""normal! :silent %s/\r/\r/g
    """""Either the above two commands or the below one works fine
    normal! i*
    set nopaste
endfunction
autocmd BufNewFile *.anki call AnkiAutoPaste()
"anki auto copy to clipboard when exit
autocmd Filetype anki nnoremap <c-q> gg"*yG:q<cr>


" Enter insert mode automatically when editing git commit messages 
"autocmd FileType gitcommit 1 | startinsert "by benjifisher from so "error when fugitive

au filetype csv setlocal noexpandtab "don't expand tab if csv
let g:tex_flavor='latex'
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
"set autochdir
autocmd BufEnter * silent! lcd %:p:h
" set the file's directory as pwd; useful for fzf opened files
nnoremap :setdir :silent! lcd %:p:h<cr>


" Saves undo's after file closes
set undofile

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

nnoremap :sov :so $MYVIMRC<cr>

set path+=** " from the thoughtbot youtube How to do 90% of what plugins do. use :find plug*

set scrolljump=1

map <ScrollWheelUp> <C-y>
map <mouseup> <C-y>
map <ScrollWheelDown> <c-e>
map <mousedown> <C-e>

let g:vim_json_syntax_conceal = 0 "not working. It is said that it works for vim-json
set conceallevel =0

" syntax highlight too slow. Test 
set nocursorcolumn
set nocursorline
"set norelativenumber
"syntax sync minlines=256

"set magic "equivalent of :%s/\m
"\v useful as it interprets all symbols as special

"section============================================================================
"COLORSCHEMES
"===================================================================================

"Currently using solarized colorscheme. Check the plugin.

"colorscheme monokain

"((gruvbox) 
"colorscheme gruvbox
"set bg=dark
")

"((MOLOKAI)
"colorscheme molokai
"let g:molokai_original = 1
"set bg=dark
"let g:rehash256 = 1
")


inoremap <c-h> h

"section============================================================================
" MISC
"===================================================================================

"Change color of list chars (such as tab, carriage return chars) to red
hi NonText ctermfg=1 guifg=gray

"All comments copied are referenced with '-by John Doe' format.
"partly referred to Janus .vimrc
" For refactoring within {} for javascript which gd, gD (go to definition) does not work.

function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename'" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
nnoremap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x

" Locally (local to block) rename a variable in python, since python is not using {}
nnoremap <Leader>prf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[%V]%:s/<C-R>//<c-r>z/g<cr>`x
