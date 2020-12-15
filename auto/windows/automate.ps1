# run this file under administrative privilege
# > powershell -file automate.ps1
# if error msg: cannot create a file when that file already exists
# then: type taskschd.msc and delete duplicates

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File %homepath%\dkenv\runtime_config\auto\windows\auto.ps1 -WindowStyle Hidden"

$trigger = New-ScheduledTaskTrigger -Once -at (get-date) -RepetitionInterval (New-TimeSpan -Minutes 1)

#$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
#$settings = New-ScheduledTaskSettingsSet -MultipleInstances Parallel
#Register-ScheduledTask auto -action $action -trigger $trigger -Settings $settings -Principal $principal
Register-ScheduledTask auto -action $action -trigger $trigger

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File %homepath%\dkenv\runtime_config\auto\windows\autoBaekjoon.ps1 -WindowStyle Hidden"
#Register-ScheduledTask autoBaekjoon -action $action -trigger $trigger -Settings $settings -Principal $principal
Register-ScheduledTask autoBaekjoon -action $action -trigger $trigger