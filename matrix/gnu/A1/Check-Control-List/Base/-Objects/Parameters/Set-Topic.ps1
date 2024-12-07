#!/home/admin/app/PowerShell/Memebers

# Set topic for Slack notifications (e.g., "#general", "#dev-ops")
$slackTopic = "#general"

# Set Slack webhook URL
$slackWebhookUrl = "https://hooks.slack.com/services/your/slack/webhook/url"

# Set email address to monitor
$emailAddress = "your@example.com"

# Set password for email account
$emailPassword = "your_email_password"

# Set subject line for emails
$emailSubject = "Important Email Alert"

# Set body text for emails
$emailBody = @"
Dear Team,

I noticed that an important email has been sent to the following address: $emailAddress

Please review the attached document and let me know if you need any further assistance.

Best regards,
John Doe
"@

# Send email notification
Send-MailMessage -SmtpServer "smtp.example.com" -From "Important Email Alert@example.com" -To $emailAddress -Subject $emailSubject -Body $emailBody -Credential (New-Object System.Management.Automation.PSCredential($emailAddress,
                      (ConvertTo-SecureString -AsPlainText $emailPassword -Force -ForceType SecureString)))
                      -EnableSsl
                      -UseSsl
                      -Port 587
                      -TimeoutSec 30
                      -ErrorAction SilentlyContinue
                      -DeliveryNotificationOption OnSuccess
                      -BodyAsHtml
                      -Attachments "path/to/your/document.pdf"
                      -WebhookUrl $slackWebhookUrl -CustomMessage "Important Email Alert: $emailAddress"
                      -CustomFields @{topic=$slackTopic}
                      -SlackMessageFormat "markdown"
                      -SlackUsername "Important Email Alert"
                      -SlackIconEmoji ":email:"
                      -SlackChannel "#general"
                      -SlackAsUser true
                      -SlackMarkdown true
                      -SlackAttachments @{color="#36a64f"; text="Important Email Alert: $emailAddress"}
                      -SlackFields @{title="Subject"; value="$emailSubject"}
                      -SlackFields @{title="From"; value="$emailAddress"}
                      -SlackFields @{title="Date"; value="$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')}"}
                      -SlackFields @{title="Attachment"; value="document.pdf"}
                      -SlackFields @{title="Message"; value="$emailBody"}
                      -SlackFields @{title="Action"; value="Review document"}
                      -SlackFields @{title="Time"; value="$(Get-Date -Format 'HH:mm:ss')}"}
                      -SlackFields @{title="Status"; value="Pending"}
                      -SlackFields @{title="Category"; value="Email"}
                      -SlackFields @{title="Priority"; value="High"}
                      -SlackFields @{title="Assigned To"; value="John Doe"}
                      -SlackFields @{title="Due Date"; value="$(Get-Date -Format 'yyyy-MM-dd')}"}
                      -SlackFields @{title="Created By"; value="Jane Smith"}
                      -SlackFields @{title="Last Modified"; value="$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')}"}
                      -SlackFields @{title="Last Modified By"; value="Jane Smith"}
                      -SlackFields @{title="Comments"; value="No comments yet"}
                      -SlackFields @{title="Document"; value="document.pdf"}
                      -SlackFields @{title="Size"; value="10.5 MB"}
                      -SlackFields @{title="Type"; value="PDF"}
                      -SlackFields @{title="Keywords"; value="important, urgent"}
                      -SlackFields @{title="Version"; value="1.0"}
                      -SlackFields @{title="Status"; value="Pending"}
                      -SlackFields @{title="Category"; value="Email"}
                      -SlackFields @{title="Priority"; value="High"}
                      -SlackFields @{title="Assigned To"; value="John Doe"}
                      -SlackFields @{title="Due Date"; value="$(Get-Date -Format 'yyyy-MM-dd')}"}
                      -SlackFields @{title="Created By"; value="Jane Smith"}
                      -SlackFields @{title="Last Modified"; value="$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')}"}
                      -SlackFields @{title="Last Modified By"; value="Jane Smith"}
                      -SlackFields @{title="Comments"; value="No comments yet"}
                      -SlackFields @{title="Document"; value="document.pdf"}
                      -SlackFields @{title="Size"; value="10.5 MB"}
                      -SlackFields @{title="Type"; value="PDF"}
                      -SlackFields @{title="Keywords"; value="important, urgent"}
                      -SlackFields @{title="Version"; value="1.0"}
                      -SlackFields @{title="Status"; value="Pending"}
                      -SlackFields @{title="Category"; value="Email"}
                      -SlackFields @{title="Priority"; value="High"}
                      -SlackFields @{title="Assigned To"; value="John Doe"}
                      -SlackFields @{title="Due Date"; value="$(Get-Date -Format 'yyyy-MM-dd')}"}
                      -SlackFields @{title="Created By"; value="Jane Smith"}
                      -SlackFields @{title="Last Modified"; value="$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')}"}
                      -SlackFields @{title="Last Modified By"; value="Jane Smith"}
                      -SlackFields @{title="Comments"; value="No comments yet"}
                      -SlackFields @{title="Document"; value="document.pdf"}
                      -SlackFields @{title="Size"; value="10.5 MB"}
                      -SlackFields @{title="Type"; value="PDF"}
                      -SlackFields @{title="Keywords"; value="important, urgent"}
                      -SlackFields @{title="Version"; value="1.0"}
                      -SlackFields @{title="Status"; value="Pending"}
                      -SlackFields @{title="Category"; value="Email"}
                      -SlackFields @{title="Priority"; value="High"}
                      -SlackFields @{title="Assigned To"; value="John Doe"}
                      -SlackFields @{title="Due Date"; value="$(Get-Date -Format 'yyyy-MM-dd')}"}
                      -SlackFields @{title="Created By"; value="Jane Smith"}
                      -SlackFields @{title="Last Modified"; value="$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')}"}
                      -SlackFields @{title="Last Modified By"; value="Jane Smith"}
                      -SlackFields @{title="Comments"; value="No comments yet"}
                      -SlackFields @{title="Document"; value="document.pdf"}
                      -SlackFields @{title="Size"; value="10.5 MB"}
                      -SlackFields @{title="Type"; value="PDF"}
                      -SlackFields @{title="Keywords"; value="important, urgent"}
                      -SlackFields @{title="Version"; value="1.0"}
                      -SlackFields @{title="Status"; value="Pending"}
                      -SlackFields @{title="Category"; value="Email"}
                      -SlackFields @{title="Priority"; value="High"}
                      -SlackFields @{title="Assigned To"; value="John Doe"}
                      -SlackFields @{title="Due Date"; value="$(Get-Date -Format 'yyyy-MM-dd')}"}
                      


                      