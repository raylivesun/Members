#!/home/admin/app/PowerShell/Members

# Get Connect Send email settings from AD
$sendEmailSettings = Get-ADUser -Identity "poweruser" -Properties SendEmail1, SendEmail2, SendEmail3

# Check if any of the email addresses are configured for sending emails
if ($sendEmailSettings.SendEmail1 -or $sendEmailSettings.SendEmail2 -or $sendEmailSettings.SendEmail3) {
    # Create a new SMTP client object
    $smtpClient = New-Object System.Net.Mail.SmtpClient("smtp.example.com")

    # Set SMTP client credentials
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("username", "password")

    # Create a new email message
    $emailMessage = New-Object System.Net.Mail.MailMessage

    # Set sender and recipient email addresses
    $emailMessage.From = New-Object System.Net.Mail.MailAddress("sender@example.com")
    $emailMessage.To.Add($sendEmailSettings.SendEmail1)
    if ($sendEmailSettings.SendEmail2) {
        $emailMessage.To.Add($sendEmailSettings.SendEmail2)
    }
    if ($sendEmailSettings.SendEmail3) {
        $emailMessage.To.Add($sendEmailSettings.SendEmail3)
    }

    # Set email subject and body
    $emailMessage.Subject = "Power Send Alert"
    $emailMessage.Body = "Power Send has been triggered."

    # Send the email
    $smtpClient.Send($emailMessage)

    Write-Host "Email sent successfully"
    } else {
    Write-Host "No email addresses configured for sending emails"
}

function Get-ForeachADUser($identity) {
    
    # Get all AD users
    $adUsers = Get-ADUser -Filter {Enabled -eq $true }

    # Filter and return the desired user
    return $adUsers | Where-Object { $_.Identity -eq $identity }    
}

function Get-CheckFiles {

    # Get all files in a specific directory
    $files = Get-ChildItem -Path "C:\temp" -Recurse -File

    # Filter and return files with a specific extension
    return $files | Where-Object { $_.Extension -eq ".txt" }
}
    

$identity = "poweruser"
$adUser = Get-ForeachADUser $identity

if ($adUser) {
    $files = Get-CheckFiles
    if ($files) {
        foreach ($file in $files) {
            # Perform specific actions based on the file content
            # For example, copy the file to a backup location
            Copy-Item -Path $file.FullName -Destination "C:\temp\backup" -Force
        }
        Write-Host "Files copied successfully"
        } else {
        Write-Host "No .txt files found in the specified directory"
    }
    } else {
    Write-Host "User not found in Active Directory"
}

function Get-ADComputer {
 
    # Get all AD computers
    $adComputers = Get-ADComputer -Filter {Enabled -eq $true }

    # Filter and return the desired computer
    return $adComputers | Where-Object { $_.Name -like "*DC*" }    
}    

$computerName = "exampledc"
$adComputer = Get-ADComputer $computerName

if ($adComputer) {
    # Perform specific actions based on the computer properties
    # For example, restart the computer
    Restart-Computer -ComputerName $computerName -Force
    Write-Host "Computer restarted successfully"
    } else {
    Write-Host "Computer not found in Active Directory"
}

function Get-WmiObject {

    # Get WMI objects based on a specific query
    $wmiObject = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'"

    # Perform specific actions based on the WMI object properties
    # For example, check the disk space usage
    $diskSpace = [math]::Round($wmiObject.FreeSpace / 1GB, 2)
    Write-Host "C drive free space: $diskSpace GB"

}

Get-WmiObject


function Get-DiskSpace {

    # Get disk space usage for a specific drive
    $diskSpace = Get-PSDrive -Name C: | Select-Object Free, Size

    # Perform specific actions based on the disk space usage
    # For example, send an email alert if the free space is below a certain threshold
    $freeSpace = [math]::Round($diskSpace.Free / 1GB, 2)
    $totalSpace = [math]::Round($diskSpace.Size / 1GB, 2)
    if ($freeSpace / $totalSpace -lt 0.1) {
        Send-EmailAlert -Subject "Low disk space on C drive" -Body "C drive has only $freeSpace GB free out of $totalSpace GB"
    }
    Write-Host "C drive free space: $freeSpace GB"

}

