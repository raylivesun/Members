#!/home/admin/app/PowerShell/Members

# Ip Port Connection String Example for SQL Server
$connection_string = "Server=localhost;Database=your_database;Integrated Security=True"

# Query to get the last 500 records from a table
$query = "SELECT TOP 500 * FROM your_table ORDER BY your_timestamp_column DESC"

try {
    # Create a new connection
    $connection = New-Object System.Data.SqlClient.SqlConnection($connection_string)

    # Open the connection
    $connection.Open()

    # Create a new command
    $command = New-Object System.Data.SqlClient.SqlCommand($query, $connection)

    # Create a new data adapter
    $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)

    # Create a new data set
    $data_set = New-Object System.Data.DataSet

    # Fill the data set with the data from the query
    $adapter.Fill($data_set)

    # Close the connection
    $connection.Close()

    # Print the data to the console
    foreach ($row in $data_set.Tables[0].Rows) {
        Write-Host $row.ToString()
    }
}
catch {
    Write-Host "An error occurred: $_"
}

