"( Ack
cnoreabbrev Ack Ack!
nnoremap <leader>ask :Ack!<space>
nnoremap ;ask :Ack!<space>
" go to preview, o to open, <c-n> <c-j> to navigate
")

"( ALE
let g:ale_sign_column_always = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
" error navigation, therefore ]l, ]l with unimpaired plugin might not be necessary
nmap <c-k> <plug>(ale_previous_wrap)
nmap <c-j> <plug>(ale_next_wrap)
" use quickfix instead of loclist
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
"let g:ale_keep_list_window_open = 1
")

"(AUTO-PAIRS
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
au Filetype markdown let b:autopairs_loaded=1
"au filetype lisp let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
"au Filetype lisp let b:autopairs_loaded=1
")

"(CTRLP.VIM
let g:ctrlp_map = '<leader><c-p>' "default: '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
cnoreabbrev cp CtrlP
let g:ctrlp_show_hidden = 1
nnoremap <leader>cp :CtrlP<Space>
nnoremap ;cp :CtrlP<Space>
" by default <c-j> and <c-k> are used for navigation. Add <c-n> and <c-p>.
" https://github.com/kien/ctrlp.vim/issues/104
let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")': ['<c-j>', '<c-n>'],
            \ 'PrtSelectMove("k")': ['<c-k>', '<c-p>'],
            \ 'PrtHistory(-1)':     ['<down>'],
            \ 'PrtHistory(1)':      ['<up>'],
            \ }

" use CtrlPDir and <c-t>,<c-v> to change directory
" <c-x> is buggy
nnoremap ,cd <esc>:CtrlPDir ~/
nnoremap ;cd <esc>:CtrlPDir ~/
"nnoremap ,bl :CtrlPBuffer<cr>
"nnoremap ;bl :CtrlPBuffer<cr>
"nnoremap ,ls :CtrlPBuffer<cr>
"nnoremap ;ls :CtrlPBuffer<cr>
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" CtrlP does not work well with tags. Use fzf instead.
"nnoremap ;ct :CtrlPTag<cr>

" previously max height
let g:ctrlp_match_window  = 'results:100' "overcome limit imposed by max height. This is a 'necessary' line.

")

"CSV.VIM
" :ArrangeColumn , :UnarrangeColumn useful
" HJKL navigation (capital letters)
" To override, let g:csv_delim=','
"let g:csv_delim='\t'
"inoremap ;date <esc>:put =strftime('%Y-%b-%d %a %T')<cr><esc>
let g:csv_no_conceal = 1 " unlet g:csv_no_conceal to disable

"(FZF)
"nnoremap ;fz :FZF ~/
"nnoremap <c-x><c-f> :FZF<cr>
let g:fzf_launcher = "/usr/local/bin/fzf_launcher.sh %s"
")

"(FZF.VIM
"nmap <c-x><c-f> <plug>(fzf-complete-path)
cnoreabbrev fzt :Tags
nnoremap ,fzt :Tags<cr>
nnoremap ;fzt :Tags<cr>
")
" FZF vs. CTRLP
" FZF does not have a directory search.
" Below function is the first-aid. https://github.com/junegunn/fzf.vim/issues/251
" `:Cd .` function works but does not exclude .git
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'find '.(empty(<f-args>) ? '.' : <f-args>).' -type d',
  \  'sink': 'cd'}))

" to insert directory on Vim's command line:
function! s:append_dir_with_fzf(line)
  call fzf#run(fzf#wrap({
    \ 'options': ['--prompt', a:line.'> '],
    \ 'source': 'find . -type d',
    \ 'sink': {line -> feedkeys("\<esc>:".a:line.line, 'n')}}))
  return ''
endfunction
cnoremap <expr> <c-x><c-d> <sid>append_dir_with_fzf(getcmdline())

"(GOYO
"autocmd VimEnter * Goyo
")
"(GUNDO.VIM
nnoremap <leader>gu :GundoToggle<cr>
")

"(JEDI-VIM
"let g:jedi#force_py_version = 3 " this prevents the error message: the detected python version (2) is not functional
"let g:jedi#popup_on_dot = 0 " too slow
")

"(LIMELIGHT
" Color name (:help cterm-colors) or ANSI code
"let g:limelight_conceal_ctermfg = "gray"
let g:limelight_conceal_ctermfg = 245
"autocmd VimEnter * Limelight
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
")