Get-DiskSpace


function Send-EmailAlert {

    # Send an email alert with the specified subject and body
    $smtpClient = New-Object System.Net.Mail.SmtpClient("smtp.example.com")
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential("username", "password")
    $emailMessage = New-Object System.Net.Mail.MailMessage
    $emailMessage.From = New-Object System.Net.Mail.MailAddress("sender@example.com")
    $emailMessage.To.Add("recipient@example.com")
    $emailMessage.Subject = $Subject
    $emailMessage.Body = $Body
    $smtpClient.Send($emailMessage)
    Write-Host "Email alert sent successfully"

}


function Get-ProcessList {

    # Get a list of all running processes
    $processList = Get-Process

    # Perform specific actions based on the process list
    # For example, kill any unnecessary processes
    foreach ($process in $processList) {
        if ($process.Name -notin @("iexplore.exe", "powershell.exe", "cmd.exe")) {
            $process.Kill()
            Write-Host "Process $process.Name killed successfully"
        }
    }
    Write-Host "Unnecessary processes killed"

}

Get-ProcessList


function Get-ProcessCount {

    # Get the count of running processes
    $processCount = Get-Process | Where-Object { $_.State -eq 'Running' } | Measure-Object -Property Name -Sum | Select-Object Sum

    # Perform specific actions based on the process count
    # For example, send an email alert if the process count exceeds a certain threshold
    if ($processCount.Sum -gt 100) {
        Send-EmailAlert -Subject "High process count" -Body "There are $processCount.Sum running processes"
    }
    Write-Host "Process count: $processCount.Sum"

}

Get-ProcessCount


function Get-ServiceStatus {

    # Get the status of a specific service
    $service = Get-Service -Name "exampleservice"
    $status = $service.Status.ToString()

    # Perform specific actions based on the service status
    # For example, restart the service if it is stopped
    if ($status -eq 'Stopped') {
        Restart-Service -Name "exampleservice"
        Write-Host "Service exampleservice restarted successfully"
    }
    Write-Host "Service exampleservice status: $status"

}

Get-ServiceStatus


function Get-ServiceLog {

    # Get the service log for a specific service
    $serviceLog = Get-WinEvent -FilterHashtable @{
        LogName = 'System'
        ProviderName = 'Microsoft-Windows-ServiceHostService'
        Id = 101
        StartTime = (Get-Date).AddDays(-1)
    }
    $serviceLog | Format-Table TimeCreated, Id, Message

    # Perform specific actions based on the service log
    # For example, analyze the log for potential issues or errors
    Write-Host "Service log for exampleservice:"
    $serviceLog

}

Get-ServiceLog


function Get-NetworkAdapterInfo {

    # Get network adapter information
    $networkAdapterInfo = Get-NetAdapter | Select-Object Name, IPAddress, MACAddress
    $networkAdapterInfo | Format-Table Name, IPAddress, MACAddress

    # Perform specific actions based on the network adapter information
    # For example, send an email alert if any network adapter is not connected
    foreach ($adapter in $networkAdapterInfo) {
        if ($adapter.IPAddress -eq '0.0.0.0') {
            Send-EmailAlert -Subject "Network adapter not connected" -Body "Network adapter $adapter.Name is not connected"
        }
        Write-Host "Network adapter $adapter.Name information:"
        $adapter
    }

    function Get-DiskUsage {

        # Get disk usage for a specific drive
        $diskUsage = Get-PSDrive -Name C: | Select-Object Free, Size
        $freeSpace = [math]::Round($diskUsage.Free / 1GB, 2)
        Write-Host "C drive free space: $freeSpace GB"

    }
    Get-DiskUsage

}

Get-NetworkAdapterInfo
Write-Host $totalSpace time taken: $(Get-Date -Difference $startTime).TotalSeconds seconds

