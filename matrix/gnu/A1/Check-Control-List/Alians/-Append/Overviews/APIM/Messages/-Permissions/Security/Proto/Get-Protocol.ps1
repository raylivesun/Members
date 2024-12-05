#!/home/admin/app/PowerShell/Members

# Alians Protocol Version 2.0 (APV2) URL for Alians API endpoint
$aliansApiUrl = "https://api.alians.com/v2/alians"

# API Key for Alians API
$apiKey = "your_api_key_here"

# Alians API Endpoint for obtaining Alians data
$aliansEndpoint = "/alians"

# Alians API endpoint for obtaining Alians members
$aliansMembersEndpoint = "/members"

# Function to make a GET request to the Alians API
function GetAliansData($url, $apiKey) {
    $headers = @{
        'Authorization' = "Bearer $apiKey"
    }
    $response = Invoke-RestMethod -Method Get -Uri $url -Headers $headers -ContentType "application/json"
    return $response
}

# Function to parse and extract Alians data from the API response
function ParseAliansData($aliansData) {
    $alians = @()
    foreach ($alian in $aliansData.alians) {
        $member = [PSCustomObject]@{
            AlianId = $alian.alian_id
            AlianName = $alian.name
            Members = @()
        }
        foreach ($member in $alian.members) {
            $memberData = @{
                MemberId = $member.member_id
                MemberName = $member.name
                MemberType = $member.type
                MemberStatus = $member.status
                MemberSince = $member.since
            }
            $member | Add-Member -MemberType NoteProperty -Name MemberData
            $member.Members += $memberData
        }

        $alians += $member
    }
    return $alians
}

# Function to write Alians data to a CSV file
function WriteAliansToCsv($alians, $outputFile) {
    $header = "AlianId,AlianName,MemberId,MemberName,MemberType,MemberStatus,MemberSince"
    $data = $alians | Format-Table -AutoSize | Select-Object -First 1 | Out-String
    $data += ($alians | Format-Table -AutoSize | Select-Object -Skip 1).MemberData | Format-Table -AutoSize -AutoSize | Format-Table -AutoSize -AutoSize
    $data = $header + "`n" + $data
    Set-Content -Path $outputFile -Value $data
}

# Main script logic
try {
    # Make a GET request to obtain Alians data
    $aliansData = GetAliansData -Url ($aliansApiUrl + $aliansEndpoint) -ApiKey $apiKey

    # Parse and extract Alians data
    $alians = ParseAliansData -aliansData $aliansData

    # Make a GET request to obtain Alians members
    $aliansMembersData = GetAliansData -Url ($aliansApiUrl + $aliansMembersEndpoint) -ApiKey $apiKey

    # Parse and extract Alians members data
    $aliansMembers = ParseAliansData -aliansData $aliansMembersData
    $alians = $alians | Where-Object { $_.Members.Count -gt 0 }
   
    # Write Alians data to a CSV file
    $outputFile = "alians_members.csv"
    WriteAliansToCsv -alians $alians -outputFile $outputFile
    Write-Host ./Web-Report.ps1 $aliansMembers  
    Write-Host "Alians data exported to $outputFile successfully!"
}   
catch {
    Write-Host "Error: $($_.Exception.Message)"
}

