#unalias -a
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
#strug.zsh-theme << recommended!
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
plugins=(git vi-mode)

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
export SSH_KEY_PATH="~/.ssh/rsa_id"

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

# for vi-mode for zsh prompt
# bindkey -M viins ',,' vi-cmd-mode
# bindkey -M viins 'wf' vi-cmd-mode
# bindkey -M viins 'fw' vi-cmd-mode
bindkey -M viins ',s' vi-cmd-mode

export NVIM_TUI_ENABLE_TRUE_COLOR=1
# archey
#screenfetch -v

# vim save ctrl s {{{ 
#alias vim="stty stop '' -ixoff ; vim"
#ttyctl -f
stty -ixon
# }}}

##### PATH #####
# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# for macport
#export PATH=$PATH:/opt/local/bin # not used

# for LaTex
export PATH=$PATH:/Library/TeX/texbin

# for tmux-powerline # currently not using it
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# for fzf ctrl+r, remove duplicates
setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS

##### EXTRA SOURCING #####
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# for tmuxinator
source ~/runtime_config/tmuxinatorfiles/tmuxinator.zsh
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# for ncurses for mac
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# run tmux automatically
if [[ $SHLVL == 1 ]]; then
    tmux attach || tmux new
fi

# Aliases
source ~/runtime_config/shell-aliases.sh
source ~/runtime_config/zshaliases.zsh
source ~/runtime_config/temp-aliaslist.sh
# Run at initialization
source ~/runtime_config/zshrun.zsh
