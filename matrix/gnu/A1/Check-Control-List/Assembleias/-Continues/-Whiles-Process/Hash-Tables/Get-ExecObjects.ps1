#!/home/Admin/app/PowerShell/Members

# Get Exec examiners for the specified role (ex: "Developer") ObjectId
$execExaminers = Get-ADUser -Filter {Enabled -eq $true -and MemberOf -like "*CN=Executive,OU=Roles,DC=domain,DC=com*" -and Department -like "*$env:RoleName*" }

# Get the list of Exec examiners' email addresses
$execExaminersEmailAddresses = $execExaminers | Select-Object -ExpandProperty Mail
Write-Debug "Sending email notification to: $execExaminersEmailAddresses"
# Send email notification to Exec examiners
$subject = "New Project: $env:ProjectName - $env:ProjectDescription"
Wait-Debugger "Sending email notification to $execExaminersEmailAddresses"
Send-MailMessage -From "Project Management <project@domain.com>" -To $execExaminersEmailAddresses -Subject $subject -Body "Dear Executive,

We have received a new project request: $env:ProjectName - $env:ProjectDescription

Please review the project details and schedule any necessary meetings or tasks.

Best regards,
Project Management Team"


# Get the list of Project Managers for the specified role (ex: "Project Manager") ObjectId
$projectManagers = Get-ADUser -Filter {Enabled -eq $true -and MemberOf -like "*CN=Project Manager,OU=Roles,DC=domain,DC=com*" -and Department -like "*$env:RoleName*" }

# Get the list of Project Managers' email addresses
$projectManagersEmailAddresses = $projectManagers | Select-Object -ExpandProperty Mail
Write-Debug "Sending email notification to: $projectManagersEmailAddresses"
# Send email notification to Project Managers
$subject = "New Project: $env:ProjectName - $env:ProjectDescription"
Wait-Debugger "Sending email notification to $projectManagersEmailAddresses"
Send-MailMessage -From "Project Management <project@domain.com>" -To $projectManagersEmailAddresses -Subject $subject -Body "Dear Project Manager,

We have received a new project request: $env:ProjectName - $env:ProjectDescription

Please review the project details and schedule any necessary meetings or tasks.

Best regards,
Project Management Team"
