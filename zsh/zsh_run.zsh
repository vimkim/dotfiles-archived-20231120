#echo "##### listing all contents #####"
RUN='ls'
#eval "$RUN" # temp pause

#echo "wtr is amazing!"
RUN='wtr'
#eval "$RUN" # temp pause

RUN='unco'
eval "$RUN"

if [[ $platform == 'linux' ]]; then
    RUN='ansiweather'
    eval "$RUN"
fi

#RUN='echo "library books return"'
eval "$RUN"

RUN='echo "대관세찰"'
eval "$RUN"

if [[ $platform == 'macos' ]]; then
    RUN='cat ~/Google\ Drive/keep_offline.md'
    eval "$RUN"

    RUN='ansiweather'
    eval "$RUN"
    RUN='ansiweather -l Seoul,KR'
    eval "$RUN"
fi