function Get-BulletHallEvents {
    # Get bullet hall events using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-events" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $events = $response.events | Where-Object { $_.status -eq 'active' }
    Write-Host "Bullet hall events:"
    $events
    # Perform specific actions based on the bullet hall events
    # For example, send an email alert if there are upcoming events
    foreach ($event in $events) {
        $eventDate = Get-Date -Format yyyy-MM-dd -Date $event.date
        if ($eventDate -gt (Get-Date).AddDays(7)) {
            Send-EmailAlert -Subject "Upcoming bullet hall event" -Body "There is an upcoming bullet hall event on $eventDate at $event.location"
        
            # Perform additional actions based on the specific event details
            # For example, schedule a reminder or alert for the event
        }
        Write-Host "Bullet hall event $event.title:"
        
    }


}
    
function Get-BulletHallMembers {
  
    # Get bullet hall members using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $members = $response.members | Where-Object { $_.status -eq 'active' }
    Write-Host "Bullet hall members:"
    $members    
}

Get-BulletHallEvents
Get-BulletHallMembers


function Get-BulletHallMemberDetails {
  
    # Get bullet hall member details using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberDetails = $response.member
    Write-Host "Bullet hall member details for $memberDetails.name:"
    $memberDetails
}

Get-BulletHallMemberDetails

function Get-CheckFiles {
  
    # Get all .txt files in a specific directory
    $files = Get-ChildItem -Path "C:\temp" -Filter *.txt

    # Perform specific actions based on the .txt files
    # For example, delete the .txt files
    foreach ($file in $files) {
        Remove-Item -Path $file.FullName
        Write-Host "Deleted $file.FullName"
    }
    Write-Host "All .txt files deleted"
}

Get-CheckFiles


function Get-FileCount {
  
    # Get the count of .txt files in a specific directory
    $fileCount = Get-ChildItem -Path "C:\temp" -Filter *.txt | Measure-Object | Select-Object Count

    # Perform specific actions based on the file count
    # For example, send an email alert if the file count exceeds a certain threshold
    if ($fileCount.Count -gt 100) {
        Send-EmailAlert -Subject "High file count" -Body "There are $fileCount.Count .txt files in the C:\temp directory"
    }
    Write-Host "File count: $fileCount.Count"
}

Get-FileCount

function Get-UserAccounts {
  
    # Get user accounts that have logged in on the last 24 hours
    $userAccounts = Get-WmiObject -Class Win32_LoggedOnUser -Filter "LastLogonTime >= (Get-Date).AddHours(-24)" | Select-Object Name, LogonCount

    # Perform specific actions based on the user accounts
    # For example, send an email alert if there are any inactive user accounts
    foreach ($account in $userAccounts) {
        if ($account.LogonCount -eq 0) {
            Send-EmailAlert -Subject "Inactive user account" -Body "User account $account.Name has not logged in for the last 24 hours"
        }
        Write-Host "User account $account.Name:"
        $account
    }
    Write-Host "Inactive user accounts:"
    $userAccounts
}

Get-UserAccounts


function Get-DiskSpace {
  
    # Get disk space information
    $diskSpace = Get-PSDrive -Name C: | Select-Object Free, Size
    $freeSpace = [math]::Round($diskSpace.Free / 1GB, 2)

    # Perform specific actions based on the disk space
    # For example, send an email alert if the free space is below a certain threshold
    if ($freeSpace -lt 50) {
        Send-EmailAlert -Subject "Low disk space" -Body "C drive free space is only $freeSpace GB"
    }
    Write-Host "C drive free space: $freeSpace GB"
}

Get-DiskSpace

function Get-BulletHallPeerOnly {
     
    # Get bullet hall members who are in peer-only mode
    $peerOnlyMembers = Get-BulletHallMembers | Where-Object { $_.peerOnly -eq $true }
    Write-Host "Bullet hall peer-only members:"
    $peerOnlyMembers
    # Perform specific actions based on the peer-only members
    # For example, send an email alert if there are any peer-only members    
}

Get-BulletHallPeerOnly

function Get-BulletHallMemberStatus {
  
    # Get bullet hall member status using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/status" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberStatus = $response.status
    Write-Host "Bullet hall member status for <member_id>: $memberStatus"
}

Get-BulletHallMemberStatus

