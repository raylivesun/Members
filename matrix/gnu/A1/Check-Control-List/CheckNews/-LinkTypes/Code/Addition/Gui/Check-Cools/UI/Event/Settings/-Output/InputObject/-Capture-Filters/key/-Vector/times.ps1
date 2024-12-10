#!/home/admin/app/PowerShell/Members

# Select times from the last 7 days (excluding today)
$startTime = (Get-Date).AddDays(-7)
$endTime = Get-Date

# Query Active Directory for all user accounts that have logged in within the last 7 days
$activeDirectoryUsers = Get-ADUser -Filter {
    LastLogonDate -ge $startTime -and LastLogonDate -le $endTime -and Enabled -eq $true
}

# Create an array to store the user details
$userDetails = @()

foreach ($user in $activeDirectoryUsers) {
    # Get the user's last name, first name, and email address
    $lastName = $user.Surname
    $firstName = $user.GivenName
    $email = $user.EmailAddress

    # Get the user's last login date and time
    $lastLoginDate = $user.LastLogonDate
    $lastLoginTime = $user.LastLogon.ToShortTimeString()

    # Get the number of days since the user's last login
    $daysSinceLastLogin = (Get-Date).Subtract($lastLoginDate).Days

    # Add the user's details to the array
    $userDetails += @{
        LastName = $lastName
        FirstName = $firstName
        Email = $email
        LastLoginDate = $lastLoginDate.ToShortDateString()
        LastLoginTime = $lastLoginTime
        DaysSinceLastLogin = $daysSinceLastLogin
    }
    # Sort the array by the number of days since last login in descending order
    $userDetails = $userDetails | Sort-Object -Property DaysSinceLastLogin -Descending
}

# Export the user details to a CSV file named "active_directory_user_activity.csv"
$userDetails | Export-Csv -Path "active_directory_user_activity.csv" -NoTypeInformation

# Send an email notification to the administrators with the exported CSV file attached
$emailParams = @{
    SmtpServer = "smtp.example.com"
    From = "admin@example.com"
    To = "admin@example.com"
    Subject = "Active Directory User Activity Report"
    Body = "Please find the attached CSV file containing the user activity report."
    Attachments = "active_directory_user_activity.csv"
}
Send-MailMessage @emailParams
