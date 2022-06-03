# emacs keybinding such as ctrl-w
set-psreadlineoption -editmode vi

function x(){ python main.py}

function r() {python @args}

function mc() { mkdir @args ; cd @args }

function co() { code @args }

function profile() {
    code $profile
}

function alex() {
    set-location "$home\Documents\Github\Alex"

}

function dotfiles() {
    set-location "$home\Documents\Github\dotfiles"
}

function ls() {
    get-childItem @args -force
}

function l() {
    get-childItem @args -force
}

function c() {
    set-location @args; get-childItem
}

$alexPath = "$home/Documents/github/Alex"

function exe() {
    set-location "$alexPath/out/build/x64-Debug/"
}

function diffBinary() {
    fc.exe @args;
}

# CG hw 2

$githubPath = "$home/Documents/github"

function cg() {
    set-location "$githubPath/cg-hw2"
}


function hw() {
    set-location "$githubPath/cg-hw2"
}


function ln ($target, $link) {
    new-item -path $link -itemtype SymbolicLink -value $target
}