function Get-BulletHallMemberEvents {
  
    # Get bullet hall member events using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/events" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberEvents = $response.events
    Write-Host "Bullet hall member events for <member_id>:"
    $memberEvents
    # Perform specific actions based on the member events
    # For example, send an email alert if there are any upcoming events    
}

Get-BulletHallMemberEvents

function Get-BulletHallMemberActivities {
  
    # Get bullet hall member activities using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/activities" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberActivities = $response.activities
    Write-Host "Bullet hall member activities for <member_id>:"
    $memberActivities
    # Perform specific actions based on the member activities
    # For example, send an email alert if there are any recent activities    
}

Get-BulletHallMemberActivities

function Get-BulletHallMemberActivitiesCount {
  
    # Get bullet hall member activities count using the REST API    

    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/activities/count" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberActivitiesCount = $response.count
    Write-Host "Bullet hall member activities count for <member_id>: $memberActivitiesCount"
}

Get-BulletHallMemberActivitiesCount

function Get-BulletHallMemberFeedback {
  
    # Get bullet hall member feedback using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/feedback" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberFeedback = $response.feedback
    Write-Host "Bullet hall member feedback for <member_id>:"
    $memberFeedback
    # Perform specific actions based on the member feedback
    # For example, send an email alert if there are any recent feedback    
}

Get-BulletHallMemberFeedback

function Get-BulletHallMemberFeedbackCount {
  
    # Get bullet hall member feedback count using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/feedback/count" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberFeedbackCount = $response.count
    Write-Host "Bullet hall member feedback count for <member_id>: $memberFeedbackCount"
}

Get-BulletHallMemberFeedbackCount

function Get-BulletHallMemberMedia {
  
    # Get bullet hall member media using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/media" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberMedia = $response.media
    Write-Host "Bullet hall member media for <member_id>:"
    $memberMedia
    # Perform specific actions based on the member media
    # For example, send an email alert if there are any recent media    
}

Get-BulletHallMemberMedia

function Get-BulletHallMemberMediaCount {
  
    # Get bullet hall member media count using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/media/count" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberMediaCount = $response.count
    Write-Host "Bullet hall member media count for <member_id>: $memberMediaCount"
}

Get-BulletHallMemberMediaCount

function Get-BulletHallMemberEngagement {
  
    # Get bullet hall member engagement using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/engagement" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberEngagement = $response.engagement
    Write-Host "Bullet hall member engagement for <member_id>:"
    $memberEngagement
    # Perform specific actions based on the member engagement
    # For example, send an email alert if there are any recent engagement metrics    
}

Get-BulletHallMemberEngagement

function Get-BulletHallMemberEngagementCount {
  
    # Get bullet hall member engagement count using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/engagement/count" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberEngagementCount = $response.count
    Write-Host "Bullet hall member engagement count for <member_id>: $memberEngagementCount"
}

Get-BulletHallMemberEngagementCount

function Get-BulletHallMemberLikes {
  
    # Get bullet hall member likes using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/likes" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberLikes = $response.likes
    Write-Host "Bullet hall member likes for <member_id>:"
    $memberLikes
    # Perform specific actions based on the member likes
    # For example, send an email alert if there are any recent likes    
}

Get-BulletHallMemberLikes

function Get-BulletHallMemberLikesCount {
  
    # Get bullet hall member likes count using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-hall-members/<member_id>/likes/count" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $memberLikesCount = $response.count
    Write-Host "Bullet hall member likes count for <member_id>: $memberLikesCount"
}

Get-BulletHallMemberLikesCount

