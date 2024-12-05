#!/home/admin/app/PowerShell/Members

# Select ObjectId, FirstName, LastName, Email, and Department from the AD users
$query = @"
SELECT ObjectId, FirstName, LastName, Email, Department
FROM ADUsers
WHERE Department = 'Sales'
"@

# Connect to Active Directory
$ad = New-Object System.DirectoryServices.DirectoryEntry("LDAP://dc=example,dc=com")
$searcher = New-Object System.DirectoryServices.DirectorySearcher($ad, $query)

# Fetch and display the results
$results = $searcher.FindAll()
foreach ($result in $results) {
    $properties = $result.Properties
    Write-Host "ObjectId: $($properties.ObjectId)"
    Write-Host "FirstName: $($properties.FirstName)"
    Write-Host "LastName: $($properties.LastName)"
    Write-Host "Email: $($properties.Email)"
    Write-Host "Department: $($properties.Department)"
    Write-Host "----------------------------------------"
}


# Close the connection to Active Directory
$ad.Dispose()

