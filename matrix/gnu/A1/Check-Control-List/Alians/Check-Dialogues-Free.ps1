#!/home/admin/app/PowerShell/Members

# connection string for your DBFree values
function PowerShellDBFree { 
    $connectionString = "Server=localhost;Database=your_database;Uid=your_username;Pwd=your_password;"
    return $connectionString
}

# Function to get members from DBFree
function Get-MembersFromDBFree {
    $connectionString = PowerShellDBFree
    $query = "SELECT * FROM members"

    try {
        $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
        $connection.Open()

        $command = New-Object System.Data.SqlClient.SqlCommand($query, $connection)
        $reader = $command.ExecuteReader()

        $members = @()
        while ($reader.Read()) {
            $members += [PSCustomObject]@{
                Id = [int]$reader["id"]
                FirstName = $reader["first_name"]
                LastName = $reader["last_name"]
                Email = $reader["email"]
            }
            $members | Format-Table Id, FirstName, LastName, Email -AutoSize
        }
        $reader.Close()
        $connection.Close()
        return $members
    }
    catch {
        Write-Error "An error occurred while connecting to the database: $_"
    }
}

# Function to get members from DBLocal
function Get-MembersFromDBLocal {
    $connectionString = "Server=localhost;Database=your_database;Uid=your_username;Pwd=your_password;"
    $query = "SELECT * FROM members"

    try {
        $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
        $connection.Open()

        $command = New-Object System.Data.SqlClient.SqlCommand($query, $connection)
        $reader = $command.ExecuteReader()

        $members = @()
        while ($reader.Read()) {
            $members += [PSCustomObject]@{
                Id = [int]$reader["id"]
                FirstName = $reader["first_name"]
                LastName = $reader["last_name"]
                Email = $reader["email"]
            }
            $members | Format-Table Id, FirstName, LastName, Email -AutoSize
        }
        $reader.Close()
        $connection.Close()
        return $members
    }
    catch {
        Write-Error "An error occurred while connecting to the database: $_"
    }
}

# Function to sync members between DBFree and DBLocal
function Sync-Members {
    $membersFromDBFree = Get-MembersFromDBFree
    $membersFromDBLocal = Get-MembersFromDBLocal

    foreach ($memberFromDBFree in $membersFromDBFree) {
        $memberFromDBLocal = $membersFromDBLocal | Where-Object Id -eq $memberFromDBFree.Id

        if ($null -eq $memberFromDBLocal) {
            # Member not found in DBLocal, insert it
            $connectionString = PowerShellDBLocal
            $query = "INSERT INTO members (first_name, last_name, email) VALUES ('{0}', '{1}', '{2}')" -f $memberFromDBFree.FirstName
            $query = $query.Replace("'", "''")

            try {
                $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
                $connection.Open()

                $command = New-Object System.Data.SqlClient.SqlCommand($query, $connection)
                $command.ExecuteNonQuery()
                Write-Host "Inserted member: $($memberFromDBFree.FirstName) $($memberFromDBFree.LastName) ($($memberFromDBFree.Email))"
                $connection.Close()
            }
            catch {
                Write-Error "An error occurred while inserting member: $_"
            }
        }
        else {
            # Member found in DBLocal, update it if necessary
            $updateNeeded = $false
            if ($memberFromDBLocal.FirstName -ne $memberFromDBFree.FirstName) {
                $updateNeeded = $true
            }
            if ($memberFromDBLocal.LastName -ne $memberFromDBFree.LastName) {
                $updateNeeded = $true
            }
            if ($memberFromDBLocal.Email -ne $memberFromDBFree.Email) {
                $updateNeeded = $true
            }

            if ($updateNeeded) {
                $connectionString = PowerShellDBLocal
                $query = "UPDATE members SET first_name='{0}', last_name='{1}', email='{2}' WHERE id={3}" -f $memberFromDBFree.
                FirstName, $memberFromDBFree.LastName, $memberFromDBFree.Email, $memberFromDBFree.Id
                $query = $query.Replace("'", "''")

                try {
                    $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
                    $connection.Open()

                    $command = New-Object System.Data.SqlClient.SqlCommand($query, $connection)
                    $command.ExecuteNonQuery()
                    Write-Host "Updated member: $($memberFromDBFree.FirstName) $($memberFromDBFree.LastName) ($($memberFromDBFree.Email))"
                    $connection.Close()
                }
                catch {
                    Write-Error "An error occurred while updating member: $_"
                }
            }
            else {
                Write-Host "Member $($memberFromDBFree.FirstName) $($memberFromDBFree.LastName) ($($memberFromDBFree.Email)) is up to date"
                }
            }

            Write-Host "Sync completed"
        }
        catch {
            Write-Error "An error occurred while syncing members: $_"
        }
    }
    # End of script
    