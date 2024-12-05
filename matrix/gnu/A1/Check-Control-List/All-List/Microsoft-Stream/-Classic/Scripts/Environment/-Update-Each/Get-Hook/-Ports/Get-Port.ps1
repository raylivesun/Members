#!/home/admin/app/PowerShell/Members

# Port Connections for MongoDB and Memcached servers
$ConfirmPreference = 'High'
$MongoDBPorts = '27017'
$MecahedPorts = '11211'

# MongoDB Servers
$MongoDBServers = @('mongodb://localhost:27017')

# Memcached Servers
$MemcachedServers = @('localhost:11211')

# Function to check MongoDB connection
function Test-MongoDBConnection {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Server
    )

    try {
        $mongoConnection = New-Object MongoDB.MongoClient($Server)
        $mongoConnection.ListDatabases()
        Write-Host "MongoDB connection successful: $Server"
    }
    catch {
        Write-Host "MongoDB connection failed: $Server - $_"
    }
}

# Function to check Memcached connection
function Test-MemcachedConnection {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Server
    )

    try {
        $memcached = New-Object Memcached.memcached($Server)
        $memcached.Get('test')
        Write-Host "Memcached connection successful: $Server"
    }
    catch {
        Write-Host "Memcached connection failed: $Server - $_"
    }
}

# Check MongoDB connections
foreach ($server in $MongoDBServers) {
    Test-MongoDBConnection -Server $server
}

# Check Memcached connections
foreach ($server in $MemcachedServers) {
    Test-MemcachedConnection -Server $server
}

Write-Host "MongoDB and Memcached connection tests completed."
Write-Host "Please check the PowerShell script output for detailed results."
Write-Host $MecahedPorts "MongoDB ports:" $MongoDBPorts
