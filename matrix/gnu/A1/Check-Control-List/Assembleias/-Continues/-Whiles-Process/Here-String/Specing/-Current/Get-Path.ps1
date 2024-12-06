#!/home/admin/app/PowerShell/Members

# Get Path Update Configuration Parameters from Configuration File
$updateConfigPath = "path/to/update/config.txt"
$updateConfig = Get-Content $updateConfigPath | ConvertFrom-Csv

# Get Server Information
$serverName = $updateConfig.Server
$serverIP = $updateConfig.ServerIP
$serverUsername = $updateConfig.ServerUsername
$serverPassword = $updateConfig.ServerPassword

# Connect to Server
$serverConnection = New-Object System.Management.Automation.PSConnectionInfo (
    Server           = $serverIP,
    Credential      = New-Object System.Management.Automation.PSCredential($serverUsername, $serverPassword),
    Authentication = "Basic"
)
$serverSession = New-PSSession -ConnectionInfo $serverConnection

# Get Server Version
$serverVersion = Invoke-Command -Session $serverSession -ScriptBlock {
    $serverVersion = Get-WmiObject -Class Win32_OperatingSystem | Select-Object Version
    $serverVersion.Version
}

# Check if Server Version is Outdated
$outdatedVersion = $updateConfig.OutdatedVersion
if ($serverVersion -ge $outdatedVersion) {
    Write-Host "Server version is up to date."
    exit 0
}

# Download Update Files
$updateFiles = $updateConfig.UpdateFiles
foreach ($file in $updateFiles) {
    $localFilePath = "path/to/local/$file"
    if (!(Test-Path $localFilePath)) {
        $remoteFilePath = "/path/to/remote/$file"
        Write-Host "Downloading $file..."
        Invoke-Command -Session $serverSession -ScriptBlock {
            (New-Object System.Net.WebClient).DownloadFile($remoteFilePath, $using:localFilePath)
        }
        Write-Host "Download complete."
        Write-Host ""
    }
    else {
        Write-Host "$file already exists locally."
        Write-Host ""
    }
}

# Apply Updates
$updateScripts = $updateConfig.UpdateScripts
foreach ($script in $updateScripts) {
    $localScriptPath = "path/to/local/$script"
    if (!(Test-Path $localScriptPath)) {
        Write-Host "Applying $script..."
        Invoke-Command -Session $serverSession -FilePath $localScriptPath
        Write-Host "Update applied successfully."
        Write-Host ""
    }
    else {
        Write-Host "$script already exists locally."
        Write-Host ""
    }
}

# Restart Server
Write-Host "Restarting server..."
Invoke-Command -Session $serverSession -ScriptBlock { Restart-Service -Name "service_name" }
Write-Host "Server restarted successfully."
Write-Host ""

# Disconnect from Server
Remove-PSSession -Session $serverSession


# Update Configuration File
$updateConfig.LastUpdated = Get-Date
Set-Content -Path $updateConfigPath -Value ($updateConfig | ConvertTo-Csv -NoTypeInformation)


# Log Update Process
$logPath = "path/to/update.log"
$logEntry = "$(Get-Date): Server version updated to $($serverVersion), updates applied successfully."
Add-Content -Path $logPath -Value $logEntry


# Send Email Notification
$emailTo = "recipient@example.com"
$emailSubject = "Server Version Update Notification"
$emailBody = "The server version has been updated to $($serverVersion). Updates applied successfully."

$smtpServer = "smtp.example.com"
$smtpUsername = "username"
$smtpPassword = "password"
$smtpPort = 587

$smtpMessage = New-Object Net.Mail.MailMessage
$smtpMessage.From = New-Object Net.Mail.MailAddress("sender@example.com")
$smtpMessage.To.Add($emailTo)
$smtpMessage.Subject = $emailSubject
$smtpMessage.Body = $emailBody

$smtpClient = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($smtpUsername, $smtpPassword)
$smtpClient.Send($smtpMessage)


Write-Host "Update process completed successfully."
Write-Host "$serverName has been notified about the update process."
