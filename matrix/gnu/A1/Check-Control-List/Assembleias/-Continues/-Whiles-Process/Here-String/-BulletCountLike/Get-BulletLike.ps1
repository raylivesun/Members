#!/home/admin/app/PowerShell/Members

# Get Bullet like numbers for each record in the CSV file
$bullets = 1..($env:CSV_FILE_PATH.Split("\\").Last() -replace ".csv", "") | ForEach-Object { "• $_" }

# Read the CSV file into a PSObject array
$records = Import-Csv -Path $env:CSV_FILE_PATH

# Loop through each record
foreach ($record in $records) {
    # Get the bullet for the current record
    $bullet = $bullets[$record.Id - 1]

    # Print the bullet and the corresponding record fields
    Write-Host "$bullet $($record.Name) - $($record.Email)"
}

# Get the total number of records in the CSV file
$totalRecords = $records.Count

# Print the total number of records
Write-Host "Total Records: $totalRecords"

