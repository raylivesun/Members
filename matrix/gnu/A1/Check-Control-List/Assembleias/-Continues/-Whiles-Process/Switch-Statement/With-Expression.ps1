#!/home/admin/app/PowerShell/Members

# With Expression Language (EL) and the Get-ADUser cmdlet,
# we can retrieve the list of all users in a specific group.
# Replace "Users" with the actual group name.

$groupName = "Users"

$groupMembers = Get-ADGroupMember -Identity $groupName |
                 Select-Object -ExpandProperty Name

# Output the list of group members to a text file
$groupMembers | Out-File -FilePath group_members.txt -Encoding UTF8

# Send the list of group members as an email attachment
# Replace "smtp.example.com" with the SMTP server address,
# "example@example.com" with the sender's email address,
# and "example.com" with the recipient's email address.

$smtpServer = "smtp.example.com"
$senderEmail = "example@example.com"
$recipientEmail = "example.com"

$emailMessage = @"
Subject: Group Membership Report

Here is the list of users in the $groupName group:

$(Get-Content group_members.txt)
"@

Send-MailMessage -SmtpServer $smtpServer -From $senderEmail -To $recipientEmail -Body $emailMessage -Attachments group_members.txt

# Clean up the temporary text file
Remove-Item -Path group_members.txt
