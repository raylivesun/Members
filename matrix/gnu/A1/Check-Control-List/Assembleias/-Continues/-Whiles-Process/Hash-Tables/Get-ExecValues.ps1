#!/home/admin/app/PowerShell/Members

# Get Exec values from the JSON file
$json = Get-Content 'exec.json' | ConvertFrom-Json

# Create a table with the required columns
$table = New-Object System.Collections.Generic.List[System.Object[]]
$table.Add(@('Exec ID', 'Name', 'Age', 'Email', 'Job Title'))

# Loop through the JSON data and add each record to the table
foreach ($exec in $json) {
    $table.Add(@($exec.ExecID, $exec.Name, $exec.Age, $exec.Email, $exec.JobTitle))
}

# Export the table to a CSV file
$table | Export-Csv -Path 'exec.csv' -NoTypeInformation

# Send email notification with the created CSV file attachment
$smtpServer = 'smtp.example.com'
$smtpPort = 587
$fromEmail = 'noreply@example.com'
$toEmail = 'recipient@example.com'
$subject = 'Executive Summary'
$body = 'Please find the attached executive summary.'

$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = New-Object System.Net.NetworkCredential('username', 'password')

$mailMessage = New-Object System.Net.Mail.MailMessage($fromEmail, $toEmail, $subject, $body)
$mailMessage.Attachments.Add((New-Object System.Net.Mail.Attachment('exec.csv')))

$smtpClient.Send($mailMessage)
