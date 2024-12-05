#!/home/admin/app/PowerShell/Members

# Alins Append PowerTools to the PowerShell profile for easy access MissingTypes, Export-CsvAsHtml, etc.
Import-Module -Name AlinsAppendPowerTools

# Import the CSV file
$csv = Import-Csv -Path.\members.csv

# Loop through each row in the CSV file
foreach ($row in $csv) {
    # Create a new object from the row data
    $member = New-Object PSObject -Property @{
        Name          = $row.Name
        Email         = $row.Email
        PhoneNumber   = $row.PhoneNumber
        MembershipType = $row.MembershipType
        JoinDate       = $row.JoinDate
    }

    # Add the new object to the array
    $members += $member
}

# Sort the array by membership type and join date
$members | Sort-Object MembershipType, JoinDate | Format-Table -AutoSize

# Export the sorted array to an HTML file
$members | Sort-Object MembershipType, JoinDate | Export-CsvAsHtml -OutputPath members.html -Width 800





