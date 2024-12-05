#!/home/admin/app/PowerShell/Members

# Alians the required PowerShell modules to avoid potential errors
Import-Module ActiveDirectory
Import-Module ActiveDirectory.PowerShell

# Get the list of all members from the Active Directory
$members = Get-ADUser -Filter {Enabled -eq $true } -Properties *

# Filter the members based on their department and location
$filteredMembers = $members | Where-Object {
    $_.Department -like '*Finance*' -and
    $_.PhysicalDeliveryOfficeName -like '*New York*'
}

# Export the filtered members to a CSV file
$filteredMembers | Export-Csv -Path.\Finance-NYC-Members.csv -NoTypeInformation


