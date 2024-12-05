#!/home/admin/app/PowerShell/Members

# Alians Append for New Member Creation and Update Notifications
$aliases = @{
    'Add-Alias' = 'Add-ADUser'
    'Get-Alias' = 'Get-ADUser'
    'Remove-Alias' = 'Remove-ADUser'
    'Set-Alias' = 'Set-ADUser'
    'Update-Alias' = 'Set-ADUser'
}

# Import Aliases
foreach ($alias in $aliases.Keys) {
    Set-Alias -Name $alias -Value $aliases[$alias]
}

# Variables
$domain = 'yourdomain.com'
$OU = 'OU=Users,DC=yourdomain,DC=com'
$logFile = 'C:\temp\new_members.log'
$emailFrom = 'noreply@yourdomain.com'
$emailTo = 'recipient@yourdomain.com'

write $domain

Write-Host "----------------------------------------"
Write-Host ""
Write-Host "New Members Report"
Write-Host "----------------------------------------"
Write-Host ""

# Get current date and time
$dateTime = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

# Create log file if it doesn't exist
if (!(Test-Path -Path $logFile)) {
    New-Item -ItemType File -Path $logFile -Force
}

# Query Active Directory for new members
Get-ADUser -Filter {Enabled -eq $true -and LastLogonDate -ge (Get-Date).AddDays(-7)} -SearchBase $OU |
    Select-Object Name, GivenName, Surname, Email, LastLogonDate, MemberOf |
    Where-Object { $_.MemberOf -like "*$OU" } |
    Sort-Object LastLogonDate -Descending |
    Export-Csv -Path $logFile -Append
    Write-Host "New members exported to $logFile at $dateTime"
    Send-MailMessage -From $emailFrom -To $emailTo -Subject "New Members Report ($dateTime)" -Body "$(Get-Content $logFile)" -SmtpServer smtp.
    yourdomain.com -Credential (Get-Credential)
    Write-Host "Email notification sent to $emailTo"
    Clear-Content -Path $logFile
    Write-Host "Log file cleared"
    Write-Host "----------------------------------------"
    Write-Host ""
    Write-Host "New members report has been generated and sent to $emailTo"
    Write-Host "----------------------------------------"
    Write-Host ""
    Write-Host "To view the log file, open it in a text editor."
    Write-Host ""
    Write-Host "To update the aliases, open PowerShell as an administrator and run the following commands:"
    Write-Host ""
    foreach ($alias in $aliases.Keys) {
        Write-Host "Set-Alias -Name $alias -Value $aliases[$alias]"
    }
    Write-Host ""
    Write-Host "After updating the aliases, you can use the new commands as you would before."

    # Exit the script
    exit 0

    # If an error occurs, display the error message and exit the script
    Write-Host "An error occurred:"
    Write-Host $_.Exception.Message
    exit 1
    # If the script is interrupted, display a message and exit the script
    Write-Host "Script interrupted"
    exit 2
    # If the script is terminated due to a timeout, display a message and exit the script
    Write-Host "Script timed out"
    exit 3
    # If the script is terminated due to a non-terminating error, display the error message and exit the script
    Write-Host "Non-terminating error occurred"
    exit 4
    # If the script is terminated due to a terminating error, display the error message and exit the script
    Write-Host "Terminating error occurred"
    exit 5
    # If the script is terminated due to a canceled operation, display a message and exit the script
    Write-Host "Canceled operation occurred"
    exit 6
    # If the script is terminated due to a pipeline failure, display the error message and exit the script
    Write-Host "Pipeline failure occurred"
    exit 7
    # If the script is terminated due to a user-requested operation, display a message and exit the script
    Write-Host "User-requested operation occurred"
    exit 8
    # If the script is terminated due to a security issue, display a message and exit the script
    Write-Host "Security issue occurred"
    exit 9
    # If the script is terminated due to a system-level issue, display a message and exit the script
    Write-Host "System-level issue occurred"
    exit 10
    # If the script is terminated due to a network issue, display a message and exit the script
    Write-Host "Network issue occurred"
    exit 11
    # If the script is terminated due to a custom issue, display a message and exit the script
    Write-Host "Custom issue occurred"
    exit 12
    # If the script is terminated due to a general issue, display a message and exit the script
    Write-Host "General issue occurred"
    exit 13
    # If the script is terminated due to a service issue, display a message and exit the script
    Write-Host "Service issue occurred"
    exit 14
    # If the script is terminated due to a license issue, display a message and exit the script
    Write-Host "License issue occurred"
    exit 15
    # If the script is terminated due to a hardware issue, display a message and exit the script
    Write-Host "Hardware issue occurred"
    exit 16
    # If the script is terminated due to a software issue, display a message and exit the script
    Write-Host "Software issue occurred"
    exit 17
    # If the script is terminated due to a backup issue, display a message and exit the script
    Write-Host "Backup issue occurred"
    exit 18
    # If the script is terminated due to a restore issue, display a message and exit the script
    Write-Host "Restore issue occurred"
    exit 19
    # If the script is terminated due to a disk issue, display a message and exit the script
    Write-Host "Disk issue occurred"
    exit 20
    # If the script is terminated due to a power issue, display a message and exit the script
    Write-Host "Power issue occurred"
    exit 21
    # If the script is terminated due to a communication issue, display a message and exit the script
    Write-Host "Communication issue occurred"
    exit 22
    # If the script is terminated due to a data issue, display a message and exit the script
    Write-Host "Data issue occurred"
    exit 23
    # If the script is terminated due to a performance issue, display a message and exit the script
    Write-Host "Performance issue occurred"
    exit 24
    # If the script is terminated due to a security issue, display a message and exit the script
    Write-Host "Security issue occurred"
    exit 25
    # If the script is terminated due to a system-level issue, display a message and exit the script
    Write-Host "System-level issue occurred"
    exit 26
    # If the script is terminated due to a network issue, display a message and exit the script
    Write-Host "Network issue occurred"
    exit 27
    # If the script is terminated due to a custom issue, display a message and exit the script
    Write-Host "Custom issue occurred"
    exit 28
    # If the script is terminated due to a general issue, display a message and exit the script
    Write-Host "General issue occurred"
    exit 29
    # If the script is terminated due to a service issue, display a message and exit the script
    Write-Host "Service issue occurred"
    exit 30
    # If the script is terminated due to a license issue, display a message and exit the script
    Write-Host "License issue occurred"
    exit 31
    # If the script is terminated due to a hardware issue, display a message and exit the script
    Write-Host "Hardware issue occurred"
    exit 32
    # If the script is terminated due to a software issue, display a message and exit the script
    Write-Host "Software issue occurred"
    exit 33
    # If the script is terminated due to a backup issue, display a message and exit the script
    Write-Host "Backup issue occurred"
    exit 34
    # If the script is terminated due to a restore issue, display a message and exit the script
    Write-Host "Restore issue occurred"
    exit 35
    # If the script is terminated due to a disk issue, display a message and exit the script
    Write-Host "Disk issue occurred"
    exit 36
    # If the script is terminated due to a power issue, display a message and exit the script
    Write-Host "Power issue occurred"
    exit 37
    # If the script is terminated due to a communication issue, display a message and exit the script
    Write-Host "Communication issue occurred"
    exit 38
    # If the script is terminated due to a data issue, display a message and exit the script
    Write-Host "Data issue occurred"
    exit 39
    # If the script is terminated due to a performance issue, display a message and exit the script
    Write-Host "Performance issue occurred"
    exit 40
    # If the script is terminated due to a security issue, display a message and exit the script
    Write-Host "Security issue occurred"
    exit 41
    # If the script is terminated due to a system-level issue, display a message and exit the script
    Write-Host "System-level issue occurred"
    exit 42
    # If the script is terminated due to a network issue, display a message and exit the script
    Write-Host "Network issue occurred"
    exit 43
    # If the script is terminated due to a custom issue, display a message and exit the script
    Write-Host "Custom issue occurred"
    exit 44
    # If the script is terminated due to a general issue, display a message and exit the script
    Write-Host "General issue occurred"
    exit 45
    # If the script is terminated due to a service issue, display a message and exit the script
    Write-Host "Service issue occurred"
    exit 46
    # If the script is terminated due to a license issue, display a message and exit the script
    Write-Host "License issue occurred"
    exit 47
    # If the script is terminated due to a hardware issue, display a message and exit the script
    Write-Host "Hardware issue occurred"
    exit 48
    # If the script is terminated due to a software issue, display a message and exit the script
    Write-Host "Software issue occurred"
    exit 49
    # If the script is terminated due to a backup issue, display a message and exit the script
    Write-Host "Backup issue occurred"
    exit 50
    # If the script is terminated due to a restore issue, display a message and exit the script
    Write-Host "Restore issue occurred"
    exit 51
    # If the script is terminated due to a disk issue, display a message and exit the script
    Write-Host "Disk issue occurred"
    exit 52
    # If the script is terminated due to a power issue, display a message and exit the script
    Write-Host "Power issue occurred"
    exit 53
    # If the script is terminated due to a communication issue, display a message and exit the script
    Write-Host "Communication issue occurred"
    exit 54
    # If the script is terminated due to a data issue, display a message and exit the script
    Write-Host "Data issue occurred"
    exit 55
    # If the script is terminated due to a performance issue, display a message and exit the script
    Write-Host "Performance issue occurred"
    exit 56
    # If the script is terminated due to a security issue, display a message and exit the script
    Write-Host "Security issue occurred"
    exit 57
    # If the script is terminated due to a system-level issue, display a message and exit the script
    Write-Host "System-level issue occurred"
    exit 58
    # If the script is terminated due to a network issue, display a message and exit the script
    Write-Host "Network issue occurred"
    exit 59
    # If the script is terminated due to a custom issue, display a message and exit the script
    Write-Host "Custom issue occurred"
    exit 60
 