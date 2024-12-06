#!/home/admin/app/PowerShell/Members

# Get Exec Tables and Databases from sys.sysobjects
$execTables = Get-DbaExecTable -SqlInstance localhost -Database master -ExcludeDatabase 'tempdb'
$databases = Get-DbaDatabase -SqlInstance localhost -ExcludeDatabase 'tempdb'

# Create a new table to store the results
New-Object -TypeName PSObject -Property @{
    TableName = 'Sys.sysobjects'
    ExecTableCount = $execTables.Count
    DatabaseCount = $databases.Count
}

# Loop through each table and add a row to the results table
foreach ($table in $execTables) {
    New-Object -TypeName PSObject -Property @{
        TableName = $table.Name
        ExecTableCount = $execTables.Count
        DatabaseCount = $databases.Count
    }
    Add-Content -Path .\Sys.sysobjects.csv -Value ($_.ToTableString() -replace '","', ',')
}

# Loop through each database and add a row to the results table
foreach ($database in $databases) {
    New-Object -TypeName PSObject -Property @{
        TableName = $database.Name
        ExecTableCount = $execTables.Count
        DatabaseCount = $databases.Count
    }
    Add-Content -Path .\Sys.sysobjects.csv -Value ($_.ToTableString() -replace '","', ',')
}


# Sort the results table by ExecTableCount in descending order
Sort-Object -Property ExecTableCount -Descending -InputObject (Get-Content .\Sys.sysobjects.csv) | Set-Content .\Sys.sysobjects.csv

# Display the top 10 results
Get-Content .\Sys.sysobjects.csv | Select-Object -First 10

