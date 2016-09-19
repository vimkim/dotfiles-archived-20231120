# .bashrc

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# vim config. If nvim exists, use it
viavailable(){
    if hash nvim 2>/dev/null; then
        nvim "$@"
    else
        vim "$@"
    fi
}

# ls config
alias ls='ls --color=auto'
alias la="ls -GAF"
alias ll="ls -lAF"
alias l='ls' 

#cl, c, v config
cl(){ 
	builtin  cd "$@" && ls
}

c(){
    if [[ -d $@ ]]; then
        cl "$@"
    elif [[ -f $@ ]]; then
        viavailable "$@"
    else
        read -r -p "create new file? [y/N] " response
        if [[ $response =~ ^([Yy]|[yY][eE][sS])$ ]]; then 
            viavailable "$@"
        else
            echo "hey, there is an my_error, check .*rc file"
        fi
    fi
} # unlike v(), if new files are intended to be created, then it asks once more.

v(){
    if [[ -d $@ ]]; then
        cl "$@"
    #elif [ -f $@ ]; then
    else
        viavailable "$@"
    fi
}

# verbose rm and mv
alias rm='rm -i'
alias mv='mv -i'

# easier 
alias cm='chmod -v'
alias md='mkdir'

#git shortcuts
alias gst='git status'
alias gad='git add'
alias gcm='git commit'
alias gps='git push'
alias gpsom='git push origin master'
alias gpl='git pull'

# if login, run la
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
