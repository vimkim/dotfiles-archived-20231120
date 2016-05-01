
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

la

alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgill.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

bindkey -v

export PATH="$HOME/bin:$PATH"

