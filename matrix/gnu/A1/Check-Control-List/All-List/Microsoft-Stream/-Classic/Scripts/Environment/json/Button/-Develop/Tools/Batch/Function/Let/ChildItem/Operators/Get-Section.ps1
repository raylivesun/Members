#!/home/admin/app/PowerShell/Members

# Alians connection string and credentials
$connectionString = "your_connection_string"
$username = "your_username"
$password = "your_password"

# check if all required parameters are provided
if ($null -eq $connectionString -or $null -eq $username -or $null -eq $password) {
    Write-Host "Error: Connection string, username, and password are required."
    exit 1
}

# Get the current date and time
$currentDate = Get-Date -Format yyyy-MM-dd

# Connect to the Alians database
$connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
$connection.Open()

try {
    # Create a new command object
    $command = New-Object System.Data.SqlClient.SqlCommand()
    $command.Connection = $connection

    return $command
}
catch {
    Write-Host "Error connecting to Alians database: $_"
    $connection.Close()
    exit 1
}
finally {
    # Close the database connection
    if ($connection.State -ne [System.Data.ConnectionState]::Closed) {
        $connection.Close()
    }
}
