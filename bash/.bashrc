
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
#alias ls='ls --color=auto'
alias la="ls -GAF"
alias ll="ls -GAFl"
alias l='ls'

#cl, c, v config
cl(){
	builtin  cd "$@" && la
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
alias mv='mv -iv'

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


alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgill.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

#bindkey -v

# if brew is installed but /usr/local/bin is not added to your path,
# uncomment the following line.
#export PATH="/usr/local/bin:$PATH"

#Rscript shortcut
alias rsc='Rscript'

# better than cat
alias dog='pygmentize -g'

# jekyll blog
alias jse='bundle exec jekyll serve -w'

#macOS
alias o='open'
alias oas='open -a Safari'

# Compiler
alias gcc='/usr/local/Cellar/gcc/6.2.0/bin/gcc-6'
alias g++='/usr/local/Cellar/gcc/6.2.0/bin/g++-6'

export NVIM_TUI_ENABLE_TRUE_COLOR=1

# archey
#screenfetch -v

# wildcard hidden files
shopt -s dotglob

# for bash vi (.inputrc is for all sh)
set -o vi

# fzf bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# remote duplicates
export HISTCONTROL=ignoreboth:erasedups

source ~/runtime_config/shell/shell_alias.sh
source ~/runtime_config/bash/bash_alias.bash

# for vim to react to c-q and c-s
stty start undef

echo "****************************************************"
echo "\$PATH: $PATH"
echo "****************************************************"

