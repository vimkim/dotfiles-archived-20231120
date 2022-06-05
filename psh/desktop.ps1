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

### baekjoon begin ###
function cpm {
    cat main.py | clip
}

function cppy {
    cat main.py | clip
}

function cpcpp {
    cat main.cpp | clip
}

function mco($dir) {
    mkdir $dir ; code $dir
}

function prepare($dir) {
    if (Test-Path -Path $dir) {
        "Path already exists!"
        return
    }
    mkdir $dir;
    copy-item -Path "$env:userprofile\Documents\Github\baekjoon\template\*" -Destination $dir -recurse
}

function play($dir) {
    #new-item $dir/main.py;
    #new-item $dir/i2;
    prepare $dir
    cd $dir;
    code -r .
    #code --goto main.py:23:4
    code --goto main.cpp:70:4
}

function compete($dir) {
    mkdir $dir;
    cd $dir;
    prepare A;
    prepare B;
    prepare C;
    prepare D;
    prepare E;
    prepare F;
}

### baekjoon end ###


### zlocation, fzf and fd begin ###
Import-Module ZLocation # this must come after other imports that modify prompt
Write-Host -Foreground Green "`n[ZLocation] knows about $((Get-ZLocation).Keys.Count) locations.`n" # shows stat. must come after import zlocation

# Then, install fzf with 'sudo choco install fzf'
function cz{ z | python -c "z=list(__import__('sys').stdin); z=[s.strip().split() for s in z]; z=[l[1] for l in z[3:-2]]; print('\n'.join(z))" | fzf | cl }
# Then, 'sudo choco install fd'
function cx{ fd --type d | fzf | cl }
### zlocation, fzf and fd end ###