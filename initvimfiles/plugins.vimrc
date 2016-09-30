
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

"(NEOCOMPLETE
"Not using Neocomplete anymore. Changed to Deoplete for neovim compatibility.
"It sounds strange but Neocomplete does not work for neovim. Use Deoplete instead.
""let g:neocomplete#enable_at_startup = 1
""let g:neocomplcache_enable_cursor_hold_i=1
"Enable <TAB> for Neocomplete. It also helps tabs recover its original functionality.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
""            \ <SID>check_back_space() ? "\<TAB>" :
""            \ neocomplete#start_manual_complete()
""function! s:check_back_space() "{{{
"    h""let col = col('.') - 1
"    ""return !col || getline('.')[col - 1]  =~ '\s'
""endfunction"}}}
")

"(VIMPLUG 
"To install, type :
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"use :sort /.... '.*\// to sort the lines.
call plug#begin('$HOME/.config/nvim/plugged') "TODO
Plug 'kien/ctrlp.vim'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/goyo.vim'
Plug 'yggdroot/indentline'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'suan/vim-instant-markdown'
Plug 'plasticboy/vim-markdown'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
call plug#end()
")

"(CTRLP.VIM
" help: ,p toggles
let g:ctrlp_map = '<leader>ctp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
nnoremap <leader>cp :CtrlP<Space>.<cr>
")

"(GOYO
"autocmd VimEnter * Goyo
")

"(LIMELIGHT
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = "gray"
let g:limelight_conceal_ctermfg = 245
"autocmd VimEnter * Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
")

"(SOLARIZED
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set bg=light
colorscheme solarized
")

"(DEOPLETE
let g:deoplete#enable_at_startup = 1
" Use smartcase
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" Let <TAB> also do completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" close preview window on leaving the insert mode
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
set completeopt-=preview
")

"(DEOPLETE-CLANG
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/3.8.1/lib/clang'
let g:deoplete#eable_refresh_always = 1
")

"(SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
")

"(TAGBAR
" help: ,tb toggles tagbar. <c-w><c-w> changes window and press ? for details.
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_width=30
"autocmd VimEnter * Tagbar
")

"(SEMANTIC HIGHLIGHT
nnoremap <Leader>h :SemanticHighlightToggle<cr>
""let g:semanticTermColors = [1,2,3,9,10,12,13,14,15,125]
""autocmd VimEnter * SemanticHighlightToggle
" also highlight words starting with $ in javascript.
""autocmd FileType javascript setlocal iskeyword+=$
")

"(NERDCOMMENTER
"let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
")

"(NERDTREE
" help: ,nt toggles. Then type ? for details.
let NERDTreeShowHidden=1
map <leader>nt :NERDTreeToggle<CR>
""autocmd VimEnter * NERDTree
")

"(AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'light'
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
")

"(TABULAR
")

"(VIM-MARKDOWN
nnoremap <leader>>> V:HeaderIncrease<CR>
nnoremap <leader><< V:HeaderDecrease<CR>
")

"(VIM-INSTANT-MARKDOWN
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

"(VIM-MULTI-CURSOR
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

"(VIM-SEEK
")

"(VIM-GUTTER
" help: [c, ]c jumps to hunk
" help: <leader>hp for preview, <leader>hs for stage, <leader>hu for undo
")

"(FILETYPE
filetype plugin indent on
" turn off auto commenting when <cr>
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o 
" Check the status by set formatoptions?, then you would see jql


" Syntax of these languages is fussy over tabs Vs spaces - by VimCast
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 noexpandtab

" Customizations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
" Turn on auto listing
autocmd FileType markdown setlocal formatoptions +=c formatoptions +=r formatoptions +=o
" Check the status by set formatoptions? and then you will see jqtlncro

" Enter insert mode automatically when editing git commit messages 
autocmd FileType gitcommit 1 | startinsert "by benjifisher from so
")

"(SYNTAX ENABLE
if !exists("g:syntax_on")
    syntax enable
endif " by Andy Ray from SO
")

