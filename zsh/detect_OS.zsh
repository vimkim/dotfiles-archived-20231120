# Detect OS
platform='unknown'
distro='unknown'
unamestr=$(uname)
iswsl='false' # in order to use user-defined envvar, export required
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'

    if grep -q Microsoft /proc/version; then
        echo "Windows Subsystem Linux"
        iswsl='true'
        export iswsl # vim papercolor theme need this info
        # `export` allows other programs to recognize environment variables
    else
        echo "Pure Linux"
    fi
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi
echo "\$platform: $platform"
export platform


# find Linux distro
distro='non_linux'
if uname -a | grep -qi 'manjaro'; then # if manjaro exists in uname --all
    distro='manjaro'
elif [[ $(uname -n) == 'raspberrypi' ]]; then
    distro='pi'
elif grep -qi 'ubuntu' /etc/os-release; then
    distro='ubuntu'
fi
export distro
echo "\$distro: $distro"
echo "****************************************************"
