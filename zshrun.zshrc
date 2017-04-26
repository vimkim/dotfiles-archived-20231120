#echo "##### listing all contents #####"
RUN='ls'
#eval "$RUN" # temp pause
#echo "wtr is amazing!"
RUN='wtr'
#eval "$RUN" # temp pause
if [[ $platform == 'macos' ]]; then
    RUN='ansiweather'
    eval "$RUN"
    RUN='cat ~/Google\ Drive/keep_offline.md'
    eval "$RUN"
fi

if [[ $platform == 'linux' ]]; then
    RUN='ansiweather'
    eval "$RUN"
fi

RUN='unco'
eval "$RUN"
RUN='echo "library books return"'
eval "$RUN"
eval "$RUN"
RUN='echo "대관세찰"'
eval "$RUN"
RUN='echo "이 문제는 어떻게 푸는 거에요?"'
eval "$RUN"
