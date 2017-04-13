if [[ $iswsl == 'true' ]]; then
    if grep -q Microsoft /proc/version; then
        echo "Ubuntu on Windows"
    else
        echo "Not on Windows"
    fi
# Launch Zsh if WSL
    if grep -q Microsoft /proc/version; then
        if [ -t 1 ]; then
            exec zsh
        fi
    fi
fi

c(){
    if [[ $# -eq 0 ]]; then
        echo "cd to home"
        cl ~
    elif [[ -d $@ ]]; then
        cl "$@"
    elif [[ -f $@ ]]; then
        $myvi "$@"
    else
        #read -r -p "create new file? [y/N] " response
        #if [[ $response =~ ^([Yy]|[yY][eE][sS])$ ]]; then
        #viavailable "$@"
        #else
        #echo "Hey, such file or directory does not exist. Use v() instead of c() to create a new file"
        #fi
        echo "Hey, such file or directory does not exist. Use v() instead of c() to create a new file"
    fi
} # unlike v(), if new files are intended to be created, then it asks once more.

v(){
    if [[ -d $@ ]]; then
        cl "$@"
        #elif [ -f $@ ]; then
    else
        $myvi "$@"
    fi
}

