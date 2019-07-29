alias gh='cl ~/how2heap/glibc_2.25'
####### Shell Aliases #####
# Common aliases which works for both zsh and bash (and probably others too).
# Be careful. When assigning variable, no space between variable name and '=' sign. Spaces matter in scripting.

# Detect Shell
echo "\$0: $0"
echo "\$SHELL: $SHELL"
echo "\$SHLVL: $SHLVL"
echo "****************************************************"

## # Detect OS # this part is modularized.
## # Check out ~/dkenv/runtime_config/zsh/detect_OS.zsh
## platform='unknown'
## distro='unknown'
## unamestr=$(uname)
## iswsl='false' # in order to use user-defined envvar, export required
## if [[ "$unamestr" == 'Linux' ]]; then
##     platform='linux'
##
##     if grep -q Microsoft /proc/version; then
##         echo "Windows Subsystem Linux"
##         iswsl='true'
##         export iswsl # vim papercolor theme need this info
##     else
##         echo "Pure Linux"
##     fi
## elif [[ "$unamestr" == 'Darwin' ]]; then ##     platform='macos'
## fi
## echo "\$platform: $platform"
##
## # find Linux distro
##     distro='pi'
## if [[ $(uname -n) == 'raspberrypi' ]]; then
##     echo "\$distro: $distro"
## fi
## echo "****************************************************"

if [[ $iswsl == 'true' ]]; then
    alias wslali='eval $myvi ~/dkenv/runtime_config/shell/wsl_alias.sh'
    source ~/dkenv/runtime_config/shell/wsl_alias.sh
fi


# emacs aliases
if [[ $platform == 'macos' ]]; then
    #alias emacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw' #nw stands for no graphical window; use terminal
    alias emacs='/usr/local/bin/emacs -nw'
    #alias gemacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs' #gui emacs
    alias gemacs='/usr/local/bin/emacs'
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
#if hash vim 2>/dev/null; then # hash not working. replace with type
if type vim 2>/dev/null; then
    vimexist='true'
    alias vim='vim -u ~/dkenv/runtime_config/vim/.vimrc -i ~/dkenv/.vim/viminfo'
    myvi='vim -u ~/dkenv/runtime_config/vim/.vimrc -i ~/dkenv/.vim/viminfo'
fi
echo "\$vimexist: $vimexist"

# Detect nvim
nvimexist='false'
if type nvim 2>/dev/null; then
    nvimexist='true'
    myvi='nvim'
fi
echo "\$nvimexist: $nvimexist"

# Detect mvim
mvimexist='false'
if type mvim 2> /dev/null; then
    mvimexist='true'
    #myvi='mvim --remote-silent'
    myvi=(mvim --remote-silent) #http://zsh.sourceforge.net/FAQ/zshfaq03.html
fi
if [[ $platform == 'macos' ]]; then
    echo "\$mvimexist: $mvimexist"
fi
alias mvr="mvim --remote-silent"

# Detect nvr
nvrexist='false'
if type nvr 2> /dev/null; then
    nvrexist='true'
    myvi=(nvr -s)
fi
echo "\$nvrexist: $nvrexist"
export myvi
vim=($myvi)

emacsexist='false'
myemacs='unknown'
# Detect emacs
if type emacs 2>/dev/null; then
    emacsexist='true'
    #myemacs='emacs'
    myemacs='emacsclient'
fi
echo "\$emacsexist: $emacsexist"

# Select myed
#myed='unknown'
#if [[ $emacsexist == 'true' ]]; then
#    myed=$myemacs
#else
#    myed=$myvi
#fi
echo "\$myvi: $myvi"
echo "\$myed: $myed"
# for now myed is myvi

#myed=$myvi # this spits an error
myed=($myvi) # emacs returned

# default editor (required for tmuxinator somehow)
if [[ $platform == 'linux' ]]; then
    export EDITOR=/usr/bin/$myed
    export VISUAL=/usr/bin/$myed
    export GIT_EDITOR='$(which vim)'
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
type vim
type nvim
type mvim
type nvr
type emacs
type git

