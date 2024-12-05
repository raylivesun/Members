#!/home/admin/app/PowerShell/Members

# Alians PostgreSQL connection strings for different environments
$devDB = 'Server=localhost;Database=dev_db;User Id=postgres;Password=your_password'
$testDB = 'Server=localhost;Database=test_db;User Id=postgres;Password=your_password'
$prodDB = 'Server=localhost;Database=prod_db;User Id=postgres;Password=your_password'

# Function to retrieve all members from a given database
function Get-MembersFromDB {
    param (
        [Parameter(Mandatory=$true)]
        [string]$connectionString
    )

    try {
        # Connect to the PostgreSQL database
        $conn = New-Object System.Data.SqlClient.SqlConnection($connectionString)
        $conn.Open()

        # Retrieve all members from the 'members' table
        $sql = "SELECT * FROM members"
        $cmd = New-Object System.Data.SqlClient.SqlCommand($sql, $conn)
        $reader = $cmd.ExecuteReader()

        # Process each row in the result set
        while ($reader.Read()) {
            $id = $reader['id']
            $name = $reader['name']
            $email = $reader['email']

            Write-Host "ID: $id, Name: $name, Email: $email"
        }

        $reader.Close()
        $conn.Close()
        "Successfully retrieved members from database."

    } catch {
        Write-Host "An error occurred while retrieving members: $_"
    }
    finally {
        if ($null -ne $conn) {
            $conn.Close()
        }
    }
}

# Call the function for each environment
Get-MembersFromDB -connectionString $devDB
Get-MembersFromDB -connectionString $testDB
Get-MembersFromDB -connectionString $prodDB
