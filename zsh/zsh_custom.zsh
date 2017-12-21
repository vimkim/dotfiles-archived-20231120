source ~/runtime_config/zsh/detect_OS.zsh

# for oh-my-zsh plugin vi-mode mapping
bindkey -M viins ',s' vi-cmd-mode

# NVIM truecolor; not sure if effective
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# for vim to recognize <c-s>
stty -ixon
# for fzf ctrl+r, remove duplicates
setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS

# for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# for fzf ctrl+r, remove duplicates
setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS

# matlab
export PATH="/Applications/MATLAB_R2017a.app/bin:$PATH"

# run tmux automatically
if [[ $SHLVL == 1 ]]; then
    tmux attach || tmux new
fi

# Aliases
source ~/runtime_config/shell-aliases.sh
source ~/runtime_config/zshaliases.zsh
source ~/runtime_config/temp-aliaslist.sh
# Run at initialization
#source ~/runtime_config/zshrun.zsh

##### PATH #####
# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# for LaTex
export PATH=$PATH:/Library/TeX/texbin

# for tmux-powerline # currently not using it
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


##### EXTRA SOURCING #####
# for tmuxinator
source ~/runtime_config/tmuxinatorfiles/tmuxinator.zsh

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# for ncurses for mac
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# print path
echo "****************************************************"
echo "\$PATH: $PATH"
echo "\$PWD: $PWD"
echo "****************************************************"
