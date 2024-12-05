#!/home/admin/app/PowerShell/Members

# Alians Append New Member to the CSV File (Replace 'Members.csv' with your actual file path)
$csv = Import-Csv 'Members.csv'
$newMember = @{
    'Name' = 'New Member'
    'Email' = 'newmember@example.com'
    'Phone' = '123-456-7890'
    'Status' = 'Active'
}
$csv += $newMember
$csv | Export-Csv 'Members.csv' -NoTypeInformation

# Email Notification to All Members
$members = Get-Content 'Members.csv' | Select-Object -First 1
$subject = 'New Member Alert'
$body = @"
Dear Members,

A new member has joined our organization. Here's their information:

Name: $($members.Name)
Email: $($members.Email)
Phone: $($members.Phone)
Status: $($members.Status)

Please review and update this information as needed.

Best regards,
Your Team
@example.com
"@

foreach ($member in $members) {
    Send-MailMessage -From 'noreply@example.com' -To $member.Email -Subject $subject -Body $body -SmtpServer 'smtp.example.com' -Credential (Get-Credential)
}


# Alert Slack Channel (Replace '#your-slack-channel' with your actual channel name)
$slackToken = 'your-slack-token'
$slackChannel = '#your-slack-channel'
$slackMessage = @"
:wave: New Member Alert:

*Name:* $($members.Name)
*Email:* $($members.Email)
*Phone:* $($members.Phone)
*Status:* $($members.Status)

Please review and update this information as needed.

*Best regards,
Your Team*
@example.com
"@

Invoke-RestMethod -Method POST -Uri "https://slack.com/api/chat.postMessage" -Body @{
    token=$slackToken
    channel=$slackChannel
    text=$slackMessage
}


# Generate CSV Report (Replace 'Members.csv' with your actual file path)
$csv = Import-Csv 'Members.csv'
$csv | Export-Csv 'Members_Report.csv' -NoTypeInformation
