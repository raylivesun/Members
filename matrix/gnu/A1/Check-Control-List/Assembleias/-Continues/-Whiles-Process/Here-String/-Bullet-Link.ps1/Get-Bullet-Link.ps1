#!/home/admin/app/PowerShell/Members

# Get Bullet Link for the current page and redirect to it
$bulletLink = (Get-Content -Path "bullet_link.txt")
Start-Process -FilePath "https://www.example.com" -Target "_blank" -Wait -PassThru

# Open the Bullet Link in a new PowerShell window
Start-Process -FilePath "powershell.exe" -Verb runas -Wait -NoNewWindow -Command "Start-Process -FilePath 'https://www.example.com' -Verb runas -Wait -NoNewWindow"


# Get the current date and time
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Create a new text file with the current date and time
$filePath = Join-Path -Path (Get-Location) -ChildPath "log.txt"
New-Item -ItemType File -Path $filePath -Value "$dateTime Opened Bullet Link and opened in new PowerShell window." -Force

# Email the log file to a specified recipient
$smtpServer = "smtp.example.com"
$smtpPort = 587
$fromAddress = "admin@example.com"
$toAddress = "recipient@example.com"
$subject = "Bullet Link Log"
$body = "$(Get-Content -Path $filePath)"

Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body

# Delete the log file
Remove-Item -Path $filePath

# Print a success message
Write-Host "Bullet Link opened and logged successfully. $bulletLink"

