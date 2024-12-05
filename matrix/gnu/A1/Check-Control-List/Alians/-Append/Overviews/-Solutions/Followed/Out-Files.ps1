#!/home/admin/app/PowerShell/Members

# Alians Overviews & Listings for the members' server groups
$aliases = @{
    'Alians' = 'Get-AliansOverview'
    'Listings' = 'Get-AliansListings'
}

# Function to execute the aliases
function ExecuteAlias {
    param (
        [Parameter(Mandatory=$true)]
        [string]$alias,

        [Parameter(Mandatory=$true)]
        [string]$serverGroup
    )
    $functionName = $aliases[$alias]
    if ($functionName) {
        $functionName -f $serverGroup
    } else {
        Write-Host "Alias '$alias' not found."
    }
    Get-Alias
}

# Main script execution
param (
    [Parameter(Mandatory=$true)]
    [string]$serverGroup
)

# Get Alians Overview
$aliansOverview = Get-AliansOverview -ServerGroup $serverGroup
Write-Host "Alians Overview for server group '$serverGroup':"
Write-Host "---------------------------------------------"
foreach ($alians in $aliansOverview) {
    Write-Host "Alians: $($alians.Alians)"
    Write-Host "Total: $($alians.Total)"
    Write-Host "---------------------------------------------"
}

# Get Alians Listings
$aliansListings = Get-AliansListings -ServerGroup $serverGroup
Write-Host "Alians Listings for server group '$serverGroup':"
Write-Host "---------------------------------------------"
foreach ($alians in $aliansListings) {
    Write-Host "Alians: $($alians.Alians)"
    Write-Host "Total: $($alians.Total)"
    Write-Host "---------------------------------------------"
}

# Execute aliases
Execute-Alias Alians $serverGroup
Execute-Alias Listings $serverGroup
