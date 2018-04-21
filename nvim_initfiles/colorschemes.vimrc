"section============================================================================
"COLORSCHEMES
"===================================================================================

"""" IMPORTANT
"Show Whitespace
" Must be inserted Before colorscheme command
"autocmd colorscheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

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

" Prevent vim from overriding default terminal background"
"https://stackoverflow.com/a/21572296/6154359
"hi Normal ctermbg=none