# brew gcc/g++
    # warning: brew install/upgrade gcc does not link /usr/local/bin/gcc to gcc.
    # It only links gcc-N command, where N is the version number.
    # therefore, use gcc-N instead of gcc
if [[ $platform == 'macos' ]]; then
    # do not forget to change these aliases after upgrading brew gcc.
    alias gcc='gcc-8'
    alias g++='g++-8'
    alias cc='gcc-8'
    alias c+='g++-8'

    # majave gcc does not work. Use /usr/bin/gcc until it gets fixed.
    #alias gcc='/usr/bin/gcc'
    #alias g++='/usr/bin/g++'
    # it started to work again on 2019/03/22
fi
type gcc
type g++

gcc_debug_opt="-g3 -O0" # https://stackoverflow.com/questions/10475040/gcc-g-vs-g3-gdb-flag-what-is-the-difference
gcc_warn_opt='-Wall -Wextra -pedantic'
gcc_assembly_opt='-S -masm=intel'
gcc_buffer_overflow_opt='-fno-stack-protector'
gcc_opt_address_space_randomization='-Wl,-no_pie'
alias gccm="gcc \\
$gcc_debug_opt \\
$gcc_warn_opt \\
$gcc_buffer_overflow_opt \\
$gcc_opt_address_space_randomization" # gcc improved
alias gcc_debug='gccm'
alias gcc_assembly="gccm $gcc_assembly_opt"
# gcc -g3 option includes macro information

alias g++m="g++ $gcc_debug_opt $gcc_warn_opt"
alias gppm="g++m"

# gcc set
alias gcc_after_preprocessor_before_compiler='gccm -E'
alias gcc_after_compiler_before_assembler='gcc_assembly'
alias gcc_after_assembler_before_linker='gccm -c' # does not link == object file


# brew python2//javapython3
if [[ $platform == 'macos' ]]; then
    # warning: python is /usr/bin/python, which is system builtin.
    # brew does not update/link automatically.
    # I should use python2 or python3 to use brew python.
    #alias python='echo "!!!!! ##### warning: py2 or py3 to use brew python ##### !!!!!"; python'
    #alias python='/usr/local/bin/python3' # ruins virtualenv
    # instead, use ln -s /usr/local/bin/python3 /usr/local/bin/python

    alias py2='python2'
    alias py='/usr/local/bin/python3'
    alias py3='/usr/local/bin/python3'

    alias pyp='/usr/local/bin/pypy3'
    alias pyp2='/usr/local/bin/pypy'
    alias pyp3='/usr/local/bin/pypy3'
    #alias pip='/usr/local/bin/pip3' # ruins virtualenv
elif [[ $platform = 'linux' ]]; then
    alias py='/usr/bin/python3'
fi
type python
type python2
type python3

type tmux
type java

### for Fasd
eval "$(fasd --init auto)"

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
if [[ $platform == "macos" ]]; then
    if [[ -a /usr/local/bin/gls ]]; then # using gnu ls
        alias ls='/usr/local/bin/gls --color=auto -F'
    elif [[ -a /usr/local/bin/ls ]]; then # using brew ls (which is gnu ls)
        alias ls='/usr/local/bin/ls --color=auto -F'
    elif [[ -a /bin/ls ]]; then # use mac default ls
        alias ls='ls -GF'
    else
        echo "wrong ls"
    fi
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

alias ls='ls --color -AF'
alias la='ls -A' # -A is cleaner than -a imo. (-A does not include . and ..)
alias ll='ls -lA' # however, when observing permissions, -a is more useful.
alias lld='ls -lAd' # for directory. If without -d, it shows the contents of the directory instead of the directory itself.
alias l='ls -A'

# find symbolic links
llsy(){
    ls -la $@ | grep " \->"
}


# vim config. If nvim exists, use it
#viavailable(){
    #if type nvim 2>/dev/null; then

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
mkdir_with_date(){
    mkdir "$(date +%y%m%d)_$1"
}
alias ewd='edit_with_date'
alias vwd='vim_with_date'
alias mwd='mkdir_with_date'

