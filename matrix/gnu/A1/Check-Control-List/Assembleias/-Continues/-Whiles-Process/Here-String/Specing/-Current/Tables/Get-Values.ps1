#!/home/admin/app/PowerShell/Members

# Get Values from Parameters passed to the script
$server = $args[0]
$database = $args[1]
$username = $args[2]
$password = $args[3]
$backupPath = $args[4]

# Connect to the SQL Server
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = "Server=$server;Database=$database;Integrated Security=False;User ID=$username;Password=$password"
$connection.Open()

# Get the list of tables in the database
$tables = Get-ChildItem -Path "Database:\$database\Tables" -Recurse | Where-Object { $_.PSIsContainer -eq $false } | Select-Object Name

# Backup each table
foreach ($table in $tables) {
    $backupName = "{0}_{1}_{2:yyyyMMdd}.bak" -f $database, $table.Name, (Get-Date)
    $backupFile = Join-Path $backupPath $backupName

    # Create a new backup file
    $backupCommand = "BACKUP DATABASE [$database] TO DISK = N'$backupFile' WITH FORMAT, NAME = N'$backupName'"
    $command = New-Object System.Data.SqlClient.SqlCommand($backupCommand, $connection)
    
    try {
        # Execute the backup command
        $command.ExecuteNonQuery()
        Write-Host "Backup of table $table completed successfully."
    }
    catch {
        Write-Host "Error backing up table $table $_"
    }
    finally {
        # Close the connection
        $connection.Close()
    }
}

Write-Host "Backup process completed."
Write-Host "Backup files saved to $backupPath"
Write-Host "Press any key to continue..."
Read-Key
Write-Host "$table Backup"
Write-Host "Table Name" | Out-File -FilePath "$backupPath\table_names.txt" -Append
foreach ($table in $tables) {
    Write-Host $table.Name | Out-File -FilePath "$backupPath\table_names.txt" -Append
}



