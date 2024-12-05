#!/home/admin/app/PowerShell/Members

# Alians Buffer for PowerShell Module Search Paths
$aliases.ModulePath += "/home/admin/app/PowerShell/Modules"

# Enable PowerShell Integrated Script Host (ISE)
Set-ISEOption -ExecutionPolicy RemoteSigned -ConfirmPreference None

# Import PowerShell Modules
Import-Module -Name ActiveDirectory
Import-Module -Name ActiveDirectory.Tools
Import-Module -Name ActiveDirectory.Tools.Graph
Import-Module -Name ActiveDirectory.Tools.Graph.PowerShell
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.ADLDS
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.ADLDS.PowerShell
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell.ADLDS
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell.ADLDS.PowerShell
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell.ADLDS.PowerShell.ADLDS
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell.ADLDS.PowerShell.ADLDS.PowerShell
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell.ADLDS.PowerShell.ADLDS.PowerShell.ADLDS.PowerShell
Import-Module -Name ActiveDirectory.Tools.PowerShell.ADSync.PowerShell.ADLDS.PowerShell.ADLDS.PowerShell.ADLDS.PowerShell.ADLDS.


# Function to retrieve AD groups
function Get-ADGroups {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve all AD groups
    $groups = Get-ADGroup -SearchBase $adContext.RootDSE.DefaultNamingContext -Filter 'objectClass=group'

    # Return the groups
    return $groups
}

# Function to retrieve AD users
function Get-ADUsers {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve all AD users
    $users = Get-ADUser -SearchBase $adContext.RootDSE.DefaultNamingContext -Filter 'objectClass=user'

    # Return the users
    return $users
}

# Function to retrieve AD user details
function Get-ADUserDetails {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName,
        [Parameter(Mandatory = $true)]
        [string]$UserName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve the user
    $user = Get-ADUser -Identity $userName -SearchBase $adContext.RootDSE.DefaultNamingContext

    # Return the user details
    return $user
}

# Function to retrieve AD group members
function Get-ADGroupMembers {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName,
        [Parameter(Mandatory = $true)]
        [string]$groupName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve the group
    $group = Get-ADGroup -Identity $groupName -SearchBase $adContext.RootDSE.DefaultNamingContext

    # Retrieve the group members
    $members = Get-ADGroupMember -Identity $group -Properties member

    # Return the group members
    return $members
}

# Function to retrieve AD user memberships
function Get-ADUserMemberships {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName,
        [Parameter(Mandatory = $true)]
        [string]$UserName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve the user
    $user = Get-ADUser -Identity $userName -SearchBase $adContext.RootDSE.DefaultNamingContext

    # Retrieve the user memberships
    $memberships = Get-ADUserMemberOf -Identity $user

    # Return the user memberships
    return $memberships
}

# Function to retrieve AD group members (recursive)
function Get-ADGroupMembersRecursive {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName,
        [Parameter(Mandatory = $true)]
        [string]$groupName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve the group
    $group = Get-ADGroup -Identity $groupName -SearchBase $adContext.RootDSE.DefaultNamingContext

    # Retrieve the group members (recursive)
    $members = Get-ADGroupMember -Identity $group -Properties member | ForEach-Object {
        if ($_.objectClass -eq 'group') {
            Get-ADGroupMemberRecursive -DomainName $DomainName -GroupName $_.Name
        } else {
            $_.Name
        }
    }

    # Return the group members (recursive)
    return $members
}

# Function to retrieve AD user details (recursive)
function Get-ADUserDetailsRecursive {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DomainName,
        [Parameter(Mandatory = $true)]
        [string]$UserName
    )

    # Connect to Active Directory
    $adContext = New-Object System.DirectoryServices.DirectoryContext("AD", $DomainName)

    # Retrieve the user (recursive)
    $user = Get-ADUser -Identity $userName -SearchBase $adContext.RootDSE.DefaultNamingContext | ForEach-Object {
        if ($_.objectClass -eq 'group') {
            Get-ADUserDetailsRecursive -DomainName $DomainName -UserName $_.Name
            continue
        }
        $_.Name
    }
    # Return the user details (recursive)
    return $user
}

# Example usage

# Retrieve AD groups
$groups = Get-ADGroups -DomainName "example.com"
$groups | Format-Table Name, Description

# Retrieve AD users
$users = Get-ADUsers -DomainName "example.com"
$users | Format-Table Name, GivenName, Surname

# Retrieve AD user details
$userDetails = Get-ADUserDetails -DomainName "example.com" -UserName "jdoe"
$userDetails | Format-Table Name, GivenName, Surname, EmailAddress

# Retrieve AD group members
$groupMembers = Get-ADGroupMembers -DomainName "example.com" -GroupName "admins"
$groupMembers | Format-Table Name

# Retrieve AD user memberships
$userMemberships = Get-ADUserMemberships -DomainName "example.com" -UserName "jdoe"
$userMemberships | Format-Table Name

# Retrieve AD group members (recursive)
$groupMembersRecursive = Get-ADGroupMembersRecursive -DomainName "example.com" -GroupName "admins"
$groupMembersRecursive | Format-Table Name

# Retrieve AD user details (recursive)
$userDetailsRecursive = Get-ADUserDetailsRecursive -DomainName "example.com" -UserName "jdoe"
$userDetailsRecursive | Format-Table Name

