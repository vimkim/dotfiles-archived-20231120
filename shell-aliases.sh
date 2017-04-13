# Detect OS
platform='unknown'
unamestr=$(uname)
iswsl='false' # in order to use user-defined envvar, export required
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
    if grep -q Microsoft /proc/version; then
        echo "Ubuntu on Windows"
        iswsl='true'
        export iswsl # vim papercolor theme need this info
    else
        echo "Pure Linux"
    fi
    echo "iswsl = $iswsl"
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi
echo "platform = $platform"

# Detect nvim
nvimexist='false'
myvi='vim'
if hash nvim 2>/dev/null; then
    nvimexist='true'
    myvi='nvim'
fi
echo "nvimexist = $nvimexist"
echo "myvi = $myvi"


# default editor (required for tmuxinator somehow)
if [[ $platform == 'linux' ]]; then
    export EDITOR=/usr/bin/$myvi
    export VISUAL=/usr/bin/$myvi
elif [[ $platform == 'macos' ]]; then
    export EDITOR=/usr/local/bin/$myvi
    export VISUAL=/usr/local/bin/$myvi
else 
    echo "default editor / visual not set"
fi

##### ALIASES #####
# 1. ls
# 2. $myvi
# 3. cl, c, v functions
# 4. zshrc, vimrc functions
# 5. accessibility (e.g. rm -i)
# 6. Git
# 7. TMUX, Tmuxinator
# 8. Ranger
# 9. Languages: R,Python,C,Latex,etc.
# 10. PERSONAL

# ls aliases
#alias ls='ls --color=auto'
if [[ $platform == "macos" ]]; then
    alias ls='ls -GF'
elif [[ $platform == "linux" ]]; then
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        # ls -G # This excludes group name. unnecessary
        alias ls='ls --color=auto -F'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'
        alias grep='grep --color=auto' # to work, modity alias grep below
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
fi
alias la='ls -a' # -A inferior
alias ll='ls -la'
alias lal='la -l'
alias lla='la -l'
alias l='ls -a'

# vim config. If nvim exists, use it
#viavailable(){
    #if hash nvim 2>/dev/null; then

        #nvim "$@"
    #else
        #vim "$@"
    #fi
#}
cl(){
    builtin cd "$@" && ls -a
}

vim_with_date(){
    $myvi "$(date +%y%m%d)_$1"
}
alias vda='vim_with_date'
mkdir_with_date(){
    mkdir "$(date +%y%m%d)_$1"
}
alias mda='mkdir_with_date'

# rc function
alias zshrc='$myvi ~/runtime_config/.zshrc'
alias bashrc='$myvi ~/runtime_config/.bashrc'
alias sozsh='source ~/.zshrc'
alias sobash='source ~/.bashrc'

# vimrc function
alias vimrc='nvim ~/runtime_config/.vimrc'
alias nvimrc='nvim ~/runtime_config/init.vim'
alias vvimrc='vim ~/runtime_config/.vimrc'
alias vnvimrc='vim ~/runtime_config/init.vim'

# accessibility aliases
alias rm='rm -i'
alias mv='mv -iv'
alias ei='exit'
alias cm='chmod -v'
alias md='mkdir'
alias mkd='mkdir'
alias grep='grep --color'
alias fzg='grep -nir'
alias fzgrep='grep -nir'
#alias ask='grep -nir'
alias ask='grep -nir -A 2'
function askman { 
    ask "$@" ~/mymanual/
}
function askhere { 
    ask "$@" . 
}
alias dog='pygmentize -g' # cat with syntax
alias whichsh='echo $0' #check shell

#git 
alias gst='git status'
alias gad='git add'
alias gap='git add --patch'
alias gc='git commit --verbose'
alias gps='git push'
alias gpsom='git push -u origin master'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gbr='git branch'
alias gco='git checkout'
alias gsa='git stash'
alias glo='git log'
alias gdi='git diff'
alias gsh='git show'
alias gbl='git blame'
alias gds='git dissect'
alias gumd='git diff --diff-filter=U' # unmerged commits
alias gerase='git credential-osxkeychain erase < ~/runtime_config/gitcredential.txt'
alias gitcre='git credential-osxkeychain erase < ~/runtime_config/gitcredential.txt'
alias gcre='git credential-osxkeychain erase < ~/runtime_config/gitcredential.txt'

# tmux
alias tmu='tmux'
alias tmua='tmux a'
alias tmuat='tmux a -t'
alias tmul='tmux ls'
alias tmus='tmux new-session -s'
alias tmuk='tmux kill-session'
alias tmuks='tmux kill-session -t'
alias tmuc='tmux switch-client -t'
#alias tmxkissall="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill" # does not work

