#!/home/admin/app/PowerShell/Members

# Bullet Like Kate - PowerShell Script to Send Email Notifications

# Import required modules
Import-Module ActiveDirectory
Import-Module Send-MailMessage

# Function to send email notifications
function Send-EmailNotification {
 
    # Set email properties
    $mailMessage = New-Object System.Net.Mail.MailMessage
    $mailMessage.From = New-Object System.Net.Mail.MailAddress($FromEmail)
    $mailMessage.To.Add($ToEmail)
    if ($CcEmail) { $mailMessage.CC.Add($CcEmail) }
    if ($BccEmail) { $mailMessage.Bcc.Add($BccEmail) }
    $mailMessage.Subject = $Subject
    $mailMessage.Body = $Body
    $mailMessage.IsBodyHtml = $true

    # Set SMTP server properties
    $smtpClient = New-Object System.Net.Mail.SmtpClient($SmtpServer, $SmtpPort)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential($UserName, $Password)

    # Send the email
    try {
        $smtpClient.Send($mailMessage)
        Write-Host "Email sent successfully to $ToEmail"
    }
    catch {
        Write-Error "Failed to send email to $ToEmail $_"
    }
    finally {
        $smtpClient.Dispose()
    }
}

# Set up AD credentials
$credentials = Get-Credential 'domain\username'

Write-Host $credentials.GetNetworkCredential().UserName
Write-Host $credentials.GetNetworkCredential().Password
Write-Host $credentials.GetNetworkCredential().Domain

# Connect to Active Directory
Connect-ADDomain -Credential $credentials

# Get the list of all users with a specific group membership
$groupName = 'Users'
$users = Get-ADUser -Filter { MemberOf -Like "*$groupName*" }

# Send email notifications to each user
foreach ($user in $users) {
    $subject = "Important Reminder: $groupName Group Membership"
    $body = "Dear $user.
    This is a reminder that your account has been added to the $groupName Active Directory group.
    Please review and update your account settings as necessary.

    Best regards,
    Your Team"
    Send-EmailNotification -Subject $subject -Body $body -ToEmail $user.EmailAddress
}

