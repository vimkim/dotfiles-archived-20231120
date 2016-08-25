
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias la='ls -GAF'
alias ll='ls -GAFl'
cl(){ builtin cd "$@" && la
}
alias c='cl'
alias l='la'
alias v='vim'
 

alias rm='rm -i'
alias mv='mv -i'
alias cm='chmod -v'
alias md='mkdir'

#git shortcuts
alias gst='git status'
alias gad='git add'
alias gcm='git commit'
alias gps='git push'
alias gpl='git pull'

la

alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgill.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

#bindkey -v

export PATH="/usr/local/bin:$PATH"

#Rscript shortcut
alias rsc='Rscript'

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Python
alias python='python3'
alias py='python'
export PATH=/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Python.framework/Versions/3.5/bin