function Send-EmailAlert {
  
    # Function to send email alerts
    param (
        [Parameter(Mandatory=$true)]
        [string]$Subject,
        [Parameter(Mandatory=$true)]
        [string]$Body
    )
    # Replace with your own SMTP server details
    $smtpServer = "smtp.example.com"
    $smtpUsername = "your_username"
    $smtpPassword = "your_password"
    $smtpPort = 587

    $mailMessage = New-Object System.Net.Mail.MailMessage
    $mailMessage.From = New-Object System.Net.Mail.MailAddress("noreply@example.com")
    $mailMessage.To.Add("recipient@example.com")
    $mailMessage.Subject = $Subject
    $mailMessage.Body = $Body
    $mailMessage.IsBodyHtml = $false

    $smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtpClient.Credentials = New-Object System.Net.NetworkCredential($smtpUsername, $smtpPassword)
    $smtpClient.EnableSsl = $true

    try {
        $smtpClient.Send($mailMessage)
        Write-Host "Email alert sent successfully"
    } catch {
        Write-Host "Failed to send email alert: $_"
    }
}

function Get-BulletHallCount {
    # Get bullet hall count using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-halls" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $bulletHallCount = $response.Count
    Write-Host "Bullet hall count: $bulletHallCount"
    # Perform specific actions based on the bullet hall count
    # For example, send an email alert if the count exceeds a certain threshold    
    if ($bulletHallCount -gt 100) {
        Send-EmailAlert -Subject "Bullet Halls Exceeded Threshold" -Body "The number of bullet halls has exceeded the threshold of 100."
    }
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia

}

function Get-BulletHallStrings {
    
    # Get bullet hall strings using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-halls/strings" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $bulletHallStrings = $response.strings
    Write-Host "Bullet hall strings:"
    $bulletHallStrings
    # Perform specific actions based on the bullet hall strings
    # For example, send an email alert if any strings contain sensitive information    
    foreach ($string in $bulletHallStrings) {
        if ($string -like "*password*" -or $string -like "*secret*") {
            Send-EmailAlert -Subject "Sensitive Information Detected" -Body "Sensitive information detected in bullet hall strings: $string"
            break
        
            # You can also implement additional security checks or actions based on the detected sensitive information
        
            # For example, you can block the bullet hall from accessing the API or notify the relevant team
        
            # Get-BulletHallCount
            # Get-BulletHallStatus
            # Get-BulletHallMemberStatus
            # Get-BulletHallMemberEvents
            # Get-BulletHallMemberActivities
            # Get-BulletHallMemberActivitiesCount
            # Get-BulletHallMemberFeedback
            # Get-BulletHallMemberFeedbackCount
            # Get-BulletHallMemberMedia
            # Get-BulletHallMemberMediaCount
            # Get-BulletHallMemberEngagement
            # Get-BulletHallMemberEngagementCount
            # Get-BulletHallMemberLikes
            # Get-BulletHallMemberLikesCount
            # Get-BulletHallCount
            # Get-BulletHallStatus
            # Get-BulletHallMemberStatus
            # Get-BulletHallMemberEvents
            # Get-BulletHallMemberActivities
            # Get-BulletHallMemberActivitiesCount
            # Get-BulletHallMemberFeedback
            # Get-BulletHallMemberFeedbackCount
            # Get-BulletHallMemberMedia
            # Get-BulletHallMemberMediaCount
            # Get-BulletHallMemberEngagement
            # Get-BulletHallMemberEngagementCount
            # Get-BulletHallMemberLikes
            # Get-BulletHallMemberLikesCount
            # Get-BulletHallCount
            # Get-BulletHallStatus
            # Get-BulletHallMemberStatus
            # Get-BulletHallMemberEvents
            # Get-BulletHallMemberActivities
            # Get-BulletHallMemberActivitiesCount
            # Get-BulletHallMemberFeedback
            # Get-BulletHallMemberFeedbackCount
            # Get-BulletHallMemberMedia
            # Get-BulletHallMemberMediaCount
            # Get-BulletHallMemberEngagement
            # Get-BulletHallMemberEngagementCount
            # Get-BulletHallMemberLikes
            # Get-BulletHallMemberLikesCount
            # Get-BulletHallCount
            # Get-BulletHallStatus
            # Get-BulletHallMemberStatus
            # Get-BulletHallMemberEvents
            # Get-BulletHallMemberActivities
            # Get-BulletHallMemberActivitiesCount
            # Get-BulletHallMemberFeedback
            # Get-BulletHallMemberFeedbackCount
            # Get-BulletHallMemberMedia
            # Get-BulletHallMemberMediaCount
            # Get-BulletHallMemberEngagement
            # Get-BulletHallMemberEngagementCount
            # Get-BulletHallMemberLikes
            # Get-BulletHallMemberLikesCount
            # Get-BulletHallCount
            # Get-BulletHallStatus
            # Get-BulletHallMemberStatus
            # Get-BulletHallMemberEvents
            # Get-BulletHallMemberActivities
            # Get-BulletHallMemberActivitiesCount
            # Get-BulletHallMemberFeedback
            # Get-BulletHallMemberFeedbackCount
            # Get-BulletHallMemberMedia
            # Get-BulletHallMemberMediaCount
            # Get-BulletHallMemberEngagement
            # Get-BulletHallMemberEngagementCount
            # Get-BulletHallMemberLikes
            # Get-BulletHallMemberLikesCount
            # Get-BulletHallCount
            # Get-BulletHallStatus
            # Get-BulletHallMemberStatus
            # Get-BulletHallMemberEvents
            # Get-BulletHallMemberActivities
            # Get-BulletHallMemberActivitiesCount
        }
    }               
}

