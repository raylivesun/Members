#!/home/admin/app/PowerShell/Members

# Alians Created: 
#   $Alians = @{"admin"="Administrator"; "tech"="Technician"; "hr"="Human Resources"; "finance"="Finance"; "sales"="Sales"; "marketing"="Marketing"}

# Array to store all members
$Members = @()

# Function to add a new member
function Add-Member {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [string]$Role
    )

    if ($Alians.ContainsKey($Role)) {
        $members += New-Object PSObject -Property @{
            Name = $Name
            Role = $Alians[$Role]
            Department = (Get-ADUser -Filter "SamAccountName -eq '$Name'" -Properties department).department
        }
        Write-Host "New member '$Name' with role '$Role' added successfully."
        return $true
        } else {
        Write-Host "Invalid role '$Role'. Role must be one of the following: $($Alians.Keys -join ', ')"
        return $false
    }

    # Function to update a member's role
    function Update-MemberRole {
        param (
            [Parameter(Mandatory=$true)]
            [string]$Name,
            [Parameter(Mandatory=$true)]
            [string]$NewRole
        )

        if ($Alians.ContainsKey($NewRole)) {
            $members = $members | Where-Object Name -EQ $Name
            if ($members) {
                $members[0].Role = $Alians[$NewRole]
                Write-Host "Role of member '$Name' updated to '$NewRole' successfully."
                return $true
                } else {
                Write-Host "Member '$Name' not found."
                return $false
            }
            } else {
            Write-Host "Invalid new role '$NewRole'. Role must be one of the following: $($Alians.Keys -join ', ')"
            return $false
            }
    }
    # Function to remove a member
    function Remove-Member {
        param (
            [Parameter(Mandatory=$true)]
            [string]$Name
        )
        $members = $members | Where-Object Name -EQ $Name
        if ($members) {
            $members.Remove($members[0])
            Write-Host "Member '$Name' removed successfully."
            return $true
            } else {
            Write-Host "Member '$Name' not found."
            return $false
            }
           
            # Function to list all members
            function Get-Members {
                return $members
            }
    }
}
# Example usage:
# Add a new member
Add-Member "johndoe" "tech"

# Update a member's role
Update-MemberRole "johndoe" "finance"

# Remove a member
Remove-Member "johndoe"

# List all members
Get-Members
