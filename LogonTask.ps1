$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '"C:\Windows\notepad.exe"'
$Trigger = New-ScheduledTaskTrigger -AtLogon
$Principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal
Register-ScheduledTask -TaskName 'Notepad at Startup' -InputObject $Task 