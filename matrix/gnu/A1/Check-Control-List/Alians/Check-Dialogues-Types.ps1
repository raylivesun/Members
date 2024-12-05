#!/home/admin/app/PowerShell/Members

# connection string to your types database
function PowerShellDatabaseTypes {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConnectionString
    )

    return [System.Data.SqlClient.SqlConnection]$ConnectionString
}

# function to execute SQL query and return result
function ExecuteSQLQuery {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConnectionString,
        [Parameter(Mandatory=$true)]
        [string]$Query
    )
    try {
        $connection = PowerShellDatabase -ConnectionString $ConnectionString
        $connection.Open()
        $command = New-Object System.Data.SqlClient.SqlCommand($Query, $connection)
        $reader = $command.ExecuteReader()

        # process the result
        while ($reader.Read()) {
            $row = @{}
            foreach ($column in $reader.GetColumnNames()) {
                $row[$column] = $reader[$column]
            }
            $results += $row
        }

        $reader.Close()
        $connection.Close()
        return $results
    }
    catch {
        Write-Error $_
    }
}

# function to generate a list of members based on a given query
function GetMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConnectionString,
        [Parameter(Mandatory=$true)]
        [string]$Query
    )
    try {
        $results = ExecuteSQLQuery -ConnectionString $ConnectionString -Query $Query
        return $results
    }
    catch {
        Write-Error $_
    }
}

# main logic
$connectionString = "Data Source=your-server;Initial Catalog=types;Integrated Security=True"
$query = "SELECT * FROM Members"
$members = GetMembers -ConnectionString $connectionString -Query $query


if ($members) {
    Write-Host "List of Members:"
    Write-Host "-------------------"
} else {
    Write-Host "No members found"
}
    foreach ($member in $members) {
        Write-Host "Member Name: $($member.Name), Member ID: $($member.MemberID)"
    }
    Write-Host "Total Members: $($members.Count)"
    Write-Host "Average Age: $($members.Average([int]$member.Age))"
    Write-Host "Oldest Member: $($members | Sort-Object Age -Descending | Select-Object -First 1 | Select-Object Name, Age)"
    Write-Host "Youngest Member: $($members | Sort-Object Age | Select-Object -First 1 | Select-Object Name, Age)"
    Write-Host "Members with Age between 25 and 30: $($members | Where-Object Age -ge 25 -and Age -le 30)"
    Write-Host "Members with Email Domain 'example.com': $($members | Where-Object Email -like '*@example.com')"
    Write-Host "Members with Phone Number starting with '123': $($members | Where-Object PhoneNumber -like '123*')"
    Write-Host "Members with Membership Status 'Active': $($members | Where-Object MembershipStatus -eq 'Active')"
    Write-Host "Members with Membership Status 'Inactive' or 'Expired': $($members | Where-Object MembershipStatus -eq 'Inactive' -or MembershipStatus -eq 'Expired')"
    Write-Host "Members with a Membership Expiration Date in the next 30 days: $($members | Where-Object { [datetime]::Now -lt $_.MembershipExpirationDate})"
   
    

 
