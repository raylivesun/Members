#!/home/admin/app/PowerShell/Members

# Get Exec Hash (PowerShell) and Exe Hash (C#)
Get-ExecutionPolicy -Scope Process | Out-Null
$exeHash = (Get-Process -Id $PID).Modules[0].FileVersionInfo.FileHash.ToString('B')
$execHash = $exeHash.Substring(0, 32)
Write-Host "Exe Hash: $exeHash"
Wait-Event "Exit $execHash"

# Get Exe Path
$exePath = (Get-Process -Id $PID).Path
Write-Host "Exe Path: $exePath"
# Create Event
New-EventLog -LogName Application -Source "PowerShell Member" -EventID 1001 -Message "Exe Hash: $exeHash"
New-EventLog -LogName Application -Source "PowerShell Member" -EventID 1002 -Message "Exe Path: $exePath"


# Get Exec Hash (PowerShell) and Exe Hash (C#)
Get-ExecutionPolicy -Scope Process | Out-Null
$exeHash = (Get-Process -Id $PID).Modules[0].FileVersionInfo.FileHash.ToString('B')
$exeHash = $exeHash.Substring(0, 32)
Write-Host "Exe Hash: $exeHash"
Wait-Event "Exit $execHash"

# Get Exe Path
$exePath = (Get-Process -Id $PID).Path
Write-Host "Exe Path: $exePath"
# Create Event
New-EventLog -LogName Application -Source "PowerShell Member" -EventID 1001 -Message "Exe Hash: $exeHash"
New-EventLog -LogName Application -Source "PowerShell Member" -EventID 1002 -Message "Exe Path: $exePath"



# Get Exec Hash (PowerShell) and Exe Hash (C#)
Get-ExecutionPolicy -Scope Process | Out-Null
$exeHash = (Get-Process -Id $PID).Modules[0].FileVersionInfo.FileHash.ToString('B')
$exeHash = $exeHash.Substring(0, 32)
Write-Host "Exe Hash: $exeHash"
Wait-Event "Exit $execHash"

# Get Exe Path
$exePath = (Get-Process -Id $PID).Path
Write-Host "Exe Path: $exePath"
# Create Event
New-EventLog -LogName Application -Source "PowerShell Member" -EventID 1001 -Message "Exe Hash: $exeHash"
New-EventLog -LogName Application -Source "PowerShell Member" -EventID 1002 -Message "Exe Path: $exePath"
