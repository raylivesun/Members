#!/home/admin/app/PowerShell/Members

# Get Full Server Name and Domain locally (Replace with your actual server name and domain)
$serverName = 'localhost'
$domain = 'yourdomain.com'

# Get the list of all Active Directory users
$adUsers = Get-ADUser -Filter {Enabled -eq $true } -Properties * | Select-Object Name, SamAccountName, GivenName, Surname, Department, Email, LastLogonDate, LastLogoffDate, AccountExpirationDate

# Export the Active Directory users to a CSV file
$adUsers | Export-Csv -Path "C:\temp\ADUsers.csv" -NoTypeInformation

# Send the CSV file to a specific email address
$smtpServer = 'smtp.yourdomain.com'
$fromAddress = 'noreply@yourdomain.com'
$toAddress = 'your-email@yourdomain.com'
$subject = 'AD Users Report'
$body = "Please find the attached CSV file containing all Active Directory users."

$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer)
$mailMessage = New-Object System.Net.Mail.MailMessage($fromAddress, $toAddress, $subject, $body)
$attachment = New-Object System.Net.Mail.Attachment("C:\temp\ADUsers.csv")
$mailMessage.Attachments.Add($attachment)

$smtpClient.Send($mailMessage)

# Delete the CSV file after sending the email
Remove-Item "C:\temp\ADUsers.csv" -Force

Write-Host "AD Users Report has been sent to $toAddress"
Write-Host "CSV file has been deleted"
Wait-Job -Id $smtpClient.SendAsync($mailMessage).JobID
Write-Host $serverName
Write-Host $domain
