# run this file under administrative privilege
# > powershell -file automate.ps1
# if error msg: cannot create a file when that file already exists
# then: type taskschd.msc and delete duplicates

$action = New-ScheduledTaskAction -Execute "powershell" -Argument "-File %homepath%\dkenv\runtime_config\auto\windows\auto.ps1 -WindowStyle Hidden"

$trigger = New-ScheduledTaskTrigger -Once -at (get-date) -RepetitionInterval (New-TimeSpan -Minutes 1)

# in order to enable the option "run without password"
$principal = new-scheduledtaskprincipal -userid $env:USERNAME -Logontype S4U -runlevel highest

Register-ScheduledTask auto -action $action -trigger $trigger -principal $principal
$action = New-ScheduledTaskAction -Execute "powershell" -Argument "-File %homepath%\dkenv\runtime_config\auto\windows\autoBaekjoon.ps1 -WindowStyle Hidden"
Register-ScheduledTask autoBaekjoon -action $action -trigger $trigger -principal $principal