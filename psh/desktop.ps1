# emacs keybinding such as ctrl-w
$ErrorActionPreference = "Stop" # this will stop the script on error


# enables bash-like autocompletion. Default: ctrl + space
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

set-psreadlineoption -editmode vi

function gst() { git status }
function gad() { git add @args }

function gcm() { git commit @args }

#function x() { python main.py }
function x() {
    if (Test-Path main.py) {
        python main.py @args
    } elseif (Test-Path main.js) {
        node main.js @args
    }
}

function algo() {
    cd "$githubPath\algorithms\"
}

function r() { python @args }

function mc() { mkdir @args ; cd @args }

function co() { code @args }

function profile() {
    code $profile
}

function profiledir(){
    cd "$home\Documents\WindowsPowerShell\"
}

# No use. It requires admin previlege anyway...
function ln ($target, $link) {
    new-item -path $link -itemtype SymbolicLink -value $target
}

function dotfiles() {
    set-location "$home\Documents\Github\dotfiles"
}

function diffBinary() {
    fc.exe @args;
}

### CG hw 3 begin ###

$githubPath = "$home/Documents/github"

function cg() {
    set-location "$githubPath/cg-hw3"
}

function hw() {
    set-location "$githubPath/cg-hw3"
}

function ppt() {
    ii C:\Users\kimdh\Documents\ku4-1\cg\hw3.pptx
}

### CG hw 2 end ###


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
    # copy-item -Path "$env:userprofile\Documents\Github\algorithms\template\*" -Destination $dir -recurse
    copy-item -Path "$env:userprofile\Documents\Github\algorithms\template\main.py" -Destination $dir -recurse
}

function play($dir) {
    #new-item $dir/main.py;
    #new-item $dir/i2;
    prepare $dir
    cd $dir;
    code -r .
    code --goto main.py:23:4
    #code --goto main.cpp:70:4
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
# you can RESET database by deleting $home/z-location.db file.
# Then, install fzf with 'sudo choco install fzf'
function cz{ z | python -c "z=list(__import__('sys').stdin); z=[s.strip().split() for s in z]; z=[l[1] for l in z[3:-2]]; print('\n'.join(z))" | fzf | cl }
# Then, 'sudo choco install fd'
function cx{ fd --type d | fzf | cl }

### zlocation, fzf and fd end ###
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