# rc function
alias zshrc="eval $myvi ~/.zshrc"
alias zlogout="eval $myvi ~/dkenv/runtime_config/zsh/.zlogout"
alias bashrc="eval $myvi ~/.bashrc"
alias vzshrc="vim ~/.zshrc"
alias vbashrc="vim ~/.bashrc"
alias nvzshrc="nvim ~/.zshrc"
alias nvbashrc="nvim ~/.bashrc"
alias mvzshrc="mvim ~/.zshrc"
alias mvbashrc="mvim ~/.bashrc"
# shell alias management shortcut
alias ali='$=myvi ~/dkenv/runtime_config/shell/shell_alias.sh' # this works for zsh, but not in bash. Tips from: https://stackoverflow.com/questions/8299610/zsh-command-not-found-for-editor
alias ali='eval $myvi ~/dkenv/runtime_config/shell/shell_alias.sh' # This works for zsh and bash.
alias ali="eval $myvi ~/dkenv/runtime_config/shell/shell_alias.sh" # double quote works. Single quote doesn't. This works for both zsh and bash.

alias vali='vim ~/dkenv/runtime_config/shell/shell_aliases.sh'
alias nali='nvim ~/dkenv/runtime_config/shell/shell_aliases.sh'
alias mali='mvim ~/dkenv/runtime_config/shell/shell_aliases.sh'

alias cua='eval $myvi ~/dkenv/runtime_config/shell/temp_alias.sh'
alias cuali='cua'
alias custum_alias='cua'
alias socua='source ~/dkenv/runtime_config/shell/temp_alias.sh'
alias socus='source ~/dkenv/runtime_config/shell/temp_alias.sh'

alias sozsh='source ~/.zshrc'
alias sobash='source ~/.bashrc'
alias soali='source ~/dkenv/runtime_config/shell/shell_alias.sh'
source ~/dkenv/runtime_config/shell/temp_alias.sh

# vimrc function
alias vimrc="eval $myvi ~/dkenv/runtime_config/vim/.vimrc"
alias vvimrc='vim ~/dkenv/runtime_config/vim/.vimrc'
alias nvvimrc="nvim ~/dkenv/runtime_config/vim/.vimrc"
alias mvimrc='mvim ~/dkenv/runtime_config/vim/.vimrc'
alias nvimrc="eval $myvi ~/dkenv/runtime_config/nvim/init.vim"
alias vnvimrc='vim ~/dkenv/runtime_config/nvim/init.vim'
alias mvnvimrc='mvim ~/dkenv/runtime_config/nvim/init.vim'
alias nvnvimrc="nvim ~/dkenv/runtime_config/nvim/init.vim"
alias initel='emacs ~/dkenv/runtime_config/emacs/init.el'
alias ginitel='gemacs ~/dkenv/runtime_config/emacs/init.el'
alias enitel='emacsclient ~/dkenv/runtime_config/emacs/init.el'
alias initel='emacs ~/dkenv/runtime_config/emacs/init.el'
alias vinitel="eval $myvi ~/dkenv/runtime_config/emacs/init.el"
alias initeldebug='initel --debug-init'

# accessibility aliases
alias rm='rm -iv'
alias mv='mv -iv'
alias ex='exit'
alias cm='chmod -v'
alias cp='cp -iv'
alias md='mkdir'
alias mkd='mkdir'
alias grep='grep --color'
# grep -n : line number / -r : recursive / -i ignore case
alias fzg='grep -nir'
alias fzgrep='grep -nir'
#alias ask='grep -nir'
# -A NUM : print NUM lines after the searched pattern
alias ask='grep -nir -A 1 --exclude-dir=.git'
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

gam(){

    if [[ "$#" -eq 0 ]]; then
        git add .
    elif [[ "$#" -ge 1 ]]; then
        git add "$@"
    else
        echo "something wrong with 'gam'"
        return 1;
    fi
    git diff --cached

    local msg=''
    printf "type your commit msg: "
    read msg
    if [[ $msg == '' ]]; then
        echo "msg must not be empty."
        return 2
    fi

    git commit -m $msg
    git push
}