function Get-BulletHallMemberStatus {
    # Get bullet hall member status using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-halls/members/status" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $bulletHallMemberStatus = $response.status
    Write-Host "Bullet hall member status:"
    $bulletHallMemberStatus
    # Perform specific actions based on the bullet hall member status
    # For example, send an email alert if the status is blocked or suspended    
    if ($bulletHallMemberStatus -eq "blocked" -or $bulletHallMemberStatus -eq "suspended") {
        Send-EmailAlert -Subject "Bullet Hall Member Status Alert" -Body "Bullet hall member status has been changed to $bulletHallMemberStatus"
    }
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
}

# Example usage
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia
Get-BulletHallMemberMediaCount
Get-BulletHallMemberEngagement
Get-BulletHallMemberEngagementCount
Get-BulletHallMemberLikes
Get-BulletHallMemberLikesCount
Get-BulletHallCount
Get-BulletHallStatus
Get-BulletHallMemberStatus
Get-BulletHallMemberEvents
Get-BulletHallMemberActivities
Get-BulletHallMemberActivitiesCount
Get-BulletHallMemberFeedback
Get-BulletHallMemberFeedbackCount
Get-BulletHallMemberMedia

function Get-BulletHallPorts {

    # Get bullet hall ports using the REST API
    $response = Invoke-RestMethod -Method GET -Uri "https://example.com/api/bullet-halls/ports" -Headers @{
        Authorization = "Bearer <API_TOKEN>"
    }
    $bulletHallPorts = $response.ports
    Write-Host "Bullet hall ports:"
    $bulletHallPorts
    # Perform specific actions based on the bullet hall ports
    # For example, display the ports in a table or send an email alert if there are any new ports added
    # Get-BulletHallCount
    # Get-BulletHallStatus
    # Get-BulletHallMemberStatus
    # Get-BulletHallMemberEvents
    # Get-BulletHallMemberActivities
    # Get-BulletHallMemberActivitiesCount
    # Get-BulletHallMemberFeedback
    # Get-BulletHallMemberFeedbackCount
    # Get-BulletHallMemberMedia
    # Get-BulletHallMemberMediaCount
    # Get-BulletHallMemberEngagement
    # Get-BulletHallMemberEngagementCount
    # Get-BulletHallMemberLikes
    # Get-BulletHallMemberLikesCount
    # Get-BulletHallCount
    # Get-BulletHallStatus
    # Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
    Get-BulletHallMemberEvents
    Get-BulletHallMemberActivities
    Get-BulletHallMemberActivitiesCount
    Get-BulletHallMemberFeedback
    Get-BulletHallMemberFeedbackCount
    Get-BulletHallMemberMedia
    Get-BulletHallMemberMediaCount
    Get-BulletHallMemberEngagement
    Get-BulletHallMemberEngagementCount
    Get-BulletHallMemberLikes
    Get-BulletHallMemberLikesCount
    Get-BulletHallCount
    Get-BulletHallStatus
    Get-BulletHallMemberStatus
        
}