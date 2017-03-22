##### ALIASES #####
# 1. ls
# 2. viavailable
# 3. cl, c, v functions
# 4. zshrc, vimrc functions
# 5. accessibility (e.g. rm -i)
# 6. Git
# 7. TMUX, Tmuxinator
# 8. Ranger
# 9. Languages: R,Python,C,Latex,etc.
# 10. PERSONAL

# ls aliases 
#alias ls='ls --color=auto'
alias l='ls -GF'
alias la='ls -GAF'
alias ll='ls -GAFl'

# vim config. If nvim exists, use it
viavailable(){
	if hash nvim 2>/dev/null; then
		nvim "$@"
	else
		vim "$@"
	fi
}

cl(){ builtin cd "$@" && la
}

c(){
	if [ -d $@ ]; then
		cl "$@"
	elif [ -f $@ ]; then
		viavailable "$@"
	else
        echo "Hey, such file or directory does not exist. Use v() instead of c() to create a file."
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

# zshrc function
alias zshrc='viavailable ~/runtime_config/.zshrc'
alias sozsh='source ~/.zshrc'

# vimrc function
alias vimrc='nvim ~/runtime_config/.vimrc'
alias nvimrc='nvim ~/runtime_config/init.vim'
alias vvimrc='vim ~/runtime_config/.vimrc'
alias vnvimrc='vim ~/runtime_config/init.vim'

# accessibility aliases
alias rm='rm -i'
alias mv='mv -iv'
alias ei='exit'
alias cm='chmod -v'
alias md='mkdir'
alias mkd='mkdir'
alias grep='grep --color'
alias fzg='grep -nir'
alias fzgrep='grep -nir'
#alias ask='grep -nir'
alias ask='grep -nir -A 2'
function askman { 
	ask "$@" ~/mymanual/
}
function askhere { 
	ask "$@" . 
}
alias dog='pygmentize -g' # cat with syntax
alias whichsh='echo $0' #check shell

#git 
alias gst='git status'
alias gad='git add'
alias gap='git add --patch'
alias gc='git commit --verbose'
alias gps='git push'
alias gpsom='git push -u origin master'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gbr='git branch'
alias gco='git checkout'
alias gsa='git stash'
alias glo='git log'
alias gdi='git diff'
alias gsh='git show'
alias gbl='git blame'
alias gds='git dissect'

# tmux
alias tmu='tmux'
alias tmua='tmux a'
alias tmuat='tmux a -t'
alias tmul='tmux ls'
alias tmus='tmux new-session -s'
alias tmuk='tmux kill-session'
alias tmuks='tmux kill-session -t'
alias tmuc='tmux switch-client -t'
#alias tmxkissall="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill" # does not work

# tmuxinator
alias muxl='mux ls'
alias muxn='mux new'
alias muxo='mux open'
alias muxs='mux start'
alias muxst='mux start stream'
alias muxstop='mux start stopwatch'

# ranger 
# when quit ranger, change shell directory to last visited ranger directory
alias ranger='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
alias r_ranger='SHELL=~/.config/ranger/r.shell ranger' # source shell aliases
alias ra=r_ranger

##### LANGUAGES #####

#Rscript shortcut
alias rso='Rscript' # r source

#Python shortcut
alias python='python3'
alias py='python'

# sage alias
alias sage='~/Applications/SageMath/sage'

# Compiler
alias gcc='/usr/local/Cellar/gcc/6.3.0_1/bin/gcc-6'
#alias g++='/usr/local/Cellar/gcc/6.2.0/bin/g++-6'

# LaTeX
#alias pdflatex='/usr/local/texlive/2016/bin/x86_64-darwin/pdflatex'
#alias latexmk='/library/tex/texbin/latexmk/'



##### PERSONAL #####

# ssh shortcut
alias lmm="ssh dkim87@mimi.cs.mcgill.ca"
alias llx="ssh dkim87@linux.cs.mcgil l.ca"
alias luu="ssh dkim87@ubuntu.cs.mcgill.ca"

# personal cd aliases
alias runtime_config='cd ~/runtime_config; ls -a'
alias myman='cd ~/mymanual; ls -a'
alias anki='cd ~/anki/; ls -a'
alias notetaking='cd ~/notetaking/; ls -a'
alias project='cd ~/notetaking/1_fine482/project/; ls -a'
alias mysnips='cd ~/runtime_config/mysnips/UltiSnips; ls -a'

# personal edit aliases
alias tmuxconf='viavailable ~/runtime_config/.tmux.conf'
alias keep='viavailable ~/Google\ Drive/keep_offline.md'
alias todo='viavailable ~/Google\ Drive/keep_offline.md'

# personal cat aliases

# personal app aliases
alias stopwatch='cd ~/Stopwatch2Txt/; python3 ~/Stopwatch2Txt/stopwatch.py'
alias wtr='curl wttr.in/montreal'
alias weather='curl wttr.in/montreal'
alias jse='bundle exec jekyll serve -w' # jekyll server
alias o='open' # mac 
alias oas='open -a Safari' # mac
alias emacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw'

# personal url aliases
alias gmail='open http://www.gmail.com'
alias univmail='open https://outlook.office365.com/owa/'
alias fb='open https://www.facebook.com'
alias mycourses='open https://mycourses2.mcgill.ca/'
myupdate(){
    gmail;
    univmail;
    fb;
}
alias fido='open -a /Applications/Google\ Chrome.app https://www.fido.ca'
alias cibc='open -a /Applications/Google\ Chrome.app www.cibc.ca'
alias bell='open -a /Applications/Google\ Chrome.app www.bell.ca'

bills(){
    fido;
    cibc;
    bell;
    echo "mcgill library!"
}

# shell level (find if nested)
alias shlv='echo $SHLVL'

studylog(){
    viavailable ~/Google\ Drive/diary/studylog/studylog_$(date +%y-%m-%d).md
}

# FZF change completion key
export FZF_COMPLETION_TRIGGER='/' 
#bindkey '^p' fzf-completion
#bindkey '^I' $fzf_default_completion # not working well

alias gall='viavailable ~/Google\ Drive/diary/gall.md'

alias whome='cd /mnt/l/'
