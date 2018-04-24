# tmux auto rename disable
#export DISABLE_AUTO_TITLE="true"
# run tmux automatically
if [[ $SHLVL == 1 ]]; then
    tmux attach || tmux new
fi
source ~/runtime_config/zsh/detect_OS.zsh

# Aliases
source ~/runtime_config/shell/shell_alias.sh
source ~/runtime_config/zsh/zsh_alias.zsh
source ~/runtime_config/shell/temp_alias.sh
# Run at initialization
#source ~/runtime_config/zsh/zsh_run.zsh


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

# include dot files in wildcard
setopt GLOB_DOTS

# case insensitive
unsetopt CASE_GLOB

# for LaTex
#export PATH=$PATH:/Library/TeX/texbin # already in /etc/paths

# for tmux-powerline # currently not using it
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


##### EXTRA SOURCING #####
# for tmuxinator
source ~/runtime_config/tmuxinatorfiles/tmuxinator.zsh

if [[ $platform == "macos" ]]; then
    # for brew gnu tools and manuals
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

    # for ncurses for mac
    export PATH="/usr/local/opt/ncurses/bin:$PATH"

    # sshd, installed by homebrew, is in /usr/local/sbin.
    export PATH="/usr/local/sbin:$PATH"

    # matlab
    export PATH="/Applications/MATLAB_R2017a.app/bin:$PATH"
fi

# for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # automatically append by fzf when ./install

# pip --user
export PATH="$HOME/.local/bin:$PATH"

# print path
echo "****************************************************"
echo "\$PATH: \n"
# print path line by line
echo $PATH | tr -s ':' '\n'
# another methods just for fun
#tr : '\n' <<< $PATH
#sed 's/:/\n/g' <<< $PATH
#awk '{gsub(/:/, "\n");print}'

# if having trouble with path (something weird appears in path), check out /etc/paths and /etc/paths.d
# also check .zprofile, .zshenv, .zlogin, etc.
# Once it took me some time to detect an undesired python path being added to $PATH in .zprofile.
echo "\$PWD: $PWD"
echo "****************************************************"