"(LIGHTLINE " not using"
"let g:lightline = {'colorscheme': 'PaperColor',}
")

"(MARKDOWN PREVIEW
"let g:mkdp_path_to_chrome = "open -a Safari"
let g:mkdp_path_to_chrome = "open -a '/Applications/Google Chrome.app'"
"let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1 " refresh when save the buffer or leave from insert mode
let g:mkdp_command_for_global = 0 " markdown preview command can be use for all files
")
"(SOLARIZED
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set bg=light
"colorscheme solarized
")

""" "(DEOPLETE
""" if has('nvim')
"""     let g:deoplete#enable_at_startup = 1
"""     " auto complete error temporary fix "https://github.com/Shougo/deoplete.nvim/issues/440"
"""     let g:deoplete#auto_complete_delay = 250
"""     " Use smartcase
"""     let g:deoplete#enable_ignore_case = 1
"""     let g:deoplete#enable_smart_case = 1
"""     "let g:deoplete#auto_complete_start_length = 3
"""     let g:deoplete#disable_auto_complete = 0
"""     " Let <TAB> also do completion
"""     "inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"""     " close preview window on leaving the insert mode
"""     "autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
"""     set completeopt-=preview
"""     " Two lines for Disable buffer source
"""     let g:deoplete#ignore_sources = {}
"""     let g:deoplete#ignore_sources._ = ['buffer']
"""     let b:deoplete_ignore_sources = ['buffer']
"""     "let g:deoplete#enable_refresh_always = 1
"""     ")
"""
"""     "(DEOPLETE-CLANG
"""     let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/4.0.0/lib/libclang.dylib'
"""     let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/4.0.0/lib/clang'
"""     ")
""" endif

"" "if !has('nvim')
""    "(NEOCOMPLETE
""
""    "let g:neocomplcache_enable_cursor_hold_i=1
""    "Enable <TAB> for Neocomplete. It also helps tabs recover its original functionality.
""    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
""    ""            \ <SID>check_back_space() ? "\<TAB>" :
""    ""            \ neocomplete#start_manual_complete()
""    ""function! s:check_back_space() "{{{
""    "    h""let col = col('.') - 1
""    "    ""return !col || getline('.')[col - 1]  =~ '\s'
""    ""endfunction"}}}}}}}}}
""    ")
""    "
""    "(NEOCOMPLETE
""    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
""    " Disable AutoComplPop.
""    let g:acp_enableAtStartup = 0
""    " Use neocomplete.
""    let g:neocomplete#enable_at_startup = 1
""    let g:neocomplete#auto_complete_delay = 255
""    " Use smartcase.
""    "let g:neocomplete#enable_smart_case = 1
""    " Set minimum syntax keyword length.
""    "let g:neocomplete#sources#syntax#min_keyword_length = 3
""
""    " Define dictionary.
""    "let g:neocomplete#sources#dictionary#dictionaries = {
""        "\ 'default' : '',
""        "\ 'vimshell' : $HOME.'/.vimshell_hist',
""        "\ 'scheme' : $HOME.'/.gosh_completions'
""            "\ }
""
""    " Define keyword.
""    "if !exists('g:neocomplete#keyword_patterns')
""        "let g:neocomplete#keyword_patterns = {}
""    "endif
""    "let g:neocomplete#keyword_patterns['default'] = '\h\w*'
""
""    " Plugin key-mappings.
""    "inoremap <expr><C-g>     neocomplete#undo_completion()
""    "inoremap <expr><C-l>     neocomplete#complete_common_string()
""
""    " Recommended key-mappings.
""    " <CR>: close popup and save indent.
""    "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
""    "function! s:my_cr_function()
""      "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
""      " For no inserting <CR> key.
""      "return pumvisible() ? "\<C-y>" : "\<CR>"
""    "endfunction
""    " <TAB>: completion.
""    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""    " <C-h>, <BS>: close popup and delete backword char.
""    "inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
""    "inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
""    " Close popup by <Space>.
""    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
""
""    " AutoComplPop like behavior.
""    "let g:neocomplete#enable_auto_select = 1
""
""    " Shell like behavior(not recommended).
""    "set completeopt+=longest
""    "let g:neocomplete#enable_auto_select = 1
""    "let g:neocomplete#disable_auto_complete = 1
""    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
""
""    " Enable omni completion.
""    "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
""    "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
""    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
""    "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""
""    " Enable heavy omni completion.
""    if !exists('g:neocomplete#sources#omni#input_patterns')
""      let g:neocomplete#sources#omni#input_patterns = {}
""    endif
""    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
""
""    " For perlomni.vim setting.
""    " https://github.com/c9s/perlomni.vim
""    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""    ")
"" endif

