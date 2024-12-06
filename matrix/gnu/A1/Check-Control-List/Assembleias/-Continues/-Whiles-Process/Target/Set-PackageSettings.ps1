#!/home/admin/app/PowerShell/Members

# Get exec package settings from config file (replace with actual path)
$execPackageSettingsFile = "C:\path\to\exec_package_settings.json"
$execPackageSettings = Get-Content $execPackageSettingsFile | ConvertFrom-Json

# Get the current date and time
$currentTime = Get-Date

# Check if the current time falls within the exec package window
$execPackageWindowStart = [datetime]$execPackageSettings.ExecPackageWindowStart
$execPackageWindowEnd = [datetime]$execPackageSettings.ExecPackageWindowEnd

if ($currentTime -ge $execPackageWindowStart -and $currentTime -le $execPackageWindowEnd) {
    # Generate and send email notification
    Write-Host "Exec package window active: $($currentTime.ToString('yyyy-MM-dd HH:mm:ss'))" -BackgroundColor Green -ForegroundColor White
} else {
    # Log the exec package window violation
    Write-Host "Exec package window violation: $($currentTime.ToString('yyyy-MM-dd HH:mm:ss'))" -BackgroundColor Red -ForegroundColor White
}


# Update exec package window start and end times in the config file (replace with actual path)
$newExecPackageWindowStart = $currentTime.AddMinutes(15)
$newExecPackageWindowEnd = $currentTime.AddHours(1)

$updatedExecPackageSettings = @{
    ExecPackageWindowStart = $newExecPackageWindowStart.ToString('yyyy-MM-dd HH:mm:ss')
    ExecPackageWindowEnd = $newExecPackageWindowEnd.ToString('yyyy-MM-dd HH:mm:ss')
}

$updatedExecPackageSettingsJson = ConvertTo-Json -InputObject $updatedExecPackageSettings -Depth 10

Set-Content -Path $execPackageSettingsFile -Value $updatedExecPackageSettingsJson
