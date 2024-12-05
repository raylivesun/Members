#!/home/admin/app/PowerShell/Members

# connection string to your connect Database
function PowerShellConnection { 
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConnectionString
    )
    $connection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString
    $connection.Open()
    $connection
}

# Get all members from the database
function Get-Members {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConnectionString
    )
    $connection = PowerShellConnection $ConnectionString
    $command = "SELECT * FROM Members"
    $reader = $connection.ExecuteReader($command)

    while ($reader.Read()) {
        $member = @{
            Id = $reader.GetSqlInt32(0)
            Name = $reader.GetSqlString(1)
            Email = $reader.GetSqlString(2)
            PhoneNumber = $reader.GetSqlString(3)
            Address = $reader.GetSqlString(4)
        }
        Write-Output $member
    }
    $reader.Close()
    $connection.Close()
}

# Main function to process and export members
function Main {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConnectionString
    )
    Get-Members -ConnectionString $ConnectionString | Export-Csv -Path members.csv -NoTypeInformation
}

# Call the main function
Main -ConnectionString "Data Source=your_server;Initial Catalog=your_database;Integrated Security=True"

