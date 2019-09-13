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
"set bg=light
"let g:gruvbox_contrast_light = 'soft'
")

"((MOLOKAI)
"colorscheme molokai
"let g:molokai_original = 1
"set bg=dark
"let g:rehash256 = 1
")

colo zenburn
"let g:seoul256_srgb=1
"let g:seoul256_background=252
"colo seoul256

" Prevent vim from overriding default terminal background"
"https://stackoverflow.com/a/21572296/6154359
hi Normal ctermbg=none


