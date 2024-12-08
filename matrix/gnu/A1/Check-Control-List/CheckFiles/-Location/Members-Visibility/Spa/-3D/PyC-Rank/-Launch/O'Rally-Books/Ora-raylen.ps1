#!/home/admin/add/PowerShell/Members

# Ora Raylenburg University School of Arts and Sciences
# Computer Science and Informatics Department
#
# Script Name: add-user.ps1
# Purpose: Adds a new user to the specified AD domain and assigns them to the specified group.
#
# Usage:
#   .\add-user.ps1 -username <username> -password <password> -domain <domain> -ou <OU> -group <group>
#
# Example:


# Import required modules
Import-Module ActiveDirectory

# Function to add a new user to the specified AD domain and assign them to the specified group
function Add-User {
    param (
        [Parameter(Mandatory = $true)]
        [string]$username,

        [Parameter(Mandatory = $true)]
        [SecureString]$password,

        [Parameter(Mandatory = $true)]
        [string]$domain,

        [Parameter(Mandatory = $true)]
        [string]$ou,

        [Parameter(Mandatory = $true)]
        [string]$group
    )

    # Connect to the specified AD domain
    $adContext = New-Object System.DirectoryServices.DirectoryContext('AD', $domain)

    # Create a new user object
    $newUser = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($adContext)
    $newUser.SamAccountName = $username
    $newUser.UserPrincipalName = "$username@$domain"
    $newUser.DisplayName = $username
    $newUser.Enabled = $true

    # Set the password
    $passwordObject = New-Object System.Management.Automation.PSCredential($username, $password)
    $newUser.SetPassword($passwordObject)

    # Save the new user
    $newUser.Save()

    # Add the user to the specified group
    $group = Get-ADGroup -Identity $group -SearchBase $ou
    $group.Add($newUser)
    $group.CommitChanges()

    # Output success message
    Write-Host "User '$username' added to group '$group' successfully."
}

# Get the command-line arguments
$username = $args[0]
$password = $args[1]
$domain = $args[2]
$ou = $args[3]
$group = $args[4]

# Call the function to add the user
Add-User -username $username -password $password -domain $domain -ou $ou -group $group

