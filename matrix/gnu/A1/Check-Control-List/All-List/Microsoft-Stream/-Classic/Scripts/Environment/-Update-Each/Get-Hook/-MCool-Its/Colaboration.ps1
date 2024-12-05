#!/home/admin/app/PowerShell/Members

# Colaboration status mapping for Active Directory groups
$statusMap = @{
    'Owners' = 'Owner'
    'Contributors' = 'Contributor'
    'Members' = 'Member'
}

# Function to retrieve all members of a group
function Get-GroupMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    $group = Get-ADGroup -Identity $groupName

    $members = foreach ($member in $group.Members) {
        $memberInfo = Get-ADUser -Identity $member.SamAccountName -Properties Name, Department, Manager, EmployeeID, Description
        $memberInfo.Status = $statusMap.Keys[$statusMap.Values.IndexOf($member.ObjectClass)]
        $memberInfo
    }
    $members
}

# Example usage
$groupName = 'YourGroup'
$members = Get-GroupMembers -groupName $groupName

foreach ($member in $members) {
    Write-Host "Name: $($member.Name)"
    Write-Host "Department: $($member.Department)"
    Write-Host "Manager: $($member.Manager.Name)"
    Write-Host "Employee ID: $($member.EmployeeID)"
    Write-Host "Status: $($member.Status)"
    Write-Host "Description: $($member.Description)"
    Write-Host ""
}

