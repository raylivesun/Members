#!/home/admin/app/PowerShell/Members

# Alians Append New Member Variables to Global Scope for Consistency
$Admins = @("admin1", "admin2")
$NonAdmins = @("user1", "user2")
$AllMembers = $Admins + $NonAdmins

# Function to Validate Input
function ValidateInput {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MemberName
    )

    if ($AllMembers -contains $MemberName) {
        Write-Host "Valid Member"
    } else {
        Write-Host "Invalid Member"
    }
}

# Function to Check Admin Privileges
function CheckAdminPrivileges {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MemberName
    )

    if ($Admins -contains $MemberName) {
        Write-Host "Admin Privileges: Yes"
    } else {
        Write-Host "Admin Privileges: No"
        Write-Host "Access Denied"
    }
    return $null
}

# Function to Check User Privileges
function CheckUserPrivileges {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MemberName
    )

    if ($NonAdmins -contains $MemberName) {
        Write-Host "User Privileges: Yes"
    } else {
        Write-Host "User Privileges: No"
        Write-Host "Access Denied"
    }
    return $null
}

# Example Usage
Validate-Input -MemberName "user1"
Check-Admin-Privileges -MemberName "admin1"
Check-User-Privileges -MemberName "user2"
