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
