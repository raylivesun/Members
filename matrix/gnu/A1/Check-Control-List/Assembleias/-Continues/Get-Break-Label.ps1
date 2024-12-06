#!/home/admin/app/PowerShell/Members

# Get Break Label from Event ID 4624
$breakLabel = Get-WinEvent -Id 4624 | Select-Object -ExpandProperty Message | ConvertFrom-Json | Select-Object -ExpandProperty BreakLabel

# Get Logon Events with the specified Break Label
$logonEvents = Get-WinEvent -FilterHashtable @{
    LogName = "Security"
    StartTime = (Get-Date).AddMinutes(-15)
    EndTime = Get-Date
    Id = 4624
    Message = $breakLabel
}

# Get the count of logon events
$logonCount = $logonEvents.Count

# Get the usernames of the logon events
$logonUsers = $logonEvents | Select-Object -ExpandProperty UserName

# Get the IP addresses of the logon events
$logonIPs = $logonEvents | Select-Object -ExpandProperty Computer

# Get the time of the logon events
$logonTimes = $logonEvents | Select-Object -ExpandProperty TimeCreated

# Get the source accounts of the logon events
$logonSources = $logonEvents | Select-Object -ExpandProperty SourceUserName

# Generate a summary report
Write-Host "Logon Events Summary:"
Write-Host "-----------------------------"
Write-Host "Total Logon Events: $logonCount"
Write-Host ""
Write-Host "Users:"
foreach ($user in $logonUsers) {
    Write-Host "- $user"
}
Write-Host ""
Write-Host "IP Addresses:"
foreach ($ip in $logonIPs) {
    Write-Host "- $ip"
}
Write-Host ""
Write-Host "Logon Times:"
foreach ($time in $logonTimes) {
    Write-Host "- $time"
}
Write-Host ""
Write-Host "Source Accounts:"
foreach ($source in $logonSources) {
    Write-Host "- $source"
}

$i = 0
:mainLoop While ($i -lt 15) {
    Write-Host $i -ForegroundColor 'Cyan'
$j = 0
While ($j -lt 15) {
     Write-Host $j -ForegroundColor 'Magenta'
     $i++
     $j++
     Start-Sleep -Seconds 1
     $k = $i*$j
     Write-Host $k -ForegroundColor 'Green'
     if ($k -gt 100) {
         break mainLoop
     }
$j++
}
$i++
}

