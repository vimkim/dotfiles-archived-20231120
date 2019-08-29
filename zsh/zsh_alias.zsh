# zsh c,v
c(){
    if [[ -d $@ ]]; then
        cl "$@"
    elif [[ -f $@ ]]; then
        eval $myed "$@"
    elif [[ $# == 0 ]]; then
        cl;
    else
        echo "Hey, such file or directory does not exist. Use v() instead of c() to create a file."
    fi
}

e(){
    if [[ -d $@ ]]; then
        cl "$@"
        #elif [ -f $@ ]; then
    else
        eval $myed "$@"
        #else
        #read -q "REPLY?Would you like to create a new file?"
        #if [[ $REPLY =~ '^[Yy]$' ]]; then # $REPLY = y also works
        #nvim "$@"
        #else
        #echo "hey, there is my_error, check .zshrc"
        #fi
    fi
}

v(){
    if [[ -d $@ ]]; then
        cl "$@"
        #elif [[ -f $@ ]]; then
    else
        eval $=myvi "$@" # for mvim, $myvi must be array. myvi=(mvim --remote-silent)
        #else
        #read -q "REPLY?Would you like to create a new file?"
        #if [[ $REPLY =~ '^[Yy]$' ]]; then # $REPLY = y also works
        #nvim "$@"
        #else
        #echo "hey, there is my_error, check .zshrc"
        #fi
    fi
}

# extra zsh options
setopt extended_glob # only for zsh