""  "(SYNTASTIC
""  "set statusline+=%#warningmsg#
""  "set statusline+=%{SyntasticStatuslineFlag()} "TODO
""  "set statusline+=%*
""  let g:syntastic_always_populate_loc_list = 1
""  let g:syntastic_auto_loc_list = 1
""  let g:syntastic_check_on_open = 1
""  let g:syntastic_check_on_wq = 0
""  if has('mac')
""      let g:syntastic_python_python_exec = '/usr/local/bin/python3'
""  else
""      let g:syntastic_python_python_exec = '/usr/bin/python3'
""  endif
""  ")

"(TAGBAR
" help: ,tb toggles tagbar. <c-w><c-w> changes window and press ? for details.
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_width=30
"autocmd VimEnter * Tagbar
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
nnoremap ;prev :MarkdownPreview<cr>
nnoremap ,prev :MarkdownPreview<cr>
nnoremap ;nprev :MarkdownPreviewStop<cr>
nnoremap ,nprev :MarkdownPreviewStop<cr>
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
nnoremap <f11> <esc>:NERDTreeToggle<cr>
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p " moves cursor to filesafter opening nerdtree
let g:NERDTreeWinSize=20
")

"COLORSCHEME GENERAL
"set bg=dark


if !has('nvim') && $iswsl=='true'
    set t_Co=256
endif

"colorscheme PaperColor
"colorscheme zenburn

