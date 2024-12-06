#!/home/admin/app/PowerShell/Members

# Case sensitive check for user role (replace 'Admin' with your desired role)
if ((Get-ADUser -Identity $(whoami) -Properties Role).Role -contains 'Admin') {
    # If user is an admin, retrieve their email address
    $email = (Get-ADUser -Identity $(whoami) -Properties EmailAddress).EmailAddress
    # Print the email address
    Write-Host "Email Address: $email"
    # Send an email notification to a predefined email address (replace 'your-email@example.com' with your own)
    Send-MailMessage -To 'your-email@example.com' -From 'admin@your-domain.com' -Subject 'Admin Access Notification' -Body "Admin user $(whoami) has accessed the system."
    # Log the access event
    Add-Content -Path 'C:\temp\access_log.txt' -Value "$(Get-Date): Admin user $(whoami) accessed the system."
    # Add a security audit event
    Add-WinEvent -LogName Security -ID 4624 -Message "Admin user $(whoami) accessed the system."
    # Remove the user from the 'Admin' group (replace 'Admin' with your desired group)
    Remove-ADGroupMember -Identity 'Admin' -Members $(Get-ADUser -Identity $(whoami)).Sid
    # Disable the user account
    Set-ADAccount -Identity $(whoami) -Enabled $false
    # Lock the user's account
    Set-ADAccount -Identity $(whoami) -LockoutTime (Get-Date).AddMinutes(30)
    # Notify the user via a custom PowerShell script (replace 'C:\path\to\script.ps1' with your own)
    & 'C:\path\to\script.ps1'
    # Exit the script
    exit 0
    # If user is not an admin, display a message and exit the script
}
else {
    Write-Host "You do not have administrative privileges."
    exit 1
}

switch -CaseSensitive ('Condition')
{
'condition' {'First Action'}
'Condition' {'Second Action'}
'conditioN' {'Third Action'}
}