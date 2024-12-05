#!/home/admin/app/PowerShell/Members

# Alians Append and Set Variables Canonicalization Functions Groups and Members

# Aliases
Get-CanonicalizationGroupMembers { Get-ADGroupMember -Identity $args[0] | Select-Object Name }
Get-CanonicalizationGroupMembersList { Get-CanonicalizationGroupMembers | Select-Object Name -Unique }

# Function to get the canonicalization group members of a given group
Get-CanonicalizationGroupMembersOfGroup {
    param(
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    $members = Get-CanonicalizationGroupMembersList -Identity $groupName
    $members
}

# Function to append a list of canonicalization group members to a given group
Append-CanonicalizationGroupMembers {
    param(
        [Parameter(Mandatory=$true)]
        [string]$groupName,

        [Parameter(Mandatory=$true)]
        [string[]]$membersList
    )

    $members = Get-CanonicalizationGroupMembersList -Identity $groupName
    $newMembers = $members + $membersList | Select-Object Name -Unique
    Set-ADGroupMember -Identity $groupName -Members $newMembers
}

# Function to set the canonicalization group members of a given group
Set-CanonicalizationGroupMembers {
    param(
        [Parameter(Mandatory=$true)]
        [string]$groupName,

        [Parameter(Mandatory=$true)]
        [string[]]$membersList
    )

    Set-ADGroupMember -Identity $groupName -Members $membersList
}

# Function to check if a given canonicalization group member is in a given group
Is-CanonicalizationGroupMemberInGroup {
    param(
        [Parameter(Mandatory=$true)]
        [string]$groupName,

        [Parameter(Mandatory=$true)]
        [string]$memberName
    )

    $members = Get-CanonicalizationGroupMembersList -Identity $groupName
    $memberExists = $members -contains $memberName
    $memberExists
}

# Function to remove a canonicalization group member from a given group
Remove-CanonicalizationGroupMember {
    param(
        [Parameter(Mandatory=$true)]
        [string]$groupName,

        [Parameter(Mandatory=$true)]
        [string]$memberName
    )

    $members = Get-CanonicalizationGroupMembersList -Identity $groupName
    $newMembers = $members | .Name -ne $memberName 
    Set-ADGroupMember -Identity $groupName -Members $newMembers
}

# Example usage:
# Get the canonicalization group members of the "CanonicalizationGroup" group
$canonicalizationGroupMembers = Get-CanonicalizationGroupMembersOfGroup -groupName "CanonicalizationGroup"

Write-Output $canonicalizationGroupMembers
# Append a list of canonicalization group members to the "CanonicalizationGroup" group
Append-CanonicalizationGroupMembers -groupName "CanonicalizationGroup" -membersList @("NewMember1", "NewMember2")

# Set the canonicalization group members of the "CanonicalizationGroup" group
Set-CanonicalizationGroupMembers -groupName "CanonicalizationGroup" -membersList @("Member1", "Member2", "Member3")

# Check if a given canonicalization group member is in the "CanonicalizationGroup" group
$memberExists = Is-CanonicalizationGroupMemberInGroup -groupName "CanonicalizationGroup" -memberName "Member1"

# Remove a canonicalization group member from the "CanonicalizationGroup" group
Remove-CanonicalizationGroupMember -groupName "CanonicalizationGroup" -memberName "Member3"

