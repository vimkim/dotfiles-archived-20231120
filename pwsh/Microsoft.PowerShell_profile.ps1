# git branch -m main test


function gnvim() {
    & "$home/downloads/neovide-windows/neovide.exe" --maximized @args
}

set-alias neovide gnvim
set-alias gnv gnvim
set-alias v nvim

function vm() {
    v (gci main.*)
}

function nvinit() {
    code "$home/AppData/Local/nvim/init.vim"
}

function j() {
    idea64.exe @args
}

function id() {
    idea64.exe @args
}

function find-pid-using-port() {
    netstat -ano | findstr @args
}

# emacs keybinding such as ctrl-w
$ErrorActionPreference = "Stop" # this will stop the script on error

# This makes ctrl+w not work
#set-psreadlineoption -editmode vi

# Alt (Esc) + f, b moves the cursor forward and backward by a word.
Set-PSReadLineOption -editmode Emacs

# enables bash-like autocompletion. Default: ctrl + space
# This must be below Set-PSReadLineOption -editmode. Otherwise not work...
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# In order to accept a weird auto suggestion called 'predictive intellisense', press either right arrow or ctrl+f.

# How to use backward search (ctrl + r):
# ctrl r: ReverseSearchHistory
# ctrl s: ForwardSearchHistory


# Install fzf and Psfzf
set-psfzfoption -PSReadlineChordProvider 'ctrl+t' -PSReadlineChordReverseHistory 'ctrl+r'


function nvprofile() {
    code $home/AppData/Local/nvim/init.vim
}

function nvconfig() {
    Set-Location $env:LOCALAPPDATA/nvim/
}

function temp() {
    Set-Location $home/temp
}

set-alias tmp temp

function venv_activate() { .\.venv\Scripts\activate }

set-alias g git
function gd() { git diff @args }
function gb() { git branch @args }
function gg() { git log --graph --all --decorate --oneline @args }

function gs() { git status }
function gst() { git status }

function ga() { git add @args }

remove-alias gc -force
function gc() { git commit @args }
remove-alias gcm -force
function gcm() { git commit -m @args }
function gicm() { git commit -m @args }

function gp() { git pull @args }
function gpl() { git pull @args }

remove-alias gps -force
function gps() { git push @args }
function gpu() { git push @args }

function gf() { git fetch @args }

remove-alias gm -force
function gm() { git merge @args }
function gmn() { git merge --no-ff @args }

function gr() { git rebase @args }
function grm() { git rebase main }

function gco() { git checkout @args }
function gico() { git checkout @args }

function gall() { git add . ; git commit -m ".", git push }


function gsw() { git switch @args }
function gw() { git worktree @args }

function git-eradicate-dangerous() {
    # https://stackoverflow.com/questions/25907313/push-to-origin-after-reflog-expire-and-gc-prune
    git fsck --unreachable --dangling --no-reflogs
    git reflog expire --expire=now --all # This deletes all from reflog but they still appear  in fsck
    git gc --prune=now # Now fsck cannot even find them.

    # note that this does not work for remote repos.
    # https://stackoverflow.com/questions/47770729/git-is-it-possible-to-modify-delete-the-reflog-of-a-remote-git-repository-e-g

}

function which() { get-command -all @args | Select-Object Name, Definition, CommandType | format-list }

function whichpath() {
    get-command -all @args | select -ExpandProperty Source
}

function whicha() { get-command -all @args }

#function () { python main.py }
function x() {
    if (test-path main.py) {
        # python -m mypy --strict .
        python main.py @args
    }
    elseif (test-path package.json) {
        npm start
    }
    elseif (test-path index.ts) {
        tsc && node --use-strict ./dist/index.js @args
    }
    elseif (test-path main.js) {
        node --use-strict main.js @args
    }
    elseif (test-path ./src/main.rs) {
        cargo run
    }
    elseif (test-path main.c) {
        zig cc main.c
        if ($?) {
            ./a.exe
        }
    }
    elseif (test-path Main.java) {
        javac Main.java
        if ($?) {
            java Main
        }
    }
}

function t() {
    if (test-path package.json) {
        npm test
    }
}

function algo() {
    Set-Location "$githubPath\algorithms\"
}

function r() { python @args }

function mc() {
    try {
        mkdir @args
    }
    catch [System.IO.IOException] {
        echo "my exception: directory $args already exists"
        echo "CD-ing thou..."
    }
    set-location @args
}

function co() { code @args }

function profile() {
    code $profile
}

function profiledir() {
    Set-Location "$home\Documents\powershell"
}

# requires Administrator privilege. use 'sudo . pwsh'
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

### CG hw 2 end ###

### cl begin ###

function _ls { Get-ChildItem @args -Force | format-wide -property name -column 5 }
Remove-Alias ls -force
Set-Alias l _ls
Set-Alias ls _ls
Set-Alias ll _ls
# Set-Alias -Name ls -Value _ls -Option AllScope


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

set-alias touch ni # new-item

function c { cl @args; }
### cl end ###


### baekjoon begin ###
function cpm {
    Get-Content main.py | set-clipboard
}

function cppwd {
    (pwd).path | set-clipboard
}

function cppy {
    Get-Content main.py | set-clipboard
}

function cpcpp {
    Get-Content main.cpp | set-clipboard
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
    Set-Location $dir;
    code -r .
    code --goto main.py:23:4
    #code --goto main.cpp:70:4
}

function compete($dir) {
    mkdir $dir;
    Set-Location $dir;
    prepare A;
    prepare B;
    prepare C;
    prepare D;
    prepare E;
    prepare F;
}

### baekjoon end ###


### zlocation, fzf and fd begin ###

## Import-Module ZLocation # this must come after other imports that modify prompt
## Write-Host -Foreground Green "`n[ZLocation] knows about $((Get-ZLocation).Keys.Count) locations.`n" # shows stat. must come after import zlocation
## # you can RESET database by deleting $home/z-location.db file.
## # Then, install fzf with 'sudo choco install fzf'
#function cz { z | python -c "z=list(__import__('sys').stdin); z=[s.strip().split() for s in z]; z=[l[1] for l in z[3:-2]]; print('\n'.join(z))" | fzf | cl }
## # Then, 'sudo choco install fd'

set-alias cz zi
# Do not forget the .fdignore setting
function cx { fd --type d | fzf | cl }
function vcx { set-location ; fd --type d | fzf | cl }


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

Set-Alias lvim C:\Users\kimdh\.local\bin\lvim.ps1



# For zoxide v0.8.0+
Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
    })

function dl_files() {
    ii "G://My Drive/0_ku/4-2/DL/final_prep"
}

function dl_site() {
    start chrome https://kulms.korea.ac.kr/ultra/courses/_372945_1/cl/outline
}


function dl_videos() {
    start chrome https://www.youtube.com/playlist?list=PLCNc54m6eBRVcL8NQTikTM-z6hvspx3cJ
}

function whichf() {
    # get-command @args | select *
    get-command @args | select -ExpandProperty Definition
}


oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/hunk.omp.json" | Invoke-Expression # This must be in front of any prompt modification such as pipenv.

. ~/documents/github/dotfiles/pwsh/alias.ps1
function source-ali {
    . ~/documents/github/dotfiles/pwsh/alias.ps1
}

# permanently modify user/system environment variables
# https://stackoverflow.com/questions/714877/setting-windows-powershell-environment-variables
# [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\bin", "Machine")