alias git_show_merge_conflict='git diff --name-only --diff-filter=U'
alias gumd='git diff --diff-filter=U' # unmerged commits
alias gerase='git credential-osxkeychain erase < ~/dkenv/runtime_config/gitcredential.txt'
alias gitcre='git credential-osxkeychain erase < ~/dkenv/runtime_config/gitcredential.txt'
alias gcre='git credential-osxkeychain erase < ~/dkenv/runtime_config/gitcredential.txt'
# https://stackoverflow.com/questions/6919121/why-are-there-2-ways-to-unstage-a-file-in-git
alias git_stage_removal='git rm --cached' # leaving you with an untracked file
alias git_undo_last_commit='git reset --soft HEAD~'
alias git_unstage_from_index='git reset --mixed HEAD~' # move current branch to the previous commit (--soft), and then update the index with the contents of the previous branch. This has the effect of clearing the index.
# https://git-scm.com/book/en/v2/Git-Tools-Reset-Demystified
alias git_revert_back_to_commit_dangerous='git reset --hard HEAD~'
alias git_revert_commit='git revert' # creates new commit that undoes the changes from a previous commit
alias git_changes_in_last_commit='git difftool HEAD~1 HEAD'

alias git_move_branch_without_checkout='git branch -f'
alias git_modify_last_commit_message='git commit --amend'
alias git_modify_last_commit_trivial_without_message='git commit --amend --no-edit'
alias git_diff_wd_vs_index='git diff'
alias git_diff_index_vs_last_commit='git diff --cached'
alias git_diff_staged='git diff --staged' # synonym for git --cached
alias git_diff_all_vs_last_commit='git diff HEAD'

alias git_remove_untracked_files_dryrun='git clean -n'
alias git_remove_untracked_files_interactive='git clean -i'

alias git_branch_track_remote='git branch --set-upstream'
alias git_branch_cancel_track_remote='git branch --unset-upstream'

alias git_merge_dryrun='git merge --no-commit --no-ff' # then use 'git diff --cached' and 'git merge --abort'
alias git_pull_dryrun='git fetch; git_merge_dryrun'

alias git_push_all='git push --all'

alias git_log_all='git log --oneline --graph --decorate --all'
alias gla='git_log_all'
alias git_gui_graph='gitk --all'

alias git_recover_lost_commit='git reflog' # detached head problem

# https://stackoverflow.com/questions/4783599/rebasing-a-git-merge-commit
# https://stackoverflow.com/questions/15915430/what-exactly-does-gits-rebase-preserve-merges-do-and-why
alias git_rebase_merge_commit='git rebase --preserve-merges'

# https://git-scm.com/book/en/v2/Git-Tools-Rerere
alias git_back_to_merge_conflict_state='git checkout --conflict=merge'
alias git_enable_rerere_global='git config --global rerere.enabled true'

# https://gist.github.com/tlberglund/3714970
git_loglive (){
    while :
    do
        clear
        git --no-pager log --graph --oneline --abbrev-commit --decorate --all $@
        sleep 2
    done
}


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
alias rsc='Rscript'

# sage alias
if [[ $platform == 'macos' ]]; then
    # installed by brew cask. Now no alias required.
    :
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
alias runtime_config='cd ~/dkenv/runtime_config; ls -a'
alias myman='cd ~/mymanual; ls -a'
alias mym='cd ~/mymanual; ls -a'
alias anki='cd ~/anki/; ls -a'
alias notetaking='cd ~/notetaking/; ls -a'
alias project='cd ~/notetaking/1_fine482/project/; ls -a'
#alias mysnips='cd ~/dkenv/runtime_config/mysnips/UltiSnips; ls -a'
alias snip='cd ~/dkenv/runtime_config/snippets; ls -a'

# personal edit aliases
alias tmuxconf='eval $myvi ~/dkenv/runtime_config/tmux/.tmux.conf'
alias keep='eval $myvi ~/Google\ Drive/keep_offline.md'
alias todo='eval $myvi ~/Google\ Drive/keep_offline.md'
alias todostack='eval $myvi ~/.todostack.md'
alias toask='eval $myvi ~/Google\ Drive/ask_offline.md'

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

