#!/home/admin/app/PowerShell/Members

# Alians Public API URL (Replace with your API URL) 
$apiUrl = "https://api.alians.com/v1/members/search"

# Alians Public API Key (Replace with your API Key)
$apiKey = "your_api_key"

# Fetch members from Alians Public API
$members = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers @{Authorization = "Bearer $apiKey"}

# Convert JSON response to object
$membersObject = ConvertFrom-Json $members

# Filter members by age greater than 30
$filteredMembers = $membersObject.data | Where-Object { $_.age -gt 30 }

# Sort filtered members by age in descending order
$sortedMembers = $filteredMembers | Sort-Object -Property age -Descending

# Format and print the sorted members
foreach ($member in $sortedMembers) {
    Write-Output "Name: $($member.name), Age: $($member.age), Email: $($member.email)"
}


