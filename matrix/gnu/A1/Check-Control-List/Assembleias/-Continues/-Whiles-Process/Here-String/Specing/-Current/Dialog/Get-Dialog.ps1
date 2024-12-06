#!/home/admin/app/PowerShell/Members

# Get Dialog Parameters from Dialog Input Field (assuming it's a JSON string)
$dialogParameters = Get-Content -Path 'C:\path\to\dialogParameters.json' | ConvertFrom-Json

# Extract required parameters from Dialog Parameters
$domain = $dialogParameters.domain
$username = $dialogParameters.username
$password = $dialogParameters.password
$server = $dialogParameters.server
$database = $dialogParameters.database
$port = $dialogParameters.port

# Validate domain, username, password, server, database, and port
if (-not $domain -or -not $username -or -not $password -or -not $server -or -not $database -or -not $port) {
    Write-Error 'Missing required parameter(s)'
    exit 1
}

# Connect to SQL Server
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = "Server=$server,$port;Database=$database;User ID=$username;Password=$password;"

try {
    $connection.Open()
    Write-Host 'Connection to SQL Server successful'
    $connection.Close()
    exit 0

} catch {
    Write-Error 'Failed to connect to SQL Server'
    exit 1
}

