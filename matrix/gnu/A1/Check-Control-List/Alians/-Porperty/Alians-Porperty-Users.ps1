#!/home/admin/app/PowerShell/Members

# Alians Property ID for Members (replace with your property ID)
$propertyId = "your-property-id"

# Get the list of all members
$members = Get-GSuiteMember -PropertyId $propertyId

# Loop through each member
foreach ($member in $members) {
    # Get the member's email address
    $email = $member.PrimaryEmail
    # Get the member's display name
    $displayName = $member.DisplayName
    # Get the member's role
    $role = $member.Role
    # Get the member's membership state
    $membershipState = $member.MembershipState

    # Print the member details
    Write-Host "Email: $email"
    Write-Host "Display Name: $displayName"
    Write-Host "Role: $role"
    Write-Host "Membership State: $membershipState"
    Write-Host ""
    Write-Host "------------------------------------"
}


# You can add more properties like department, job title, etc. as needed.
# To get more details about a specific member, you can use the member's email address.
# For example:
# $specificMember = Get-GSuiteMember -PropertyId $propertyId -PrimaryEmail "specific-member@example.com"
# Write-Host "Email: $($specificMember.PrimaryEmail)"
# Write-Host "Display Name: $($specificMember.DisplayName)"
# Write-Host "Department: $($specificMember.Department)"
# Write-Host "Job Title: $($specificMember.JobTitle)"
# ...
