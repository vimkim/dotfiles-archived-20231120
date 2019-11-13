" plugins starting with 'vim' (starts with vim)
Plug 'tpope/vim-abolish' "help writing
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'djoshea/vim-autoread'

"Plug 'bling/vim-bufferline'

Plug 'ap/vim-buftabline'
let g:buftabline_numbers = 2
nmap <space>! <Plug>BufTabLine.Go(1)
nmap <space>@ <Plug>BufTabLine.Go(2)
nmap <space># <Plug>BufTabLine.Go(3)
nmap <space>$ <Plug>BufTabLine.Go(4)
nmap <space>% <Plug>BufTabLine.Go(5)
nmap <space>^ <Plug>BufTabLine.Go(6)
nmap <space>& <Plug>BufTabLine.Go(7)
nmap <space>* <Plug>BufTabLine.Go(8)
nmap <space>( <Plug>BufTabLine.Go(9)
nmap <space>) <Plug>BufTabLine.Go(10)

"Plug 'jooize/vim-colemak'
"Plug 'altercation/vim-colors-solarized'
Plug 'octol/vim-cpp-enhanced-highlight' "may conflict with easytags
"Plug 'bfrg/vim-cpp-modern' "inspired by vim-cpp-enhanced-highlight
Plug 'easymotion/vim-easymotion'

""" warning: if easytags does not work after emacs install, brew link --overwrite ctags
" emacs overwrites ctags with its own version of ctags on install. annoying...
"Plug 'xolox/vim-misc' " must be before easytags
"Plug 'xolox/vim-easytags'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
"Plug 'szw/vim-g'
Plug 'tenfyzhong/vim-gencode-cpp'
Plug 'airblade/vim-gitgutter'

" required for colemak neio arrow key mappings. (for visual mode i)
let g:gitgutter_map_keys = 0


Plug 'rhysd/vim-grammarous'
"Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx']}
"
"Plug 'skywind3000/vim-keysound'
let g:keysound_enable = 1
Plug 'xuhdev/vim-latex-live-preview'
" lambdify location

" markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }

"Plug 'daeyun/vim-matlab', { 'do': function('DoRemote')}
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-obsession'
Plug 'mattn/vim-particle'
Plug 'reedes/vim-pencil'
"Plug 'tpope/vim-repeat' "disabled for colemap
Plug 'google/vim-searchindex'

"(VIM-SLIME
"Plug 'jpalardy/vim-slime', { 'for': [ 'python', 'R', 'lisp', 'ocaml' ] }
Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
"let isitwsl=$iswsl
"if isitwsl == 'true'
""if $iswsl == 'true' " also works  << was not the actual reason it was because of the absence of $TMUX variable
if $TMUX != '' "test wether I'm currently in tmux or not
    "let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
    let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
endif
" Tip: for socket, default, for pane, $session:0.0 
" You can identify it with the command $tmux list-panes -a
"let g:slime_python_ipython = 1 "This not working
")



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
"Plug 'zefei/vim-wintabs' " this can't display the buffer number

Plug 'jnurmine/Zenburn'
let g:zenburn_transparent = 1
"Plug 'dhruvasagar/vim-zoom'
" pluglist end
