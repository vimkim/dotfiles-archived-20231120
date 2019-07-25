"pluglist begin:
Plug 'vim-scripts/a.vim'
Plug 'mileszs/ack.vim' "code search // needs extra install of ack
Plug 'w0rp/ale' "saves my life
"Plug 'jiangmiao/auto-pairs' " This plugin is buggy with Korean inputs when 'set noimd'. also bug with wsl
" these settings disable julia autopairs.. disabled
"au FileType lisp let b:autopairs_loaded=1 "auto-pairs inferior for lisp
"au FileType scheme let b:autopairs_loaded=1 "auto-pairs inferior for lisp


"Plug 'vim-scripts/Better-Javascript-Indentation' "not work"

if !has('nvim')
    "Plug 'jeaye/color_coded' " neovim not yet supported; needs compilation at update
    " https://github.com/jeaye/color_coded#all for details
    " not able to compile in El Capitan
end

Plug 'mikezackles/Bisect'
"Plug 'kien/ctrlp.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv' } "it works for ;sv and tsv as well
"Plug 'Raimondi/delimitMate' " This plugin is also buggy with Korean inputs when 'set noimd'. // Actually, It turned out that this is because of macvim itself. Go to Advanced setting and turn off 'inline marked' and 'core renderer' settings. Also, 'set guifontwide=NanumGothic:h22' helped.

if has('nvim') " The below 2 plugins are not used for vim
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " unfortunately not very useful, except for filepath completeion. However, this can be replaced by <c-x><c-f>
    " maybe some bugs with markdown files.
    "Plug 'zchee/deoplete-clang'
else " Instead of the above two, neocomplete for vim
    "Plug 'Shougo/neocomplete.vim'
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap ,bl :Buffers<cr>
nnoremap ,ls :Buffers<cr>
nnoremap ,bu :Buffers<cr>

nnoremap ,bf :Buffers<cr>
nnoremap ;bf :Buffers<cr>

nnoremap ,zf :Files<cr>
nnoremap ,vx :Files<cr>
nnoremap ;vx :Files<cr>

nnoremap ,/ :Lines<cr>
" file path completion
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" paste fzf result to buffer
" https://github.com/junegunn/fzf.vim/issues/580
function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': function('s:copy_results'),
  \ }

"Plug 'junegunn/goyo.vim')
Plug 'morhetz/gruvbox'
Plug 'sjl/gundo.vim'
"Plug 'yggdroot/indentline' "this plugin has conflicts with conceal update. eg) lambdify
"Plug 'davidhalter/jedi-vim', { 'for': 'python' } " too slow
"Plug 'itchyny/lightline.vim'

"Plug 'junegunn/limelight.vim'
Plug 'yegappan/mru' " most recently used
"Plug 'Shougo/neoinclude.vim' "too slow
Plug 'scrooloose/nerdcommenter' "too slow

Plug 'scrooloose/nerdtree'
Plug 'jalvesaq/Nvim-R'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/rainbow_parentheses.vim' "seems like only works with gui. True color?
" - does not work automatically with lisp
"Plug 'vim-scripts/vim-niji' " has similar functionality with rainbow_parentheses " bug in wsl
"- auto enabled with lisp
Plug 'unblevable/quick-scope'
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

"Plug 'chrisbra/Recover.vim' "temp file diff
Plug 'vim-scripts/restore_view.vim' " save folds - seems not working
"(restore_view
set viewoptions=cursor,folds,slash,unix

")

"Plug 'scrooloose/syntastic'
Plug 'junegunn/seoul256.vim'
Plug 'godlygeek/tabular'
"Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' "Snippets Engine
Plug 'honza/vim-snippets' " Snippets, let me put next to ultisnips

" https://github.com/Valloric/YouCompleteMe/issues/1751
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" By default, do not install YCM cuz it's too large.
" You can install it when you add a file named ycm_install.txt in .vim
" directory.
if filereadable($HOME."/dkenv/.vim/ycm_install.txt")
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    " - python: pip install jedi
    " - javascript: npm install -g typescript
    "   and add jsconfig.json in the project root

    "(YouCompleteMe Settings
    " TIP: YCM has two completer: identifier and semantic. Use ctrl-space to trigger the `semantic` one.
    let g:ycm_key_list_select_completion = ['<Down>'] "Default: ['<TAB>', '<Down>'] <- key to cycle through list
    let g:ycm_key_list_select_previous_completion = ['<Up>'] "Default: ['<S-TAB>', '<Up>'] *<S-TAB> only works in GUI
    let g:ycm_key_list_stop_completion = ['<C-y>'] "Default: ['<C-y'] *written as useful for ultisnips
    let g:ycm_key_invoke_completion = '<C-Space>' " for `semantic` completion, not identifier. In c-family, ., ->, :: works. Useful for searching for top-level functions & classes.
    let g:ycm_global_ycm_extra_conf = '~/runtime_config/vim/.ycm_extra_conf_general.py'

    if has('mac')
         let g:ycm_python_binary_path = '/usr/local/bin/python3'
         " if python does not work, pip install jedi
    endif
    let g:ycm_confirm_extra_conf = 0 "Default: 1
    let g:ycm_add_preview_to_completeopt = 0 "default 0
    " Options:
    let g:ycm_min_num_of_chars_for_completion = 2 "(default 2)
    let g:ycm_auto_trigger = 1 "(default 1) "YCM has two triggers: identifier completer (as-you-type) and semantic trigger (i.e. . or -> in c++). If this option is set to 0, both triggers are disabled.
    "let g:ycm_filetype_blacklist
    "let g:ycm_filetype_whitelist
    let g:ycm_error_symbol = '->' "default '>>'
    let g:ycm_warning_symbol = '<<' "default '>>'
    let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
    ")
endif

Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' }

Plug 'vim-scripts/upAndDown'

"something similar for GUI? keynav (linux), XEasyMotion (macOS)
" disabled for colemak neio arrow key compatibility
Plug 'vim-scripts/BinarySearchMove'
" instead of this, use J, K -> update: it turned out that this is more consistent than J, K as this
" plugin searches through the whole lines.
"noremap U :call BSMoveBufGoUp()<CR>
"noremap D :call BSMoveBufGoDown()<CR>

