#!/home/admin/app/PowerShell/Members

# Get living members of the group municipality/cristinapolis-se
$members = Get-ADGroupMember -Identity "municipality/cristinapolis-se" -Filter "Enabled -eq $true"

# Initialize a variable to store the count of members
$count = 0

# Loop through each member
foreach ($member in $members) {
    # Check if the member is a user
    if ($member -is [System.DirectoryServices.AccountManagement.UserPrincipal]) {
        # Check if the user has a given role
        if ($member.Roles -contains "Role_Name") {
            # Increment the count
            $count++
        }
    }
}

# Output the count of members with the given role
Write-Host "Number of members with the given role: $count"


