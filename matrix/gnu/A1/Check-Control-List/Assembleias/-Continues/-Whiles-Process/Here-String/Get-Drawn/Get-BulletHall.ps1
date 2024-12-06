#!/home/admin/app/PowerShell/Members

# Bullet Hall variables Connection String and SQL Query
$connectionString = "Data Source=localhost;Initial Catalog=bullet_hall;User ID=bullet_hall_user;Password=bullet_hall_password;"
$sqlQuery = "SELECT * FROM bullet_hall_table"

try {
    # Establishing connection to SQL Server
    $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
    $connection.Open()

    # Creating a new SQL command
    $command = New-Object System.Data.SqlClient.SqlCommand($sqlQuery, $connection)

    # Creating a new SQL data adapter and filling the data table
    $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
    $dataTable = New-Object System.Data.DataTable
    $adapter.Fill($dataTable)

    # Closing the SQL connection
    $connection.Close()

    # Displaying the data table
    $dataTable
}
catch {
    Write-Host "An error occurred: $_"
}
