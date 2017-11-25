##### Shell Aliases #####
# Common aliases which works for both zsh and bash (and probably others too).
# Be careful. When assigning variable, no space between variable name and '=' sign. Spaces matter in scripting.

# Detect Shell
echo "****************************************************"
echo "\$0: $0"
echo "\$SHELL: $SHELL"
echo "\$SHLVL: $SHLVL"
echo "****************************************************"

# Detect OS
platform='unknown'
distro='unknown'
unamestr=$(uname)
iswsl='false' # in order to use user-defined envvar, export required
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'

    if grep -q Microsoft /proc/version; then
        echo "Windows Subsystem Linux"
        iswsl='true'
        export iswsl # vim papercolor theme need this info
    else
        echo "Pure Linux"
    fi
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi
echo "\$platform: $platform"

# find Linux distro
    distro='pi'
if [[ $(uname -n) == 'raspberrypi' ]]; then
    echo "\$distro: $distro"
fi
echo "****************************************************"


# emacs aliases
if [[ $platform == 'macos' ]]; then
    #alias emacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw' #nw stands for no graphical window; use terminal
    alias emacs='/usr/local/bin/emacs -nw'
    #alias gemacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs' #gui emacs
    alias gemacs='/usr/local/bin/emacs'
    echo "use mac-emacs"
fi
#alias e='emacsclient -t'
alias ge='emacsclient -c -a emacs'
alias ema='emacs'
alias gema='gemacs'
alias ec='emacsclient -t'
alias gec='emacsclient'
alias eda='emacs --daemon'
alias geda='gemacs --daemon'
alias iseda='ps x | grep "emacs"'
alias killeda='emacsclient -e "(kill-emacs)"' # kill emacs server and daemon
alias freda='killeda && eda' # refresh eda
#alias e='emacsclient -t'
alias ge='emacsclient'

myvi='vi'
# Detect vim
vimexist='false'
if hash vim 2>/dev/null; then
    vimexist='true'
    myvi='vim'
fi
echo "\$vimexist: $vimexist"

# Detect nvim
nvimexist='false'
if hash nvim 2>/dev/null; then
    nvimexist='true'
    myvi='nvim'
fi
echo "\$nvimexist: $nvimexist"

# Detect mvim
if mvimexist='false'
if hash mvim 2> /dev/null; then
    mvimexist='true'
    myvi='mvim --remote'
fi

emacsexist='false'
myemacs='unknown'
# Detect emacs
if hash emacs 2>/dev/null; then
    emacsexist='true'
    #myemacs='emacs'
    myemacs='emacsclient'
fi
echo "\$emacsexist: $emacsexist"

# Select myed
myed='unknown'
if [[ $emacsexist == 'true' ]]; then
    myed=$myemacs
else
    myed=$myvi
fi
echo "\$myed: $myed"

# default editor (required for tmuxinator somehow)
if [[ $platform == 'linux' ]]; then
    export EDITOR=/usr/bin/$myed
    export VISUAL=/usr/bin/$myed
elif [[ $platform == 'macos' ]]; then
    export EDITOR=/usr/local/bin/$myed
    export VISUAL=/usr/local/bin/$myed
else
    echo "default editor / visual not set"
fi
echo "\$EDITOR: $EDITOR"
echo "\$VISUAL: $VISUAL"
echo "****************************************************"
echo "Installed?"
type git
type python
type python2
type python3
type tmux
type java


##### ALIASES #####
# 1. ls
# 2. $myed
# 3. cl, c, v functions
# 4. zshrc, vimrc functions
# 5. accessibility (e.g. rm -i)
# 6. Git
# 7. TMUX, Tmuxinator
# 8. Ranger
# 9. Languages: R,Python,C,Latex,etc.
# 10. PERSONAL

# ls aliases
# alias ls='ls --color=auto'
if [[ $platform == "macos" ]]; then
    # alias ls='ls -GF'
    alias ls='ls --color=auto -F'
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
alias la='ls -A' # -A is cleaner than -a imo. (-A does not include . and ..)
alias ll='ls -la' # however, when observing permissions, -a is more useful.
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

edit_with_date(){
    $myed "$(date +%y%m%d)_$1"
}

vim_with_date(){
    $myvi "$(date +%y%m%d)_$1"
}

alias ewd='edit_with_date'
alias vwd='vim_with_date'

