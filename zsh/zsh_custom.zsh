
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux auto rename disable
#export DISABLE_AUTO_TITLE="true"
# run tmux automatically
if [[ $SHLVL == "2" ]]; then # reason for 2 instead of 1?
    # if I ZDOTDIR= ... zsh, then it's already LVL2
    tmux attach || tmux new
    exit
fi

source ~/dkenv/runtime_config/zsh/detect_OS.zsh
##### # Antigen
##### if [[ $platform == "macos" ]]; then
#####     source $(brew --prefix)/share/antigen/antigen.zsh
#####     echo "****************************************************"
#####     echo "Antigen running..."
#####     echo "****************************************************"
##### else
#####     echo "MY WARNING: antigen not installed. (.zshrc)"
##### fi
##### antigen bundle andrewferrier/fzf-z

# Aliases
source ~/dkenv/runtime_config/shell/shell_alias.sh
source ~/dkenv/runtime_config/zsh/zsh_alias.zsh
source ~/dkenv/runtime_config/shell/temp_alias.sh
# Run at initialization
#source ~/dkenv/runtime_config/zsh/zsh_run.zsh


# for oh-my-zsh plugin vi-mode mapping
bindkey -M viins ',s' vi-cmd-mode

# NVIM truecolor; not sure if effective
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# for vim to recognize <c-s>
stty -ixon

# include dot files in wildcard
setopt GLOB_DOTS

# case insensitive
unsetopt CASE_GLOB

# for LaTex
#export PATH=$PATH:/Library/TeX/texbin # already in /etc/paths

# for tmux-powerline # currently not using it
#PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


##### EXTRA SOURCING #####
# for tmuxinator
source ~/dkenv/runtime_config/tmuxinatorfiles/tmuxinator.zsh

if [[ $platform == "macos" ]]; then
    # for brew gnu tools and manuals
    #export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # not using these cuz it does not work with selecta + tmux combination
    # https://github.com/garybernhardt/selecta/issues/103
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

    # for ncurses for mac
    export PATH="/usr/local/opt/ncurses/bin:$PATH"

    # sshd, installed by homebrew, is in /usr/local/sbin.
    export PATH="/usr/local/sbin:$PATH"

    # matlab
    export PATH="/Applications/MATLAB_R2017a.app/bin:$PATH"
fi

# for FZF
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # automatically append by fzf when ./install
# even if I move this here, fzf will automaticall add another one so ...
### fzf examples
source ~/dkenv/runtime_config/shell/fzf.sh

# for fzf ctrl+r, remove duplicates
setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS
#export FZF_DEFAULT_COMMAND='fd --type f'



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
echo "\$SHLVL: $SHLVL"
echo "hello"

echo "****************************************************"
