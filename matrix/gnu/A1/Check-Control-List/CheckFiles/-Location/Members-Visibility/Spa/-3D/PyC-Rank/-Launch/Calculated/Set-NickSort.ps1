#!/home/admin/app/PowerShell/Members

# Get Sort Nick Name and User ID from CSV
$csvData = Import-Csv -Path /home/admin/app/PowerShell/members.csv | Select-Object Sort_Nick_Name, User_ID

# Create a hash table to store the results
$results = @{}

# Loop through each row in the CSV data
foreach ($row in $csvData) {
    # Get the Sort Nick Name and User ID from the current row
    $sortNickName = $row.Sort_Nick_Name
    $userID = $row.User_ID

    # Check if the Sort Nick Name already exists in the hash table
    if ($results.ContainsKey($sortNickName)) {
        # If it does, append the User ID to the existing list of User IDs
        $results[$sortNickName] += $userID
        continue
    }

    # If the Sort Nick Name does not exist, create a new entry in the hash table with an empty list of User IDs
    $results[$sortNickName] = @($userID)
}

# Export the results to a JSON file
$results | ConvertTo-Json -Depth 1 | Out-File /home/admin/app/PowerShell/results.json

# Print the results to the console
Write-Host "Results exported to /home/admin/app/PowerShell/results.json"

# Send an email notification with the results
$smtpServer = "your-smtp-server.com"
$smtpUsername = "your-smtp-username@example.com"
$smtpPassword = "your-smtp-password"
$fromEmail = "your-email@example.com"
$toEmail = "recipient-email@example.com"
$subject = "PowerShell Results"
$body = @"
Results exported to /home/admin/app/PowerShell/results.json

Sort Nick Name: $sortNickName
User IDs: $($results[$sortNickName])
"@
$MaximumHistoryCount = 10   
Write-Debug $smtpServer
Write-Debug $smtpUsername
Write-Debug $smtpPassword
Write-Debug $fromEmail
Write-Debug $toEmail
Write-Debug $subject
Write-Debug $body

$mailMessage = New-Object System.Net.Mail.MailMessage($fromEmail, $toEmail, $subject, $body)
Write-Debug $mailMessage
$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer)
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($smtpUsername, $smtpPassword)
$smtpClient.Send($mailMessage)
Write-Host "Email notification sent to $toEmail"

