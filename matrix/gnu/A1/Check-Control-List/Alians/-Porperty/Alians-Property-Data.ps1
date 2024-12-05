#!/home/admin/app/PowerShell/Members

# Alians Property ID for Members in Alians 
$aliansPropertyId = "your-alians-property-id"

# Alians API endpoint
$aliansApiEndpoint = "https://api.alians.com/v1/properties/$aliansPropertyId/members"

# Alians API Key
$aliansApiKey = "your-alians-api-key"

# Fetch members from Alians API
$membersResponse = Invoke-RestMethod -Method Get -Uri $aliansApiEndpoint -Headers @{Authorization = "Bearer $aliansApiKey"}

# Process members data
foreach ($member in $membersResponse.members) {
    $memberId = $member.member_id
    $firstName = $member.first_name
    $lastName = $member.last_name
    $email = $member.email
    $phone = $member.phone

    # Save member data to a CSV file
    Add-Content -Path "members.csv" -Value "$(Join-Object -Separator "," $memberId $firstName $lastName $email $phone)"
}

Write-Output "Members data saved to members.csv"

