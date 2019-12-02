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

" Corrupt Backspace with Windows powershell vim
"Plug 'mikezackles/Bisect'

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

Plug 'junegunn/fzf', { 'dir': '~/dkenv/.fzf', 'do': './install --all' }
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

Plug 'pandysong/ghost-text.vim'

"Plug 'junegunn/goyo.vim')
Plug 'morhetz/gruvbox'
Plug 'sjl/gundo.vim'
"Plug 'yggdroot/indentline' "this plugin has conflicts with conceal update. eg) lambdify
"Plug 'davidhalter/jedi-vim', { 'for': 'python' } " too slow
"Plug 'itchyny/lightline.vim'

"Plug 'junegunn/limelight.vim'
"Plug 'yegappan/mru' " most recently used
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

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
"Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
"Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' "Snippets Engine
Plug 'honza/vim-snippets' " Snippets, let me put next to ultisnips

Plug 'vim-scripts/upAndDown'

"something similar for GUI? keynav (linux), XEasyMotion (macOS)
" disabled for colemak neio arrow key compatibility
Plug 'vim-scripts/BinarySearchMove'
" instead of this, use J, K -> update: it turned out that this is more consistent than J, K as this
" plugin searches through the whole lines.
"noremap U :call BSMoveBufGoUp()<CR>
"noremap D :call BSMoveBufGoDown()<CR>

