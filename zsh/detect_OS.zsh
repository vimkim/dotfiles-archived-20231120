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
        # `export` allows a other programs to recognize environment variables
    else
        echo "Pure Linux"
    fi
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi
echo "\$platform: $platform"

# find Linux distro
    distro='pi'
if [[ $(uname -n) == 'raspberrypi' ]]; then
    echo "\$distro: $distro"
fi
echo "****************************************************"
