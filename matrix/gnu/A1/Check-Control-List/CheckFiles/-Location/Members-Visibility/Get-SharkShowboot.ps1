#!/home/admin/app/PowerShell/Members

# Get Shark show boot times from the last servers local
# This script assumes that the Shark show is running on the same server
# as the PowerShell script
Get-Content 'C:\Program Files\Shark Server\logs\server.log' |
    Where-Object { $_.Contains('Starting Shark Server') } |
    Select-Object -Last 1 |
    ForEach-Object { $_.Substring($_.LastIndexOf(' ') + 1) }

# Convert the boot time to a Unix timestamp
$bootTimeUnix = [System.DateTime]::ParseExact($_, 'yyyy-MM-dd HH:mm:ss', $null).ToUniversalTime().Subtract([System.DateTime]::UnixEpoch).TotalSeconds

# Get the current server boot time
$serverBootTime = (Get-WmiObject -Class Win32_OperatingSystem).ConvertToDateTime('ConvertToDateTime')

# Calculate the time difference in seconds
$timeDifference = $serverBootTime.Subtract($bootTimeUnix).TotalSeconds

# Format the time difference as a human-readable string
$timeDifferenceString = [math]::Round($timeDifference / 60, 2) + ' minutes'

# Output the time difference
Write-Host "The Shark show has been running for $timeDifferenceString since the last server boot."


# Get the last 5 Shark show logs
Get-Content 'C:\Program Files\Shark Server\logs\server.log' |
    Select-Object -Last 5
    # Format the log entries
    ForEach-Object {
        $dateTime = [System.DateTime]::ParseExact($_.Substring($_.LastIndexOf(' ') + 1), 'yyyy-MM-dd HH:mm:ss', $null).ToUniversalTime()
        $level = $_.Substring(0, $_.IndexOf(' '))
        $message = $_.Substring($_.IndexOf(' ') + 1)
        "{0:yyyy-MM-dd HH:mm:ss} [{1}] {2}" -f $dateTime, $level, $message
    }
    # Output the formatted log entries
    | Out-String
    Write-Host "Last 5 Shark show logs:"
    Write-Host $_
    Write-Host ""
    Write-Host "Note: The log entries are displayed in reverse chronological order."
    Write-Host ""
    Write-Host "To view all logs, open the 'server.log' file in the 'logs' directory."
    Write-Host ""
    Write-Host "To view detailed statistics, run the 'statistics.ps1' script."
    Write-Host ""
    Write-Host "To export the logs to a CSV file, run the 'export_logs.ps1' script."
    Write-Host ""
Write-Debug "Shark show statistics and logs have been generated."
Wait-Job -Id $myJob.Id
Wait-Job -Id $myJob.Id -Timeout 10
Wait-Job -Id $myJob.Id -ErrorAction SilentlyContinue
Wait-Job -Id $myJob.Id -Complete
Wait-Job -Id $myJob.Id -Force
Wait-Job -Id $myJob.Id -Wait
