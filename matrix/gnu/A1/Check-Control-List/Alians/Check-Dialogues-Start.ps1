#!/home/admin/app/PowerShell/Members

# connection string to the Start DB database
function PowerShellStartDBConnection  {
    param (
        [Parameter(Mandatory=$true)]
        [string]$server,
        [Parameter(Mandatory=$true)]
        [string]$database
    )

    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = "Server=$server;Database=$database;Integrated Security=True;"
    $connection.Open()

    return $connection
}


# function to retrieve all members from the Start DB database
function Get-StartDBMembers {
    param (
        [Parameter(Mandatory=$true)]
        [System.Data.SqlClient.SqlConnection]$connection
    )

    $command = New-Object System.Data.SqlClient.SqlCommand("SELECT * FROM Members;", $connection)
    $reader = $command.ExecuteReader()

    $members = @()
    while ($reader.Read()) {
        $members += [PSCustomObject]@{
            Id = $reader["Id"]
            FirstName = $reader["FirstName"]
            LastName = $reader["LastName"]
            Email = $reader["Email"]
            PhoneNumber = $reader["PhoneNumber"]
            Address = $reader["Address"]
            City = $reader["City"]
            State = $reader["State"]
            ZipCode = $reader["ZipCode"]
            Country = $reader["Country"]
            DateCreated = $reader["DateCreated"]
            DateUpdated = $reader["DateUpdated"]
        }

        Write-Output "Member retrieved: Id=$($members[-1].Id), FirstName=$($members[-1].FirstName), LastName=$($members[-1].LastName)"
    }
    $reader.Close()

    return $members
}


# main script
$server = "startdb.database.windows.net"
$database = "startdb"

$connection = PowerShellStartDBConnection -server $server -database $database
$members = Get-StartDBMembers -connection $connection

# save the retrieved members to a JSON file
$members | ConvertTo-Json -Depth 10 | Out-File -FilePath members.json

Write-Host "Members retrieved and saved to members.json"

