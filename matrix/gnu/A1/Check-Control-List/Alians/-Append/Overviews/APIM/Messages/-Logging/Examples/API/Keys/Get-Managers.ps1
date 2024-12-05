#!/home/admin/app/PowerShell/Members

# Alians Get Member Information Function 
function Get-MemberInfo {
    param (
        [Parameter(Mandatory = $true)]
        [string]$MemberId
    )

    $memberInfo = Get-ADUser -Filter "EmployeeID -EQ '$MemberId'" -Properties *
    if ($memberInfo) {
        return @{
            MemberId = $memberInfo.EmployeeID
            FirstName = $memberInfo.GivenName
            LastName = $memberinfo.Surname
            Email = $memberInfo.Email
            Department = $memberInfo.Department
            Manager = $memberInfo.Manager.SamAccountName
        }
        } else {
        return "No member found with EmployeeID: $MemberId"
    }

    # Get-ADGroupMember Function
    function Get-ADGroupMember {
        param (
            [Parameter(Mandatory = $true)]
            [string]$MemberId
        )
        $groupMembers = Get-ADGroupMember -Identity "Your-Group-Name" -Members $MemberId
        return $groupMembers.SamAccountName
    }

    # Get-ADGroupMember Function
    function Get-ADGroupInfo {
        param (
            [Parameter(Mandatory = $true)]
            [string]$SamAccountName
        )
        $groupInfo = Get-ADGroup -Identity $SamAccountName -Properties *
        return $groupInfo.Name
    }

    # Get Member Groups Function
    function Get-MemberGroups {
        param (
            [Parameter(Mandatory = $true)]
            [string]$MemberId
        )
        $memberGroups = Get-ADGroupMember -Identity "Your-Group-Name" -Members $MemberId
        return $memberGroups.Name
    }

    # Get Member Manager's Groups Function
    function Get-ManagerGroups {
        param (
            [Parameter(Mandatory = $true)]
            [string]$ManagerSamAccountName
        )
        $managerGroups = Get-ADGroupMember -Identity "Your-Group-Name" -Members $ManagerSamAccountName
        return $managerGroups.Name
    }

    # Get Member's Reportees Function
    function Get-MemberReportees {
        param (
            [Parameter(Mandatory = $true)]
            [string]$MemberId
        )
        $reportees = Get-ADUser -Filter "Manager -EQ '$MemberId'" -Properties *
        return $reportees.SamAccountName
    }

    # Get Member's Reportees' Groups Function
    function Get-ReporteeGroups {
        param (
            [Parameter(Mandatory = $true)]
            [string]$MemberId
        )
        $reporteeGroups = Get-ADGroupMember -Identity "Your-Group-Name" -Members $MemberId
        return $reporteeGroups.Name
    }
}

# Usage Example
$memberInfo = Get-MemberInfo -MemberId "0012345"
Write-Host "Member Information:"
Write-Host "Employee ID: $($memberInfo.MemberId)"
Write-Host "First Name: $($memberInfo.FirstName)"
Write-Host "Last Name: $($memberInfo.LastName)"
Write-Host "Email: $($memberInfo.Email)"
Write-Host "Department: $($memberInfo.Department)"
Write-Host "Manager: $($memberInfo.Manager)"

Write-Host "Member Groups:"
$memberGroups = Get-MemberGroups -MemberId "0012345"
foreach ($group in $memberGroups) {
    Write-Host "- $($group)"
    $groupInfo = Get-ADGroupInfo -SamAccountName $group
    Write-Host "  Name: $($groupInfo.Name)"
}

Write-Host "Manager Groups:"
$managerGroups = Get-ManagerGroups -ManagerSamAccountName $memberInfo.Manager
foreach ($group in $managerGroups) {
    Write-Host "- $($group)"
    $groupInfo = Get-ADGroupInfo -SamAccountName $group
    Write-Host "  Name: $($groupInfo.Name)"
}

Write-Host "Reportees:"
$reportees = Get-MemberReportees -MemberId "0012345"
foreach ($reportee in $reportees) {
    Write-Host "- $($reportee)"
    $reporteeGroups = Get-ReporteeGroups -MemberId $reportee
    foreach ($group in $reporteeGroups) {
        Write-Host "  - $($group)"
        $groupInfo = Get-ADGroupInfo -SamAccountName $group
        Write-Host "    Name: $($groupInfo.Name)"
    }
    Write-Host ""
}


