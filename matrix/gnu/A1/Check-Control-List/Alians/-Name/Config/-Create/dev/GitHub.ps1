#!/home/admin/app/PowerShell/Members

# Alians dev team members and their corresponding roles 
$members = @{
    'Alice' = 'Developer'
    'Bob' = 'Developer'
    'Charlie' = 'Tester'
    'David' = 'Developer'
    'Eve' = 'Tester'
    'Frank' = 'Developer'
    'Grace' = 'Tester'
    'Harry' = 'Developer'
    'Ivy' = 'Tester'
    'Jack' = 'Developer'
}

# Function to filter members based on their role
function FilterMembersByRole($role) {
    $members | Where-Object { $_.Value -eq $role }
}

# Function to calculate the total number of members in the team
function GetTotalMembers() {
    $members.Count
}

# Function to calculate the average number of members per role
function GetAverageMembersPerRole() {
    $totalMembers = GetTotalMembers
    $averageMembers = $members.Count / $members.Keys.Count
    $averageMembers
    Write-Output "Average members per role: $averageMembers"
    Write-Output ""
    Write-Output "Total members: $totalMembers"
}

# Function to calculate the number of members with the highest role
function GetHighestRoleCount() {
    $highestRole = $members | Select-Object Value | Group-Object Value | Sort-Object Count -Descending | Select-Object -First 1
    $highestRole.Count
}

# Function to calculate the number of members with the lowest role
function GetLowestRoleCount() {
    $lowestRole = $members | Select-Object Value | Group-Object Value | Sort-Object Count -Ascending | Select-Object -First 1
    $lowestRole.Count
}

# Function to calculate the percentage of members with each role
function GetRolePercentage() {
    $totalMembers = GetTotalMembers
    foreach ($role in $members.Values) {
        $percentage = ($members.Values | Where-Object { $_ -eq $role } | Count / $totalMembers) * 100
        Write-Output "$role $percentage%"
    }
    Write-Host ""
}

# Function to calculate the number of members with a specific role
function GetRoleCount($role) {
    $members.Values | Where-Object { $_ -eq $role } | Count
}

# Function to calculate the number of members with a specific role and display their names
function GetRoleMembers($role) {
    $members | Where-Object { $_.Value -eq $role } | Select-Object Name
}

# Main script
Write-Host "Alians Development Team Members:"
Write-Host ""

# Filter members by role
Write-Host "Developer Members:"
FilterMembersByRole 'Developer' | Format-Table Name, Role
Write-Host ""

Write-Host "Tester Members:"
FilterMembersByRole 'Tester' | Format-Table Name, Role
Write-Host ""

# Calculate total number of members
Write-Host "Total Members: $(GetTotalMembers)"
Write-Host ""

# Calculate average number of members per role
Write-Host "Average Members per Role: $(GetAverageMembersPerRole)"
Write-Host ""

# Calculate number of members with the highest role
Write-Host "Highest Role Count: $(GetHighestRoleCount)"
Write-Host "Members with Highest Role:"
GetRoleMembers 'Developer' | Format-Table Name
Write-Host ""

Write-Host "Highest Role Count: $(GetHighestRoleCount)"
Write-Host "Members with Highest Role:"
GetRoleMembers 'Tester' | Format-Table Name
Write-Host ""

# Calculate number of members with the lowest role
Write-Host "Lowest Role Count: $(GetLowestRoleCount)"
Write-Host "Members with Lowest Role:"
GetRoleMembers 'Developer' | Format-Table Name
Write-Host ""

Write-Host "Lowest Role Count: $(GetLowestRoleCount)"
Write-Host "Members with Lowest Role:"
GetRoleMembers 'Tester' | Format-Table Name
Write-Host ""

# Calculate percentage of members with each role
Write-Host "Role Percentage:"
GetRolePercentage
Write-Host ""

# Calculate number of members with a specific role
Write-Host "Number of Developer Members: $(GetRoleCount 'Developer')"
Write-Host "Number of Tester Members: $(GetRoleCount 'Tester')"
Write-Host ""

