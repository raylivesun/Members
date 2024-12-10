#!/home/admin/app/PowerShell/Members

# Select key lords with a specific age range
$keyLords = Get-ADUser -Filter {
    ObjectClass -eq 'user' -and
    Age -ge 50 -and
    Age -le 65 -and
    (Enabled -eq $true) -and
    (MemberOf -like '*CN=Key Lords,OU=Key Lords,DC=example,DC=com*')
}

# Get the list of key lord emails
$keyLordEmails = $keyLords | Select-Object -ExpandProperty Mail

# Get the list of key lord names
$keyLordNames = $keyLords | Select-Object -ExpandProperty Name

# Create a CSV file with the key lord emails and names
$outputCsv = "KeyLord Emails.csv"
$csvHeader = "Email,Name"

# Write the CSV header
[System.IO.File]::WriteAllText($outputCsv, $csvHeader)

# Write each key lord's email and name to the CSV file
foreach ($email in $keyLordEmails) {
    $row = "$email,$keyLordNames[$keyLordEmails.IndexOf($email)]"
    [System.IO.File]::AppendAllText($outputCsv, $row)
}

# Display a success message
Write-Host "Key lord emails and names have been exported to '$outputCsv'"
