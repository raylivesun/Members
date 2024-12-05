#!/home/admin/app/PowerShell/Members

# Alians PowerShell commands to make the script more readable Gallery and compatible with PowerShell 7.x
using namespace System.Management.Automation
using namespace System.Management.Automation.Runspaces

# Import the necessary modules
Import-Module ActiveDirectory
Import-Module PSDesiredStateConfiguration

# Set the credentials for the Active Directory module
$cred = New-Object System.Management.Automation.PSCredential('domain\username', (ConvertTo-SecureString 'password' -AsPlainText -Force))

# Set the domain name
$domain = 'domain.com'

# Function to get all users with a specific group membership
function Get-UsersWithGroupMembership {
    param (
        [Parameter(Mandatory)]
        [string]$groupName
    )

    # Connect to the Active Directory server
    $adSession = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext('AD', $domain, $cred)
    $group = Get-ADGroup -Identity $groupName -SearchBase 'DC=domain,DC=com'
    Write-Host "Getting users with group membership: $groupName ($group.Members.Count) users"
    $groupMembers = Get-UsersWithGroupMembership -groupName $groupName
    Write-Host "Group members retrieved successfully"
    Write-Host "Updating group membership for $groupName ($groupName) ($group.Members.Count) users" -ProgressIndicator None
    foreach ($user in $groupMembers) {
        Add-ADGroupMember -Identity $group -Members $user
    }
    Write-Host $adSession
    # Apply the changes to the Active Directory
    # Return the group members
    return $groupMembers
}
    # Get all users in the specified group
    $groupMembers = Get-ADGroupMember -Identity $group -MembersType "User" | Select-Object -ExpandProperty SamAccountName

    return $groupMembers


# Function to update the group membership
function Update-GroupMembership {
    param (
        [Parameter(Mandatory)]
        [string]$groupName,

        [Parameter(Mandatory)]
        [string[]]$users
    )

    # Connect to the Active Directory server
    $adSession = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext('AD', $domain, $cred)
    $group = Get-ADGroup -Identity $groupName -SearchBase 'DC=domain,DC=com'
    Write-Host "Updating group membership for $groupName ($groupName) ($group.Members.Count) users" -ProgressIndicator None
    Write-Output $adSession

    # Remove all existing group members
    foreach ($member in $group.Members) {
        Remove-ADGroupMember -Identity $group -Members $member.SamAccountName
    }

    # Add the specified users to the group
    foreach ($user in $users) {
        Add-ADGroupMember -Identity $group -Members $user
    }

    # Apply the changes to the Active Directory
    Set-ADGroup -Identity $group -Members $group.Members
}

# Function to create a new group
function CreateGroup {
    param (
        [Parameter(Mandatory)]
        [string]$groupName,

        [Parameter(Mandatory)]
        [string[]]$users
    )

    # Connect to the Active Directory server
    $adSession = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext('AD', $domain, $cred)
    $newGroup = New-ADGroup -Name $groupName -SamAccountName $groupName -Description "Group created by the PowerShell script" -GroupScope Global | Select-Object -ExpandProperty Identity
    $newGroup.GroupScope = 'Global'
    Write-Output $adSession
    # Add the specified users to the new group
    foreach ($user in $users) {
        Add-ADGroupMember -Identity $newGroup -Members $user
    }

    # Apply the changes to the Active Directory
    Set-ADGroup -Identity $newGroup -Members $newGroup.Members
}

# Function to delete a group
function DeleteGroup {
    param (
        [Parameter(Mandatory)]
        [string]$groupName
    )

    # Connect to the Active Directory server
    $adSession = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext('AD', $domain, $cred)
    $group = Get-ADGroup -Identity $groupName -SearchBase 'DC=domain,DC=com'
    Write-Host "Deleting group: $groupName ($group.Members.Count) users" -ProgressIndicator None
    Write-Output $adSession
    # Remove all existing group members
    foreach ($member in $group.Members) {
        Remove-ADGroupMember -Identity $group -Members $member.SamAccountName
    }

    # Delete the group
    Remove-ADGroup -Identity $group
}

# Example usage
# Get all users in the "Finance" group
$financeUsers = Get-UsersWithGroupMembership -groupName 'Finance'
Write-Host "Finance users: $financeUsers"
# Update the group membership of the "Finance" group to include additional users
Update-GroupMembership -groupName 'Finance' -users ('user1', 'user2')

# Create a new group called "Marketing" with the specified users
CreateGroup -groupName 'Marketing' -users ('user3', 'user4')

# Delete the "Marketing" group
DeleteGroup -groupName 'Marketing'
