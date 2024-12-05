#!/home/admin/app/PowerShell/Members

# Alians Name for PowerShell Core Users
$PowerShellCoreAlians = @("PowerShell-Core", "pwsh", "pwsh-preview", "pwsh-insider")

# Fetch the list of PowerShell Core users
$powershellCoreUsers = Get-ADUser -Filter "Enabled -eq $true -and MemberOf -like '%domain\PowerShell Core Users'"

# Loop through each PowerShell Core user
foreach ($user in $powershellCoreUsers) {
    # Check if the user is a member of the PowerShell Core Alians
    if ($PowerShellCoreAlians -contains $user.SamAccountName) {
        continue
    }

    # Update the user's password
    $password = ConvertTo-SecureString -AsPlainText "Your_Password" -Force
    $user.ChangePassword((Get-Date).AddDays(-1)) 
    # Set the user's account lockout
    Set-ADUser -Identity $user.SamAccountName -AccountLockoutTime (Get-Date).AddDays(1)
    $user.PasswordNeverExpires = $true
    Set-ADUser -Identity $user.SamAccountName -ChangePasswordAtLogon $false
    Set-ADUser -Identity $user.SamAccountName -UserPrincipalName $user.UserPrincipalName -ChangePasswordAtLogon $false
    Set-ADUser -Identity $user.SamAccountName -Enabled $true
    $user.Password = $password
    Set-ADUser -Identity $user.SamAccountName -ChangePasswordAtLogon $true
    Set-ADUser -Identity $user.SamAccountName -Enabled $true
    Set-ADUser -Identity $user.SamAccountName -ChangePasswordAtLogon $true

    # Remove the user's remote access certificate
    # Enable the user's account
    # Send a password reset email
    $smtpServer = "smtp.example.com"
    $mailFrom = "noreply@example.com"
    $mailTo = $user.EmailAddress
    $mailSubject = "Password Reset for PowerShell Core Account"
    $mailBody = "Your password has been reset. Please log in to your PowerShell Core account using the provided credentials."
    Send-MailMessage -SmtpServer $smtpServer -From $mailFrom -To $mailTo -Subject $mailSubject -Body $mailBody
}