"(RAINBOW-PARENTHESES.VIM
"au VimEnter * RainbowParenthesesToggle
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
"let g:indentLine_char = '▶' "error in windows
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_term = 100
" special:·│¦┆➤▶
let g:indentLine_setColors = 0
"let g:indentLine_setConceal = 0
""" let g:indentLine_enabled = 0
let g:indentLine_concealcursor = &concealcursor
let g:indentLine_conceallevel = &conceallevel

")

"(VIM-CPP-ENHANCED-HIGHLIGHT
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
")

"(EASYMOTION
" Disable default mapping
let g:EasyMotion_do_mapping = 0
" This allows you to jump onto a specific letter.
" the first line allows you to trigger in visual mode as well (very helpful)
"map <leader>f <plug>(easymotion-bd-f)
map <leader>f <plug>(easymotion-bd-f)
"map ff <plug>(easymotion-bd-f)
" allows you to move regardless of buffer (for :vsplit, etc.)
nnoremap <Leader>emf <Plug>(easymotion-overwin-f)
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
"map L <plug>(easymotion-bd-jk)
map <space><space> <plug>(easymotion-bd-jk)
nmap <leader>L <plug>(easymotion-overwin-line)
" Move to word
"map <leader>fw <plug>(easymotion-bd-w)
nmap <leader>emw <plug>(easymotion-overwin-w)
")

"(TABULAR
" :Tabularize /= useful
" :Tabularize /=\zs more useful
" align variable (\S <= non-whitespace character)
vnoremap ;alivar :Tabularize /\S\+;
" MY function: undo tabularize
vnoremap ;untab :s/\v(\s)\s+/\1/gc
vnoremap ;uncsv :s/\v\s+,\s+/,/gc
" expl: basically, replace two or more spaces as one space vnoremap ;untab s/\v(\s)\s+/ /gc " this also works
" for latex equation aligning, :Tabularize /\\\\$
")

"(VIM-MARKDOWN
nnoremap <leader>>> V:HeaderIncrease<CR>
nnoremap <leader><< V:HeaderDecrease<CR>
"" let g:vim_markdown_conceal = 0 " disable conceal regardless of conceallevel // I should enable this because meslo font that I'm currently using does not support bold nor italic.
"To disable math conceal with LaTex math syntax enabled

"" let g:tex_conceal = ""
"" let g:vim_markdown_math = 1
"" "let g:vim_markdown_folding_level = 3

"let g:vim_markdown_fold_on_headings = 1
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
"highlight link cMember Italics
""let g:easytags_on_cursorhold=1
" run asynchronouse tags file updates
if has('mac')
    let g:easytags_cmd = '/usr/local/bin/ctags'
endif
let g:easytags_async = 1
"let g:easytags_file = '~/.vimtags' "default: ~/.vimtags
let g:easytags_suppress_ctags_warning = 0
set tags=./tags; " better be written before dynamic_files setting
let g:easytags_dynamic_files = 2 "1 uses local tags; 2 creates local tags
")

"(VIM-EXCHANGE
" Defaults key-mappings
" nmap cx <Plug>(Exchange)
" vmap X <plug>(Exchange)
" nmap cxc <Plug>(ExchangeClear)
" nmap cxx <Plug>(ExchangeLine)
")

"(VIM-FUGITIVE
"temporarily disable statusline for experiments
"set statusline+=%{fugitive#statusline()}
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

"Second approach: Not working under windows

" Follow symlinks when opening a file {{{
" NOTE: this happens with directory symlinks anyway (due to Vim's chdir/getcwd
"       magic when getting filenames).
" Sources:
"  - https://github.com/tpope/vim-fugitive/issues/147#issuecomment-7572351
"  - http://www.reddit.com/r/vim/comments/yhsn6/is_it_possible_to_work_around_the_symlink_bug/c5w91qw
""" function! MyFollowSymlink(...)
""" if exists('w:no_resolve_symlink') && w:no_resolve_symlink
"""   return
""" endif
""" let fname = a:0 ? a:1 : expand('%')
""" if fname =~ '^\w\+:/'
"""   " Do not mess with 'fugitive://' etc.
"""   return
""" endif
""" let fname = simplify(fname)
""" 
""" let resolvedfile = resolve(fname)
""" if resolvedfile == fname
"""   return
""" endif
""" let resolvedfile = fnameescape(resolvedfile)
""" let sshm = &shm
""" set shortmess+=A  " silence ATTENTION message about swap file (would get displayed twice)
""" exec 'file ' . resolvedfile
""" let &shm=sshm
""" 
""" " Re-init fugitive.
""" call fugitive#detect(resolvedfile)
""" if &modifiable
"""   " Only display a note when editing a file, especially not for `:help`.
"""   redraw  " Redraw now, to avoid hit-enter prompt.
"""   echomsg 'Resolved symlink: =>' resolvedfile
""" endif
""" endfunction
""" command! FollowSymlink call MyFollowSymlink()
""" command! ToggleFollowSymlink let w:no_resolve_symlink = !get(w:, 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>" w:no_resolve_symlink
""" au BufReadPost * nested call MyFollowSymlink(expand('%'))
""" ")

"(VIM-GENCODE-CPP) << useful
cnoreabbrev gendec GenDeclaration
cnoreabbrev gendef GenDefinition
")

"(VIM-MATLAB
au filetype matlab nnoremap ,matser :MatlabLaunchServer<CR>
let g:matlab_auto_mappings = 1 "default
let g:matlab_server_launcher = 'tmux' "default is vim
let g:matlab_server_split = 'vertical' "or horizontal
")

"(VIM-MULTIPLE-CURSOR
" help: <c-n> for highlighting a word and continue if pressed again
" help: <c-p> for going back, <c-x> for skipping and continue
" help: multipleCursorsFind for regular expression
" By default, multicursor starts with <c-n>. Change with the following:
let g:multi_cursor_start_key='<leader>mc'
" multi_cursor_quit_key
let g:multi_cursor_quit_key='<C-c>'
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
"nnoremap <silent> f :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>f
"snoremap <silent> f :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>f
"nnoremap <silent> F :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>F
"nnoremap <silent> t :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>t
"nnoremap <silent> T :<c-u>call repeat#set("\<lt>Plug>NextMatch")<CR>T
")

"(VIM-SMOOTH-SCROLL
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
")

"(VIM-SURROUND
" mapping for anki cloze
let g:surround_99 = "{{c1::\r}}"
" mapping for markdown
let g:surround_98 = "**\r**" " press b
" mapping for latex mathmode
let g:surround_108 = "$$ \r $$" " press l
")

"(VIM-INDENT-GUIDES
" let g:indent_guides_enable_on_vim_startup = 1
")