# tmuxinator
alias muxl='mux ls'
alias muxn='mux new'
alias muxo='mux open'
alias muxs='mux start'
alias muxst='mux start stream'
alias muxstop='mux start stopwatch'

# ranger 
# when quit ranger, change shell directory to last visited ranger directory
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
alias r_ranger='SHELL=~/.config/ranger/r.shell ranger' # source shell aliases
alias ra=r_ranger

##### LANGUAGES #####

#Rscript shortcut
alias rso='Rscript' # r source

#Python shortcut
alias python='python3'
alias py='python'

# sage alias
# if [
if [[ $platform == 'macos' ]]; then
    alias sage='~/Applications/SageMath/sage'
fi

# Compiler
if [[ $platform == 'macos' ]]; then
    alias gcc='/usr/local/Cellar/gcc/6.3.0_1/bin/gcc-6'
fi
#alias g++='/usr/local/Cellar/gcc/6.2.0/bin/g++-6'

# LaTeX
#alias pdflatex='/usr/local/texlive/2016/bin/x86_64-darwin/pdflatex'
#alias latexmk='/library/tex/texbin/latexmk/'



##### PERSONAL #####

# ssh shortcut
alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgill.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

# personal cd aliases
alias runtime_config='cd ~/runtime_config; ls -a'
alias myman='cd ~/mymanual; ls -a'
alias mym='cd ~/mymanual; ls -a'
alias anki='cd ~/anki/; ls -a'
alias notetaking='cd ~/notetaking/; ls -a'
alias project='cd ~/notetaking/1_fine482/project/; ls -a'
alias mysnips='cd ~/runtime_config/mysnips/UltiSnips; ls -a'

# personal edit aliases
alias tmuxconf='$myvi ~/runtime_config/.tmux.conf'
alias keep='$myvi ~/Google\ Drive/keep_offline.md'
alias todo='$myvi ~/Google\ Drive/keep_offline.md'
alias todostack='$myvi ~/.todostack.md'
alias toask='$myvi ~/Google\ Drive/ask_offline.md'

# personal cat aliases

# personal app aliases
alias stopwatch='cd ~/Stopwatch2Txt/; python3 ~/Stopwatch2Txt/stopwatch.py'
alias wtr='curl wttr.in/montreal'
alias weather='curl wttr.in/montreal'
alias jse='bundle exec jekyll serve -w' # jekyll server
alias o='open' # mac 
alias oas='open -a Safari' # mac
if [[ $platform == 'macos' ]]; then
    alias emacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw'
fi
alias e='emacs'

# personal url aliases
alias gmail='open http://www.gmail.com'
alias univmail='open https://outlook.office365.com/owa/'
alias fb='open https://www.facebook.com'
alias mycourses='open https://mycourses2.mcgill.ca/'
myupdate(){
    gmail;
    univmail;
    fb;
}

alias oac='open -a /Applications/Google\ Chrome.app'

if [[ $platform == 'macos' ]]; then
    alias fido='open -a /Applications/Google\ Chrome.app https://www.fido.ca'
    alias cibc='open -a /Applications/Google\ Chrome.app https://www.cibc.ca'
    alias bell='open -a /Applications/Google\ Chrome.app https://www.bell.ca'
fi

bills(){
    fido;
    cibc;
    bell;
    echo "mcgill library!"
}

# shell level (find if nested)
alias shlv='echo $SHLVL'
studylog(){
    $myvi ~/Google\ Drive/diary/studylog/studylog_$(date +%y-%m-%d).md
}

# FZF change completion key
#export FZF_COMPLETION_TRIGGER='/' 
#bindkey '^p' fzf-completion
#bindkey '^I' $fzf_default_completion # not working well

alias gall='$myvi ~/Google\ Drive/diary/gall.md'

alias whome='cd /mnt/l/'

# make
alias cpmake='cp ~/runtime_config/Makefile_C_general ./Makefile'
alias cppmake='cp ~/runtime_config/Makefile_CPP_general ./Makefile'

alias mcl='make clean'

# ctags
alias tagen="ctags -R ."

# cgdb
alias gdb="cgdb"

# debug like a sir 
alias cpdebug='cp ~/mymanual/clang/debug/debug.h .'

# open as finder
alias oaf='open -a finder'

# alias shs="ssh -p '1004' 's2016112648@linux.mme.dongguk.edu'" # not work
alias shs='expect ~/exp.sh'
