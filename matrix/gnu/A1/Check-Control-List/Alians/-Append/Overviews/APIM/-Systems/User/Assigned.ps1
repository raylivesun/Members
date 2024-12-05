#!/home/admin/app/PowerShell/Members

# Alians Assigned to a Group User - AAD Group Membership Query (PowerShell)

# Import required modules
Import-Module ActiveDirectory

# Define the group name
$groupName = "Your-Group-Name"

# Get the group object
$group = Get-ADGroup -Filter { Name -eq $groupName }

if ($group) {
    # Get the group members
    $groupMembers = Get-ADGroupMember -Identity $group -Properties MemberSIDs, Name, SamAccountName | Select-Object Name, SamAccountName, @{Name="Member SID";Expression={$_.MemberSIDs -join ","}}

    # Output the group members
    $groupMembers | Format-Table Name, SamAccountName, "Member SID"
    Write-Host "Total Members: $($groupMembers.Count)"
    Write-Host "Press any key to continue..."
    $null = Read-Host
    } else {
    Write-Host "Group '$groupName' not found."
}

