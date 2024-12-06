#!/home/admin/app/PowerShell/Members

# Get Condensed AD Group Memberships
# This script fetches the members of a given AD group using the Get-ADGroupMember cmdlet.
# The output is formatted as a CSV with the following columns:
# Group Name, Member Distinguished Name, Member Name

# Define the AD Group Distinguished Name
$groupName = "CN=Your_Group_Name,OU=Your_OU_Name,DC=Your_Domain,DC=com"

# Get the members of the specified group
$members = Get-ADGroupMember -Identity $groupName -Properties Name,DistinguishedName

# Format the output as a CSV
$csvHeaders = "Group Name,Member Distinguished Name,Member Name"
$csvContent = $members | ForEach-Object {
    $groupName = $_.DistinguishedName -split(',')[0] -replace "CN="
    $memberDistinguishedName = $_.DistinguishedName
    $memberName = $_.Name
    "$groupName,$memberDistinguishedName,$memberName"
}

$csvContent -join "`n" | Out-File -FilePath "group_members.csv" -Append
$csvHeaders    