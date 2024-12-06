#!/home/admin/app/PowerShell/Members

# Get Exec items with LastRunTime > 1 day ago
$execItems = Get-WmiObject -Class Win32_Process -Filter "Name='powershell.exe' AND LastRunTime < (Get-Date).AddDays(-1)"

# If there are any Exec items, send an email alert
if ($execItems.Count -gt 0) {
    $mailParams = @{
        SmtpServer   = 'smtp.example.com'
        From         = 'alert@example.com'
        To           = 'admin@example.com'
        Subject      = 'PowerShell Exec Alert'
        Body         = "The following PowerShell processes have been running for more than 24 hours: $($execItems.Name -join ', ')"
    }

    Send-MailMessage @mailParams
}


# Get Exec items with CreationTime > 10 minutes ago
$execItems = Get-WmiObject -Class Win32_Process -Filter "Name='powershell.exe' AND CreationTime < (Get-Date).AddMinutes(-10)"

# If there are any Exec items, send an email alert
if ($execItems.Count -gt 0) {
    $mailParams = @{
        SmtpServer   = 'smtp.example.com'
        From         = 'alert@example.com'
        To           = 'admin@example.com'
        Subject      = 'PowerShell Exec Alert'
        Body         = "The following PowerShell processes have been running for more than 10 minutes: $($execItems.Name -join ', ')"
    }

    Send-MailMessage @mailParams
}

