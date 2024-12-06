#!/home/admin/app/PowerShell/Members

# Get CupsServers from Cups API endpoint
$url = "https://your-cups-api-endpoint/api/v1/servers"
$headers = @{
    'Authorization' = 'Bearer YOUR_API_TOKEN'
}

$response = Invoke-RestMethod -Method Get -Uri $url -Headers $headers

# Parse JSON response to get server names and IP addresses
$servers = $response | ConvertFrom-Json
$serverNames = $servers | Select-Object Name, HostAddress

# Filter servers that are in Active, Offline, or Maintenance state
$filteredServers = $serverNames | Where-Object {
    $_.Status -in @('Active', 'Offline', 'Maintenance')
}

# Print server names and IP addresses in CSV format
$filteredServers | Format-Table -AutoSize Name, HostAddress -NoTypeInformation
