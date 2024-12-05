#!/home/admin/app/PowerShell/Members

# Alians Property Names (API endpoint) and their corresponding property names in the PowerShell object
$alians = @{
    "alians" = "Alians"
    "alians_count" = "AliansCount"
    "alians_page" = "AliansPage"
    "alians_per_page" = "AliansPerPage"
    "alians_total" = "AliansTotal"
    "id" = "Id"
    "name" = "Name"
    "created_at" = "CreatedAt"
    "updated_at" = "UpdatedAt"
}

# Function to get Alians from API
function Get-Alians {
    param (
        [Parameter(Mandatory=$true)]
        [string]$url,
        [Parameter(Mandatory=$true)]
        [string]$apiKey
    )

    # Send GET request to the Alians API endpoint
    $response = Invoke-RestMethod -Method Get -Uri $url -Headers @{
        "Authorization" = "Bearer $apiKey"
        "Accept" = "application/json"
    }

    # Convert JSON response to PowerShell object
    $aliansObject = ConvertFrom-Json -InputObject $response.Content

    # Map Alians API properties to PowerShell object properties
    foreach ($apiProperty in $alians.Keys) {
        $aliansObject.$alians[$apiProperty] = $response.Content.$apiProperty
    }

    return $aliansObject
}

# Function to process Alians data
function ProcessAlians {
    param (
        [Parameter(Mandatory=$true)]
        [PSCustomObject]$aliansObject
    )

    # Filter Alians based on a specific condition
    $filteredAlians = $aliansObject | Where-Object { $_.Name -like "A*" }

    # Sort Alians by Name in descending order
    $sortedAlians = $filteredAlians | Sort-Object Name -Descending

    # Output the filtered and sorted Alians
    foreach ($alian in $sortedAlians) {
        Write-Host "ID: $($alian.Id), Name: $($alian.Name), Created At: $($alian.CreatedAt)"
    }
}

# Main script
$url = "https://api.example.com/alians"
$apiKey = "your_api_key"

# Get Alians from API
$alians = Get-Alians -url $url -apiKey $apiKey

# Process Alians data
Process-Alians -aliansObject $alians