mkdir_with_date(){
    mkdir "$(date +%y%m%d)_$1"
}
alias mwd='mkdir_with_date'

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
alias initel='emacs ~/runtime_config/init.el'
alias ginitel='gemacs ~/runtime_config/init.el'
alias enitel='emacsclient ~/runtime_config/init.el'
alias initel='emacs ~/runtime_config/init.el'
alias vinitel='vim ~/runtime_config/init.el'

# accessibility aliases
alias rm='rm -iv'
alias mv='mv -iv'
alias ex='exit'
alias cm='chmod -v'
alias cp='cp -iv'
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
alias muxe='mux start emacs'

# ranger 
# when quit ranger, change shell directory to last visited ranger directory
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
alias r_ranger='SHELL=~/.config/ranger/r.shell ranger' # source shell aliases
alias ra=r_ranger

##### LANGUAGES #####

#Rscript shortcut
alias rso='Rscript' # r source

#Python shortcut
#alias python='python3'
alias py='python3'

# sage alias
# if [
if [[ $platform == 'macos' ]]; then
    alias sage='~/Applications/SageMath/sage'
fi

# Compiler
if [[ $platform == 'macos' ]]; then
    #alias gcc='/usr/local/Cellar/gcc/6.3.0_1/bin/gcc-6'
    #alias g++='/usr/local/Cellar/gcc/6.3.0_1/bin/g++-6'
    alias gcc='/usr/local/Cellar/gcc/7.1.0/bin/gcc-7'
    alias g++='/usr/local/Cellar/gcc/7.1.0/bin/g++-7'
fi

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
#alias mysnips='cd ~/runtime_config/mysnips/UltiSnips; ls -a'
alias snip='cd ~/runtime_config/snippets; ls -a'

# personal edit aliases
alias tmuxconf='$myed ~/runtime_config/.tmux.conf'
alias keep='$myed ~/Google\ Drive/keep_offline.md'
alias todo='$myed ~/Google\ Drive/keep_offline.md'
alias todostack='$myed ~/.todostack.md'
alias toask='$myed ~/Google\ Drive/ask_offline.md'

# personal cat aliases

# personal app aliases
alias stopwatch='cd ~/Stopwatch2Txt/; python3 ~/Stopwatch2Txt/stopwatch.py'
alias wtr='curl wttr.in/montreal'
alias weather='curl wttr.in/montreal'
alias jse='bundle exec jekyll serve -w' # jekyll server
alias o='open' # mac 
alias oas='open -a Safari' # mac
alias oac='open -a /Applications/Google\ Chrome.app'

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
    $myed ~/Google\ Drive/diary/studylog/studylog_$(date +%y-%m-%d).md
}

# FZF change completion key
#export FZF_COMPLETION_TRIGGER='/' 
#bindkey '^p' fzf-completion
#bindkey '^I' $fzf_default_completion # not working well

alias gall='$myed ~/Google\ Drive/diary/gall.md'

alias whome='cd /mnt/l/'

# make
# alias m=make # another m function created
alias makec='cp ~/runtime_config/Makefile_C_general ./Makefile'
alias makecpp='cp ~/runtime_config/Makefile_CPP_general ./Makefile'
alias makepl='cp ~/runtime_config/Makefile_Perl_general ./Makefile'
alias makesdl2='cp ~/runtime_config/makefiles/sdl2.Makefile ./Makefile'

# ctags
alias tagen="ctags -R ."

# cgdb
alias gdb="cgdb"

# debug like a sir
alias cpdebug='cp ~/mymanual/clang/debug/debug.h .'

# open as finder
if [[ $platform == 'linux' ]]; then
    if [[ $distro == 'pi' ]]; then
        alias oaf='pcmanfm .'
    fi
elif [[ $platform == 'macos' ]]; then
    alias oaf='open -a finder .'
else
    echo "oaf not set yet in this OS"
fi

# alias shs="ssh -p '1004' 's2016112648@linux.mme.dongguk.edu'" # not work
alias shs='expect ~/exp.sh'

alias skim-pdf-bg-color='osascript ~/runtime_config/skim-pdf-bgcolor.scpt'

alias unco='uncommitted ~/hs-quest ~/mymanual ~/mygitbooks ~/runtime_config ~/praclang'

alias music='$myed ~/Google\ Drive/song-list.md'
alias song='$myed ~/Google\ Drive/song-list.md'

alias bookyrun='~/booky/booky.sh'
alias bookyincrement='$myed ~/booky/increment.py'
alias bookyrun_increment='python ~/booky/increment.py'

