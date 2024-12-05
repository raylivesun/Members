#!/home/admin/app/PowerShell/Members

# Alians Code for Member Administration and Management

# Import the necessary modules
Import-Module ActiveDirectory
Import-Module ActiveDirectory.Management

# Set the Active Directory path
$adPath = "dc=example,dc=com"

# Connect to the Active Directory
$adContext = New-Object ActiveDirectoryContext $adPath
Write-Host ./members.csv "Connected to Active Directory" $adContext
# Function to retrieve all groups in the specified domain
function Get-AllGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string]$domain
    )

    $groups = Get-ADGroup -Filter {Enabled -eq $true -and MemberOf -like "*$domain*"} | Select-Object Name, Description, MemberCount
    return $groups
}

# Function to retrieve all members in the specified group
function Get-AllMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    $group = Get-ADGroup -Identity $groupName -Properties Member
    $members = $group.Members.GetObjects() | Select-Object Name, SamAccountName, MemberOf
    return $members
}

# Function to add a new member to a group
function Add-MemberToGroup {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName,
        [Parameter(Mandatory=$true)]
        [string]$memberSamAccountName
    )

    $group = Get-ADGroup -Identity $groupName
    $member = Get-ADUser -Filter {SamAccountName -eq $memberSamAccountName}
    $group.Members += $member
    $group | Set-ADGroup
}

# Function to remove a member from a group
function Remove-MemberFromGroup {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName,
        [Parameter(Mandatory=$true)]
        [string]$memberSamAccountName
    )

    $group = Get-ADGroup -Identity $groupName
    $member = Get-ADUser -Filter {SamAccountName -eq $memberSamAccountName}
    $group.Members -= $member
    $group | Set-ADGroup
}

# Function to display the current status of the specified group
function Get-GroupStatus {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    $group = Get-ADGroup -Identity $groupName
    $members = Get-ADGroupMember $group -Properties MemberOf
    $memberOfGroups = $members.MemberOf.Name
    $status = if ($memberOfGroups -contains $groupName) { "Member" } else { "Non-member" }
    return $status
}

# Function to display the current status of all groups in the specified domain
function Get-DomainGroupStatus {
    param (
        [Parameter(Mandatory=$true)]
        [string]$domain
    )

    $groups = Get-AllGroups -domain $domain
    foreach ($group in $groups) {
        $status = Get-GroupStatus -groupName $group.Name
        Write-Host "Group: $($group.Name), Status: $status"
    }
    return $groups
}

# Example usage
# Get all groups in the specified domain
$allGroups = Get-AllGroups -domain "example.com"
Write-Host "All groups in example.com:"
foreach ($group in $allGroups) {
    Write-Host "Group: $($group.Name), Description: $($group.Description), Member count: $($group.MemberCount)"
}

# Get all members in the specified group
$allMembers = Get-AllMembers -groupName "example-group"
Write-Host "All members in example-group:"
foreach ($member in $allMembers) {
    Write-Host "Member: $($member.Name), SamAccountName: $($member.SamAccountName), MemberOf groups: $($member.MemberOf -join ", ")"
}

# Add a new member to the specified group
Add-MemberToGroup -groupName "example-group" -memberSamAccountName "new-member"

# Remove a member from the specified group
Remove-MemberFromGroup -groupName "example-group" -memberSamAccountName "new-member"

# Get the current status of the specified group
$groupStatus = Get-GroupStatus -groupName "example-group"
Write-Host "Current status of example-group: $groupStatus"

# Get the current status of all groups in the specified domain
$domainGroupStatus = Get-DomainGroupStatus -domain "example.com"
Write-Host "Current status of all groups in example.com:"
foreach ($group in $domainGroupStatus) {
    Write-Host "Group: $($group.Name), Status: $($group.Status)"
}

