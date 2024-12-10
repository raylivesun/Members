#!/home/admin/app/PowerShell/Members

# Get Property Hard List (PHL) from the database
$phl = Get-Content "path/to/phl.txt" | Select-Object -Unique

# Get the list of members from the database
$members = Get-Content "path/to/members.txt" | Select-Object -Unique

# Get the list of members who have not been in the PHL
$newMembers = $members | Where-Object { -not $phl.Contains($_) }

# Output the new members
$newMembers