# ctags
alias tagen="ctags -R ."

# cgdb
#alias gdb="cgdb" # causes problem with vscode


# open as finder
if [[ $platform == 'linux' ]]; then
    if [[ $iswsl == 'true' ]]; then
        alias oaf='explorer.exe'
    elif [[ $distro == 'pi' ]]; then
        alias oaf='pcmanfm'
    elif [[ $distro == 'arch' ]]; then
        alias oaf='xdg-open'
    elif [[ $distro == 'manjaro' ]]; then
        alias oaf='xdg-open'
    else
        echo "oaf not set yet in this linux OS"
    fi
elif [[ $platform == 'macos' ]]; then
    alias oaf='open -a finder'
else
    echo "oaf not set yet in this OS"
fi

alias shs="ssh -p '1004' 's2016112648@linux.mme.dongguk.edu'" # not work
alias shs2='expect ~/exp.sh'

alias skim-pdf-bg-color='osascript ~/dkenv/runtime_config/skim-pdf-bgcolor.scpt'

alias unco='uncommitted ~/hs-quest ~/mymanual ~/mygitbooks ~/dkenv/runtime_config ~/praclang'

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

alias clr='clear' # clear terminal screen
alias cls='clear' # clear terminal screen; MS windows compatible

alias mouseread='defaults read .GlobalPreferences com.apple.mouse.scaling'
alias mousewritemo='defaults write .GlobalPreferences com.apple.mouse.scaling -1'
alias mousewriteo='defaults write .GlobalPreferences com.apple.mouse.scaling 1'

alias books='cl ~/Google\ Drive/books/comp'

alias voca='eval $myvi ~/Google\ Drive/study/voca/teps1.csv'


alias javarun='javac Main.java; java Main'
alias pyrun='py main.py'
alias pyrun2='python2 main.py'
alias plrun='perl main.pl'

alias clisprun='clisp main.lisp'
#alias clisprun='clisp -lp .'
#alias clisprun='clisp -i main.lisp'

alias juliarun='julia main.jl'

run_what=""
alias check_run_what='echo $run_what'
alias run_c="run_what='c'"
alias run_cpp="run_what='cpp'"
alias run_py="run_what='python3'"
alias run_asm="run_what='asm'"
alias run_py2="run_what='python2'"
alias run_java="run_what='java'"
alias run_pl="run_what='perl'"
alias run_cl="run_what='clisp'"
alias run_jl="run_what='julia'"
alias run_js="run_what='js'"
alias run_node="run_what='node'"
alias run_r="run_what='r'"