alias cour='cl ~/courses'

alias school='cd ~/Google\ Drive/school'

# pandoc markdown header style == to # (from setext to atx)
alias pandoc='pandoc --atx-headers'

# emacs directory
alias emd='cl ~/.emacs.d/'

# shell alias management shortcut
alias ali='$myvi ~/runtime_config/shell-aliases.sh'
alias soali='source ~/runtime_config/shell-aliases.sh'

# custom alias
alias cua='$myvi ~/runtime_config/temp-aliaslist.sh'
alias cus='$myvi ~/runtime_config/temp-aliaslist.sh'
alias socua='source ~/runtime_config/temp-aliaslist.sh'
alias socus='source ~/runtime_config/temp-aliaslist.sh'

alias clr='clear' # clear terminal screen
alias cls='clear' # clear terminal screen; MS windows compatible

alias mouseread='defaults read .GlobalPreferences com.apple.mouse.scaling'
alias mousewritemo='defaults write .GlobalPreferences com.apple.mouse.scaling -1'
alias mousewriteo='defaults write .GlobalPreferences com.apple.mouse.scaling 1'

alias books='cl ~/Google\ Drive/books/comp'

alias voca='$myvi ~/Google\ Drive/study/voca/teps1.csv'

alias javarun='javac main.java; java main'
alias pyrun='py main.py'
alias pyrun2='python2 main.py'
alias plrun='perl main.pl'
#alias clisprun='clisp main.lisp'
#alias clisprun='clisp -lp .'
alias clisprun='clisp -i main.lisp'

run_what=""
alias check_run_what='echo $run_what'
alias run_c="run_what='c'"
alias run_cpp="run_what='cpp'"
alias run_py="run_what='python3'"
alias run_py2="run_what='python2'"
alias run_java="run_what='java'"
alias run_pl="run_what='perl'"
alias run_cl="run_what='clisp'"

m(){
    echo "this is m function."
    if [[ "$run_what" == 'c' ]]; then
        echo "this is make for c"
        make --makefile=~/runtime_config/Makefile_C_general
    elif [[ "$run_what" == 'cpp' ]]; then
        echo "this is make for cpp"
        make --makefile=~/runtime_config/Makefile_CPP_general
    elif [[ "$run_what" == 'python3' ]]; then
        echo "this is python3."
        pyrun
    elif [[ "$run_what" == 'python2' ]]; then
        echo "this is python2."
        pyrun2
    elif [[ "$run_what" == 'java' ]]; then
        echo "this is java."
        javarun
    elif [[ "$run_what" == 'perl' ]]; then
        echo "this is perl."
        plrun
    elif [[ "$run_what" == 'clisp' ]]; then
        echo "this is clisp."
        clisprun
    else
        echo "\$run_what value is not initialized. Use run_* option. Use check_run_what to check its value."
    fi
}

mcl(){
    echo "running mcl..."
    if [[ "$run_what" == 'c' ]]; then
        make --makefile=~/runtime_config/Makefile_C_general clean
    elif [[ "$run_what" == 'cpp' ]]; then
        make --makefile=~/runtime_config/Makefile_CPP_general clean
    else
        echo "run_c or run_cpp?"
    fi
}

mkc(){
    mkdir $@;
    cd $@;
}
alias mc='mkc'

#alias em='e main.^(o|h)*'
alias em='e main.*~main.o~main.h~main.class'
alias ei='e main.*~main.o~main.h~main.class'
alias vm='nvim main.*~main.o~main.h~main.class'

alias euckr2utf8='iconv -c -f euc-kr -t utf-8' # convert from to?

alias pd='popd'

alias rm="echo Use 'rmt(rmtrash)', or the full path i.e. '/bin/rm'"
if [[ $platform == 'linux' ]]; then
    alias rmt="trash"
elif [[ $platform == 'macos' ]]; then
    alias rmt="rmtrash"
else
    echo "rmt not set yet in this OS"
fi

alias more="less"

alias oh="open *.html"

alias grepstar="ps aux | grep 'StarCraft'"
alias awkstar="ps aux | grep 'StarCraft' | awk '{print \$2}'"
alias killstar="kill -9 \$(ps aux | grep 'StarCraft' | awk '{print \$2}')" # '$' must be escaped with \, but using functions are better - superuser.com

alias sudoe="sudoedit"
alias se="sudoedit"

alias jt="jupyter"
alias jn="jupyter notebook"
