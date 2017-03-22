#echo "##### listing all contents #####"
RUN='ls'
#eval "$RUN" # temp pause
#echo "wtr is amazing!"
RUN='wtr'
#eval "$RUN" # temp pause
if [[ $platform == 'macos' ]]; then
    RUN='ansiweather'
    eval "$RUN"
fi
