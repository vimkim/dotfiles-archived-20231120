# emacs keybinding such as ctrl-w
set-psreadlineoption -editmode vi

function x() { python main.py }

function r() { python @args }

function mc() { mkdir @args ; cd @args }

function co() { code @args }

function profile() {
    code $profile
}

function profiledir(){
    cd "$home\Documents\WindowsPowerShell\"
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

### cl begin ###
function _ls{Get-ChildItem -name @args -Force}

Set-Alias l _ls

Set-Alias -Name ls -Value _ls -Option AllScope

function ll{Get-ChildItem}

function _cd {
    # for pipelines to work
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        $_cd_paths
    )
    if ($null -eq $_cd_paths) {
        Set-Location $home
    }
    else {
        Set-Location $_cd_paths
    }
#if ($args.count -eq 0){
#    Set-Location $home
#}
#else{
#    Set-Location @args
#}
}

Set-Alias -Name cd -Value _cd -Option AllScope
function cl {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        $_cd_paths
    )
    If ($null -ne $_cd_paths) {
        _cd $_cd_paths
    }
    _ls
}

function c { cl @args; }
### cl end ###

