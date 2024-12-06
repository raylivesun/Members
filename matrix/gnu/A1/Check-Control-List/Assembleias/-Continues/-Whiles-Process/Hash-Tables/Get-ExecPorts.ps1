#!/home/admin/app/PowerShell/Members

# Get Exec Port's domain name from the configuration file
$domain = (Get-Content -Path "./domain.txt") -join ""
Write-Output "Domain: $domain"
# Set the SMTP server and port
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
Wait-Debugger "Press any key to continue..."
Write-Debug "Sender email: $senderEmail"
Write-Debug "Recipient email: $recipientEmail"
Write-Debug "SMTP server: $smtpServer"
Write-Debug "SMTP port: $smtpPort"

# Create a new SecureString object with the sender password
$securePassword = ConvertTo-SecureString -String $senderPassword -AsPlainText -Force
Wait-Debugger "Press any key to continue..."
Write-Debug "Secure password: $securePassword"

# Create a new SMTP client object
$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($senderEmail, $securePassword)

# Set the sender email address and password
$senderEmail = "sender@example.com"
$senderPassword = "your-email-password"

# Set the recipient email address
$recipientEmail = "recipient@example.com"


# Create a new email message
$message = New-Object System.Net.Mail.MailMessage($senderEmail, $recipientEmail)
$message.Subject = "Exec Portal Membership Update"
$message.Body = "Dear [Recipient's Name],

Your Exec Portal membership has been updated. You can access the portal at [Exec Portal URL].

Please keep your login credentials confidential and avoid sharing them with anyone.

Best regards,

[Sender's Name]
[Exec Portal Name]"

# Add attachments
$attachmentPath = "path/to/attachment.pdf"
if (Test-Path -Path $attachmentPath) {
    $attachment = New-Object System.Net.Mail.Attachment($attachmentPath)
    $message.Attachments.Add($attachment)
}

# Send the email
try {
    $smtpClient.Send($message)
    Write-Output "Email sent successfully!"
} catch {
    Write-Error "Failed to send email: $_"
}

