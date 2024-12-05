#!/home/admin/app/PowerShell/Members

# Alians Appends the Alians to the Members list in the Alians.txt file
#
# Parameters:
#   $alians (string): The Alians to be appended to the Members list

# Read the Alians.txt file
$aliansFile = "Alians.txt"
if (Test-Path -Path $aliansFile) {
    $alians = Get-Content -Path $aliansFile
} else {
    Write-Host "Alians.txt file not found."
    return
}

# Append the Alians to the Members list
$newMembers = $alians + $alians

# Write the updated Members list to the Alians.txt file
Set-Content -Path $aliansFile -Value $newMembers

Write-Host "Alians successfully appended to the Members list."
