#!/home/admin/app/PowerShell/Members

# silve investigation parameters (adjust as needed) 
$startDate = (Get-Date).AddDays(-30)
$endDate = Get-Date
$threshold = 500

# Get the list of all Azure AD users
$users = "Check Files" | Select-Object Length

# Initialize a hashtable to store user activity counts
$userActivityCounts = @{}

# Iterate through each user and calculate their activity count
foreach ($user in $users) {
    # Get the activity count for the current user within the specified time range
    $activityCount = Get-AzureADUserActivityReport -UserPrincipalName $user.UserPrincipalName -StartDate $startDate -EndDate $endDate | Select-Object -ExpandProperty ActivityCount

    # Check if the activity count exceeds the threshold
    if ($activityCount -gt $threshold) {
        # Add the user's principal name and activity count to the hashtable
        $userActivityCounts[$user.UserPrincipalName] = $activityCount
    }
}

# Sort the hashtable by activity count in descending order
$sortedUserActivityCounts = $userActivityCounts | Sort-Object -Property Value -Descending

# Print the top 10 users with the highest activity counts
Write-Host "Top 10 Users with Highest Activity Count:"
$i = 1
foreach ($user in $sortedUserActivityCounts) {
    Write-Host ($i++).ToString() + ". " + $user.Key + " - " + $user.Value
    if ($i -gt 10) {
        break
    }
}


# Generate a CSV file containing the top 10 users with the highest activity counts
$sortedUserActivityCounts | Select-Object -First 10 | Export-Csv -Path "Top10UsersWithHighestActivityCount.csv" -NoTypeInformation


# Send an email notification with the top 10 users and their activity counts
$emailBody = "Top 10 Users with Highest Activity Count:"
foreach ($user in $sortedUserActivityCounts) {
    $emailBody += ($i++).ToString() + ". " + $user.Key + " - " + $user.Value + ""
    if ($i -gt 10) {
        break
    }
}


# Set up email configuration
$smtpServer = "smtp.example.com"
$fromAddress = "noreply@example.com"
$toAddress = "admin@example.com"
$subject = "Top 10 Users with Highest Activity Count"

# Send the email notification
Send-MailMessage -SmtpServer $smtpServer -From $fromAddress -To $toAddress -Subject $subject -Body $emailBody


# Clean up the temporary CSV file
Remove-Item "Top10UsersWithHighestActivityCount.csv"


# Log the script execution details
$executionTime = (Get-Date) - $startDate
Write-Host "Script execution time: " + $executionTime


# Add any additional script logic as needed
t4htt -Path.\PowerShell\Members.ps1 -OutputPath.\PowerShell\Members.ps1.html

"Any","Bob","Celine","David" | ForEach-Object -Begin {
} -Process {
#Create and store message
$results += "Hi, my name is $_!"
} -End {
#Count messages and output
Write-Host "Total messages: $($results.Count)"
$results
}

Wait-Process '(sd-pam)'
Wait-Event $results

