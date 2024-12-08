#!/home/admin/app/PowerShell/Members

# Get Spa rank with the Get-Spa cmdlet and store it in a variable
$spaRank = Get-Spa -Identity 'your_spa_identity' -Property Rank

# Get the current date and time
$currentDateTime = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

# Check if the Spa rank is higher than 50
if ($spaRank -gt 50) {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'High Spa Rank Alert'
    $body = "High Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is lower than 50
if ($spaRank -lt 50) {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Low Spa Rank Alert'
    $body = "Low Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is equal to 50
if ($spaRank -eq 50) {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Mid-Range Spa Rank Alert'
    $body = "Mid-Range Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is not a number
if ($spaRank -is [System.Management.Automation.PSCustomObject]) {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Invalid Spa Rank Alert'
    $body = "Invalid Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is not a positive integer
if ($spaRank -isnot [int] -or $spaRank -lt 1) {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Invalid Spa Rank Alert'
    $body = "Invalid Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is not a string
if ($spaRank -isnot [string]) {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Invalid Spa Rank Alert'
    $body = "Invalid Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is not a valid Spa identity
if ($spaRank -notmatch '^[a-zA-Z0-9]+$') {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Invalid Spa Rank Alert'
    $body = "Invalid Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


# Check if the Spa rank is not a valid Spa identity
if ($spaRank -notmatch '^[a-zA-Z0-9]+$') {
    # Send an email notification to the administrator
    $smtpServer = 'your_smtp_server'
    $smtpPort = 587
    $fromAddress = 'your_from_address'
    $toAddress = 'your_to_address'
    $subject = 'Invalid Spa Rank Alert'
    $body = "Invalid Spa Rank Alert: $spaRank at $currentDateTime"

    Send-MailMessage -SmtpServer $smtpServer -Port $smtpPort -From $fromAddress -To $toAddress -Subject $subject -Body $body
}


