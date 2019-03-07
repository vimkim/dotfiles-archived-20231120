" plugins starting with 'vim' (starts with vim)
Plug 'tpope/vim-abolish' "help writing
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'djoshea/vim-autoread'

"Plug 'bling/vim-bufferline'
"Plug 'ap/vim-buftabline'
"Plug 'jooize/vim-colemak'
"Plug 'altercation/vim-colors-solarized'
Plug 'octol/vim-cpp-enhanced-highlight' "may conflict with easytags
"Plug 'bfrg/vim-cpp-modern' "inspired by vim-cpp-enhanced-highlight
Plug 'easymotion/vim-easymotion'

""" warning: if easytags does not work after emacs install, brew link --overwrite ctags
" emacs overwrites ctags with its own version of ctags on install. annoying...
Plug 'xolox/vim-misc' " must be before easytags
Plug 'xolox/vim-easytags'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'szw/vim-g'
Plug 'tenfyzhong/vim-gencode-cpp'
Plug 'airblade/vim-gitgutter'

" required for colemak neio arrow key mappings. (for visual mode i)
let g:gitgutter_map_keys = 0


Plug 'rhysd/vim-grammarous'
"Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx']}
Plug 'xuhdev/vim-latex-live-preview'
" lambdify location

" markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }

Plug 'daeyun/vim-matlab', { 'do': function('DoRemote')}
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-obsession'
Plug 'mattn/vim-particle'
Plug 'reedes/vim-pencil'
"Plug 'tpope/vim-repeat' "disabled for colemap
Plug 'google/vim-searchindex'
Plug 'jpalardy/vim-slime', { 'for': [ 'python', 'R', 'lisp' ] }
"Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'

Plug 'janko-m/vim-test'
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g


Plug 'lervag/vimtex', { 'for': 'tex' }

"(( disabled for colemak neio arrow layout
"Plug 'kana/vim-textobj-user' "required for underscore plugin
"Plug 'lucapette/vim-textobj-underscore' "kana's user plugin required
"))
"
Plug 'tpope/vim-unimpaired'
Plug 'zefei/vim-wintabs'

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

Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' }
let g:zenburn_transparent = 1
Plug 'jnurmine/Zenburn'
Plug 'dhruvasagar/vim-zoom'
" pluglist end
