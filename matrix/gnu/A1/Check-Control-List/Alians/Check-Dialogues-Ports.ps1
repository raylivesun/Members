#!/home/admin/app/PowerShell/Members

# connection string to the Port's database
function PowerShellPorts {
    param(
        [Parameter(Mandatory=$true)]
        [string]$connectionString
    )

    $connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
    $connection.Open()

    $command = New-Object System.Data.SqlClient.SqlCommand("SELECT * FROM PowerShellPorts", $connection)
    $reader = $command.ExecuteReader()

    while ($reader.Read()) {
        Write-Output @{
            Name = $reader['Name']
            Description = $reader['Description']
            Version = $reader['Version']
            Author = $reader['Author']
            LastUpdated = $reader['LastUpdated']
        }
    }
    $reader.Close()
    $connection.Close()
}

# call the function with the connection string
$connectionString = "Data Source=localhost;Initial Catalog=PowerShellPorts;Integrated Security=True"
PowerShellPorts $connectionString


