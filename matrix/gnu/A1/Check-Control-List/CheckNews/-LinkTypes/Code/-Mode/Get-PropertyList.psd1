#!/home/admin/app/PowerShell/Members

# Get Property List from Active Directory and export to CSV
Get-ADUser -Filter {Enabled -eq $true} -Properties Name,Surname,Department,JobTitle,Manager,EmployeeID,EmployeeType | Export-Csv -Path /home/admin/app/PowerShell/Members.csv -NoTypeInformation

# Send email notification with attachment
$smtpServer = "smtp.example.com"
$from = "noreply@example.com"
$to = "recipient@example.com"
$subject = "New Membership Report"
$body = "Dear Team"
$attachmentPath = "/home/admin/app/PowerShell/Members.csv"

$smtpClient = New-Object Net.Mail.SmtpClient($smtpServer)
$mailMessage = New-Object Net.Mail.MailMessage($from, $to, $subject, $body)
$mailMessage.Attachments.Add(($attachmentPath))
$smtpClient.Send($mailMessage)
