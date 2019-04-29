# https://superuser.com/questions/1271205/how-to-get-the-host-user-home-directory-in-wsl-bash
win_userprofile="$(cmd.exe /c "<nul set /p=%UserProfile%" 2>/dev/null)"

win_userprofile_drive="${win_userprofile%%:*}:"
userprofile_mount="$(findmnt --noheadings --first-only --output TARGET "$win_userprofile_drive")"

win_userprofile_dir="${win_userprofile#*:}"

userprofile="${userprofile_mount}${win_userprofile_dir//\\//}"

alias home='cl $userprofile'
alias h='home'
alias cdrive='cl /mnt/c'

alias start='cmd.exe /c start'
