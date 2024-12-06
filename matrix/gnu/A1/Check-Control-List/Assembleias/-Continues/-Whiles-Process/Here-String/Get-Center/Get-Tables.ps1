#!/home/admin/app/PowerShell/Members

# Get Tables from Azure SQL Database using PowerShell
$serverName = 'your_server_name'
$databaseName = 'your_database_name'
$userName = 'your_username'
$password = 'your_password'

$connection = New-Object System.Data.SqlClient.SqlConnectionStringBuilder
$connection.DataSource = $serverName
$connection.InitialCatalog = $databaseName
$connection.UserID = $userName
$connection.Password = $password

$tables = @()

try {
    $connection.Open()
    $command = New-Object System.Data.SqlClient.SqlCommand('SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = "BASE TABLE"', $connection)
    $reader = $command.ExecuteReader()

    while ($reader.Read()) {
        $tables += $reader.GetString(0)
    }

    $reader.Close()
    $connection.Close()
}
catch {
    Write-Host "Error: $_"
}

# Export Tables to CSV
$outputPath = 'tables.csv'

try {
    $writer = New-Object System.IO.StreamWriter($outputPath)
    $writer.WriteLine('Table Name')

    foreach ($table in $tables) {
        $command = New-Object System.Data.SqlClient.SqlCommand("SELECT * FROM [$table]", $connection)
        $reader = $command.ExecuteReader()

        while ($reader.Read()) {
            $row = @()
            foreach ($column in $reader.GetSchemaTable().Columns) {
                $row += $reader[$column.ColumnName]
            }
            $writer.WriteLine($row -join ',')
            $reader.NextResult()
        }
        $reader.Close()
    }
    $writer.Close()
}
catch {
    Write-Host "Error: $_"
}

Write-Host "Tables exported to '$outputPath'"