alias cpmake="cp ~/dkenv/runtime_config/make/Makefile_C_general ./Makefile"
alias cppmake="cp ~/dkenv/runtime_config/make/Makefile_CPP_general ./Makefile"
mcl(){
    echo "running mcl..."
    if [[ "$run_what" == 'c' ]]; then
        make --makefile=~/dkenv/runtime_config/make/Makefile_C_general clean
        /bin/rm -rf *.dSYM
        /bin/rm tags
    elif [[ "$run_what" == 'cpp' ]]; then
        make --makefile=~/dkenv/runtime_config/make/Makefile_CPP_general clean
        /bin/rm -rf *.dSYM
        /bin/rm tags
    elif [[ "$run_what" == 'java' ]]; then
        /bin/rm *.class
    elif [[ "$run_what" == 'python3' ]]; then
        /bin/rm *.pyc
        /bin/rm -r __pycache__/*
        /bin/rmdir __pycache__/
    else
        echo "run_c or run_cpp?"
    fi
}

m(){
    echo "this is m function."
    if [[ "$run_what" == 'c' ]]; then
        echo "this is make for c"
        #make --makefile=~/dkenv/runtime_config/make/Makefile_C_general
        mcl
        gccm  *.c && ./a.out
    elif [[ "$run_what" == 'cpp' ]]; then
        echo "this is make for cpp"
        #make --makefile=~/dkenv/runtime_config/make/Makefile_CPP_general
        g++m *.cpp && ./a.out
    elif [[ "$run_what" == 'asm' ]]; then
        echo "this is make for asm"
        nasm -f macho64 main.asm && ld -o main main.o && ./main && rm -f main.o main 1> /dev/null # reason to do this = to prevent msgs 'removed main.o, removed main, etc.'
        # try gcc -S -masm=intel later to try intel syntax
        # this does not work for macos
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
    elif [[ "$run_what" == 'julia' ]]; then
        echo "this is julia."
        juliarun
    elif [[ "$run_what" == 'js' ]]; then
        echo "this is js."
        open index.html
    elif [[ "$run_what" == "node" ]]; then
        echo "this is node."
        node main.js
    elif [[ "$run_what" == 'r' ]]; then
        echo "this is R."
        rsc main.R
    else
        echo "\$run_what value is not initialized. Use run_* option. Use check_run_what to check its value."
    fi

    #say "complete"
}

alias clang_assembly='clang -g3 -O0 -S -mllvm --x86-asm-syntax=intel'
#alias clang_assembly='clang -O0 -S -mllvm -masm=intel' # this also seems working

mkc(){
    mkdir $@;
    cd $@;
}
alias mc='mkc'

#alias em='e main.^(o|h)*'
alias em='e main.*~main.o~main.h~main.class~main.lib~main.fas'
alias ei='e main.*~main.o~main.h~main.class'
# with case insensitive glob,
# (zsh: unsetopt CASE_GLOB)
# (bash: shopt -s nocaseglob)
# main also recognizes Main
alias vm='eval $myvi main.*~main.o~main.h~main.class~main.pyc'
# In zsh, you can make a specific command case insensitive.
#alias vm='eval $myvi (#i)main.*~main.o~main.h~main.class'

alias vt='eval $myvi test*'
alias vr='eval $myvi result*'
alias atr='./a.out > result.txt'

alias euckr2utf8='iconv -c -f euc-kr -t utf-8' # convert from to?

alias pd='popd'

alias rm="echo Use 'rmt(remove to trash)', or the full path i.e. '/bin/rm'"
_rmt(){
    mv "$@" ~/Trash
}
if [[ $platform == 'linux' ]]; then
    if [[ $iswsl == 'true' ]]; then
        alias rmt=_rmt
    else
        # sudo pacman -S trash-cli
        alias rmt="trash"
    fi
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

alias lmk="latexmk -pdf -pvc" # -pdf: use pdf instead of dvi, ps, etc. / -pv: preview the resulting output. / -pvc: preview the output continuously.

# vim tmp related
alias undodir='cl ~/.vim/undodir'
alias undoclear='rmt ~/.vim/undodir/*'
alias rmt_undodir='undoclear'

alias swapdir='cl ~/.vim/swapdir'
alias swapdir_nvim='cl ~/.local/share/nvim/swap'
alias swapclear='rmt ~/.vim/swapdir/*'
alias rmt_swapdir='swapclear'

alias rmt_vimtags='rmt ~/.vimtags'

alias question='vim ~/Google\ Drive/question.txt'

# aliases are not available when using sudo. The line below seems useless but it solves the issue.
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# highlight the pattern.
# https://serverfault.com/questions/180749/linux-colorize-find
highlight() { perl -pe "s/$1/\e[1;31;43m$&\e[0m/g"; }
myfind(){
    # gnu version of find used: /usr/local/bin/find for mac
    # what find command does is that it simply finds all existing files within a directory.
    # It takes only one argument, which is the directory it would search through.
    # If a special option such as -name is given, it applies the condition onto the search results.
    #find . -name "*$@*" | highlight $@
    #find . | grep $@ # this also works.
    # find . -name "*$@*" | grep $@ # grep with color # case sensitive
    find . -iname "*$@*" | grep -i $@ # case insensitive
}
alias myf='myfind'

# iconv -c -f euc-kr -t utf-8 test.txt > text-utf8.txt
# dost2utf from.txt > to.txt
alias dos2utf='iconv -c -f euc-kr -t utf-8'
# convert euc-kr filename into utf-8 filename
# # /usr/local/bin/convmv from brew
alias dos2utf_title='convmv -f euc-kr -t utf-8 --notest'
alias dinner='python3 ~/praclang/py/dinner_reco/main.py'
alias di='dinner'
alias vim_basic='vim -u ~/dkenv/runtime_config/vim/.vimrc_basic'
alias vimrc_basic='vim ~/dkenv/runtime_config/vim/.vimrc_basic'
alias vimrc_basic_with_vim_basic='vim -u ~/dkenv/runtime_config/vim/.vimrc_basic ~/dkenv/runtime_config/vim/.vimrc_basic'

# for italic tmux
# TERM=xterm-256color-italic "bug

# if nvr -s does not work sometimes
alias rm_nvimsocket='rmt /tmp/nvimsocket'

alias whicha='which -a'
alias wha='whicha'
alias mana='whatis'
alias man_all='whatis'
whichls(){
    /usr/bin/which -a $@ | xargs ls -la --color=auto
}
alias whl='whichls'

# copy current working directory to clipboard
if [[ $platform == 'macos' ]]; then
    alias cpwd="pwd | tr -d '\n' | pbcopy" # do not use ''. '\n' breaks the quote.
elif [[ $platform == 'linux' ]]; then
    if type xclip 2>/dev/null; then
        alias cpwd='pwd | xclip -selection clipboard'
    else
        echo "install xclip"
    fi
else
    echo "cpwd: not yet available"
fi

alias less_bare='/usr/local/bin/less' # default less.
alias less='less -M +Gg' # -M shows line number. With G(go to last line)g(go to first line), the total page number and percentages are calculated. Good for not-so-long files.
# the same effect can be achieved with <c-g> key pressed inside less_bare.
alias more_bare='/usr/bin/more'
alias more='less'
# TIP: you can invoke system editor $EDITOR if press 'v' inside less. << awesome!

# man uses $MANPAGER, $PAGER variables. By default /usr/bin/less -is, but is overrided by $PAGER.

if [[ $platform == 'macos' ]]; then
    PAGER='/usr/local/bin/less -isM +Gg'
    MANPAGER='/usr/local/bin/less -isM +Gg'
fi

# my library
source ~/dkenv/runtime_config/shell/mylib_alias.sh
alias vmylib='eval $myvi ~/dkenv/runtime_config/shell/mylib_alias.sh'

alias idea='eval $myvi ~/Google\ Drive/idea/etc.txt'

alias clm='clisp main.lisp'
alias lp='clm'

alias listallcommand='bash -c "compgen -c"'

alias mypy_rm='/bin/rm -rf `find ~/praclang/ -type d -name "*mypy*"`'

alias unittest='python3 -m unittest test_main.py'

alias csapp_h='ln -s ~/books/comp/bibles/csapp/csapp.h .; ln -s ~/books/comp/bibles/csapp/csapp.c .'

alias psall='ps -ef'
alias ps_all='ps -ef'

alias spac='sudo pacman'
alias spac-install='sudo pacman -S'
alias spac-search='pacman -Ss'
alias spac-update='sudo pacman -Syu'
alias spac_info='pacman -Si'
alias spac_search='pacman -Ss'

alias mount_shared_folder='mount -t vboxsf comp /media/shared'

alias exit_status='echo $?'

# https://www.youtube.com/watch?v=0SJCYPsef54
alias tree_sync='while; do; clear; tree .; sleep 1; done'

alias sizeof_directory='du -hs'

alias terminal_fix='reset'
alias terminal_fix_bash='shopt -s checkwinsize' # or resize

alias brew_check_installed='brew ls --versions'

alias py_search_doc='open /usr/local/Cellar/python3/3.6.5/share/doc/python/index.html'

alias oaa='open /Applications'

alias man_list='apropos .' # whatis . also works
alias man_paths='man -wK'
alias man_pages='man -wK .'

alias lldb='/usr/bin/lldb'

is_symlink(){
    if [[ -L $@ ]]; then
        echo "$@ is a symlink."
        if [[ -f $@ ]]; then
            echo "(normal) $@ points to an existing file."
        else
            echo "(??) $@ does not point to an existing file."
        fi
    else
        echo "$@ is not a symlink."
    fi
}

alias unpack_tar='tar xopf'
alias unpack_tar_andList='tar xopft'
alias unzip_tar='unpack_tar'


if [[ $platform == "macos" ]]; then
    :;
fi

alias pgrep_with_space='pgrep -f'
alias kill_webpdb='pkill -f "Python main.py"'

# https://stackoverflow.com/questions/23098273/mac-os-x-why-is-wifi-called-en0-like-ethernet
alias mac_network_interfaces='networksetup -listallhardwareports'

port_usage(){
    lsof -i:$@
}
port_ps(){
    lsof -ti:$@
}

alias reset_octomouse="find . -name '*octomouse*' | xargs -d '\n' rmtrash"
alias vim_vertical_split='vim -O'

# howdoi: fast search
# tldr: short man page

if [[ $platform == "macos" ]]; then
    pip(){
        echo "#############################################################"
        echo "MY WARNING: this might be for python2.7. Use pip3 for python3"
        echo "#############################################################"
    }
fi

if [[ $platform == "macos" ]]; then
    alias zl='z -l'
fi

alias fzfrc="eval $myvi ~/dkenv/runtime_config/shell/fzf.sh"
alias zshcus="eval $myvi ~/dkenv/runtime_config/zsh/zsh_custom.zsh"

alias ca='cda' # cd advanced

# export FZF_DEFAULT_COMMAND='fd --type f'
cx() { # find based
  local dir
  dir=$( fd --type d -H | fzf +m) &&
  cl "$dir"
}

# frecency based (frequency + recency)
alias cz='cl $(fasd -dl | fzf)'
alias zc='cz'

# find based
vx(){
    local file
    file=$( fd --type f -H | fzf +m ) &&
    $myvi $file
}
#alias vf='eval $myvi $(fzf)' # vim + fzf
# use fasd instead of rupa/z and meain/v
##### vl='~/.zplug/repos/meain/v/v'
##### vz(){
#####     file=$(eval ${vl} | fzf)
#####     [[ ! -z "$file" ]] && $myvi "$file" # vim + z + fzf
##### }

# frecency based
vz(){ # vim + fasd + fzf
    local file
    file=$(fasd -fl | fzf)
    echo "$file"
    [[ ! -z "$file" ]] && $myvi "$file"
}

# cv with frecency.
zcv(){ # cd + vim + fasd + fzf
    local file
    local dir
    file=$( fasd -fl | fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
    if [[ -z "$file" ]]; then
        echo "Nothing selected..."
        return 1;
    fi
    $myvi $(basename "$file")
}

alias vc='cv'


alias nvr_socket_remove='rmt /tmp/nvimsocket*'

alias ruby_shell='irb'

alias detour_dns='sudo ifconfig en0 mtu 400'
alias detour_dns_recover='sudo ifconfig en0 mtu 1500'
alias detour_dns_linux='sudo ip link set dev wlo1 mtu 400'
alias detour_dns_linux='sudo ip link set dev wlo1 mtu 1500'
alias i3conf='vim ~/.config/i3/config'

alias soi3='i3-msg reload'
alias restarti3='i3-msg restart'

alias sox='xrdb ~/.Xresources'
alias xre='vim ~/.Xresources'

hey(){
    echo "why"
    return "hello"
}

xa(){
    ~/dkenv/runtime_config/shell/grep_fzf_vim.py $(grep -nir $@ | fzf)
}

alias gdbinit='vim ~/dkenv/runtime_config/gdb/.gdbinit'

alias gdb='gdb -n -q -x ~/dkenv/runtime_config/gdb/.gdbinit'

alias gps_runtime_config='git -C ~/dkenv/runtime_config add .;
git -C ~/dkenv/runtime_config commit -v;
git -C ~/dkenv/runtime_config push origin master'
