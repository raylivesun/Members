#!/home/admin/app/PowerShell/Members

# Less Cheese Error Handling 
trap { Write-Error "An error occurred: $_" }

# Import required modules
Import-Module ActiveDirectory

# Variables
$domain = "example.com"
$username = "johndoe@example.com"
$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force
$newPassword = ConvertTo-SecureString "NewPassword456!" -AsPlainText -Force
Wait-Debugger -Debug $password
# Connect to Active Directory
$adSession = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext("AD", $domain)
Wait-Debugger -Debug $adSession

# Check if the user exists in AD
if (Get-ADUser -Identity $username -ErrorAction SilentlyContinue) {
    # Get the user object
    $user = Get-ADUser -Identity $username -Properties *

    # Change the password
    Set-ADUser -Identity $user -ChangePasswordAtLogon $true -Password $newPassword -Confirm:$false
    Write-Host "Password changed successfully for user $($user.SamAccountName)."
    Write-Host "To verify, run 'Get-ADUser $($user.SamAccountName) -Properties PasswordLastSet'."

} else {
    Write-Host "User not found in Active Directory."
}


# Add a new user to the domain
# ...

# Remove a user from the domain
# ...


# Enable/Disable a user account
# ...


# Reset a user's password
# ...


# Lock a user account
# ...


# Unlock a user account
# ...


# Set user's account expiration date
# ...


# Set user's account lockout duration
# ...


# Set user's account password history
# ...
