
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias la='ls -GAF'
alias ll='ls -GAFl'
cl(){ builtin cd "$@" && la
}
#alias c='cl'
c(){
    if [ -d $@ ]; then
        cl "$@"
    elif [ -f $@ ]; then
        nvim "$@"
    else
        echo "hey, there is my_error, check .zshrc"
    fi
}
alias l='ls'
#alias v='nvim'
v(){
    if [ -d $@ ]; then
        cl "$@"
    #elif [ -f $@ ]; then
    else
        nvim "$@"
    #else
        #read -q "REPLY?Would you like to create a new file?"
        #if [[ $REPLY =~ '^[Yy]$' ]]; then # $REPLY = y also works
            #nvim "$@"
        #else
            #echo "hey, there is my_error, check .zshrc"
        #fi
    fi
}
alias rm='rm -i'
alias mv='mv -i'
alias cm='chmod -v'
alias md='mkdir'

#git shortcuts
alias gst='git status'
alias gad='git add'
alias gcm='git commit'
alias gps='git push'
alias gpsom='git push origin master'
alias gpl='git pull'

la

alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgill.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

#bindkey -v

export PATH="/usr/local/bin:$PATH"

#Rscript shortcut
alias rsc='Rscript'
alias python='python3'
alias py='python'
alias dog='pygmentize -g'
alias o='open'
alias oas='open -a Safari'
export NVIM_TUI_ENABLE_TRUE_COLOR=1
ls
# archey
#screenfetch -v


# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Python
export PATH=/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Python.framework/Versions/3.5/bin
