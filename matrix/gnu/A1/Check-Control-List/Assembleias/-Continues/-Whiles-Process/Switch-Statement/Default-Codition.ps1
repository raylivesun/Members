#!/home/admin/app/PowerShell/Members

# Default Condition to return all members
$condition = { $_ }

# If a condition is provided, use it to filter members
if ($args[0]) {
    $condition = { $_ | Where-Object { $_.Name -like "*$args[0]*" -or $_.Email -like "*$args[0]*" } }
}

# Get the list of members from the CSV file
$members = Import-Csv -Path "./members.csv"

# Filter the members based on the condition
$filteredMembers = $members | Where-Object $condition

# Sort the filtered members by Name in ascending order
$sortedMembers = $filteredMembers | Sort-Object Name

# Output the sorted members
$sortedMembers
