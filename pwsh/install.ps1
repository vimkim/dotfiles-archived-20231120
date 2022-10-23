# run this with administrative privilege.
function ln ($target, $link) {
    new-item -path $link -itemtype SymbolicLink -value $target
}

ln ~\Documents\Github\