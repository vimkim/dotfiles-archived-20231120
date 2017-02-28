# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/dqmacair/.oh-my-zsh
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="random"
#strug.zsh-theme
#intheloop.zsh-theme
#fox.zsh-theme
#zonathan.zsh-theme
#af-magit theme << ---- line separate, simple
#tjkirch_mod << neat, colorful, clear
#arrow << neat

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(vi-mode)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

#==========================================================================================
# CUSTOMIZED
#==========================================================================================

# vim save ctrl s begin
#alias vim="stty stop '' -ixoff ; vim"
#ttyctl -f
stty -ixon
# vim save ctrl s end

# vim config. If nvim exists, use it
viavailable(){
	if hash nvim 2>/dev/null; then
		nvim "$@"
	else
		vim "$@"
	fi
}
# vimrc function
vimrc(){
	if hash nvim 2>/dev/null; then
		nvim ~/.config/nvim/init.vim
	else
        vim ~/.vimrc
	fi
}
# ls config
#alias ls='ls --color=auto'
alias l='ls -GF'
alias la='ls -GAF'
alias ll='ls -GAFl'
cl(){ builtin cd "$@" && la
}
c(){
	if [ -d $@ ]; then
		cl "$@"
	elif [ -f $@ ]; then
		viavailable "$@"
	else
		echo "hey, there is my_error, check .zshrc"
	fi
}
v(){
	if [ -d $@ ]; then
		cl "$@"
		#elif [ -f $@ ]; then
	else
		viavailable "$@"
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
alias mv='mv -iv'
alias cm='chmod -v'
alias md='mkdir'

#grep shortcuts
alias grep='grep --color'
alias fzg='grep -nir'
alias fzgrep='grep -nir'
#alias ask='grep -nir '
alias ask='grep -nir -A 2'
function askman { 
	ask "$@" ~/mymanual/
}
function askhere { 
	ask "$@" . 
}
alias gotoman='cd ~/mymanual'

#git shortcuts
alias gst='git status'
alias gad='git add'
alias gada='git add .'
alias gcm='git commit'
alias gcmm='git commit -m'
alias gcmam='git commit -am'
alias gps='git push'
alias gpsom='git push origin master'
alias gpl='git pull'
alias gplom='git pull'

# ssh shortcut
alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgill.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

#Rscript shortcut
alias rsc='Rscript'

#Python shortcut
alias python='python3'
alias py='python'

# better than cat
alias dog='pygmentize -g'

# jekyll blog
alias jse='bundle exec jekyll serve -w'

#macOS
alias o='open'
alias oas='open -a Safari'

# Compiler
#alias gcc='/usr/local/Cellar/gcc/6.2.0/bin/gcc-6'
#alias g++='/usr/local/Cellar/gcc/6.2.0/bin/g++-6'

# bindkey -M viins ',,' vi-cmd-mode
bindkey -M viins 'wf' vi-cmd-mode
bindkey -M viins 'fw' vi-cmd-mode
export NVIM_TUI_ENABLE_TRUE_COLOR=1
la
# archey
#screenfetch -v


# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH=/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Python.framework/Versions/3.5/bin
# for macport
export PATH=$PATH:/opt/local/bin

# for LaTex
export PATH=$PATH:/Library/TeX/texbin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias sage='~/Applications/SageMath/sage'

# LaTeX
#alias pdflatex='/usr/local/texlive/2016/bin/x86_64-darwin/pdflatex'
#alias latexmk='/library/tex/texbin/latexmk/'

# when quite ranger, change shell directory to last visited ranger directory
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
alias ra='ranger'
# With shell aliases
#alias ra='SHELL=/usr/local/bin/r.shell ranger # seems like not working

