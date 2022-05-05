$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

Set-PSReadLineOption -EditMode Emacs

Function alex {set-location -Path $home\Documents\Github\Alex}

Function x {python main.py}

function mc {mkdir @args; set-location @args}

function dotfiles() {
    set-location -path "$home\Documents\Github\dotfiles"
}

function l() {
    get-childitem @args
}

function c() {
    set-location @args; get-childitem
}

function profile() {
    code $profile
}



# ALEX specific

$alexPath = "$home\Documents\Github\Alex"

function resource() { cd $alexPath\resources\ }

function dataGen() { cd $alexPath\dataGen\ }

function result() { set-location $alexPath\results\ }

function exe() { set-location $alexPath/out/build/x64-Debug/ }

function report() { set-location $alexPath/report }