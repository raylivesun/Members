#!/home/admin/app/PowerShell/Members

# connection string to the Safes database
function Get-SafesDatabaseConnectionString {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DatabaseServer,

        [Parameter(Mandatory=$true)]
        [string]$DatabaseName,

        [Parameter(Mandatory=$true)]
        [string]$DatabaseUsername,

        [Parameter(Mandatory=$true)]
        [SecureString]$DatabasePassword
    )
    return "Server=$DatabaseServer;Database=$DatabaseName;Uid=$DatabaseUsername;Pwd=$DatabasePassword;"
}


# Get the connection string to the Safes database
$connectionString = Get-SafesDatabaseConnectionString -DatabaseServer "localhost" -DatabaseName "safes" -DatabaseUsername "admin" -DatabasePassword (ConvertTo-SecureString -String "password" -AsPlainText -Force)

# Connect to the Safes database
$connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
$connection.Open()

# Define the SQL query to retrieve the member data
$query = @"
SELECT 
    m.MemberId,
    m.FirstName,
    m.LastName,
    m.Email,
    m.PhoneNumber,
    m.DateOfBirth,
    m.Gender,
    m.Address,
    m.City,
    m.State,
    m.ZipCode,
    m.Country,
    m.PreferredLanguage,
    m.PreferredCurrency,
    m.PreferredPaymentMethod,
    m.PreferredContactMethod,
    m.PreferredCommunicationMethod,
    m.PreferredDeliveryMethod,
    m.PreferredShippingMethod,
    m.PreferredReturnMethod,
    m.PreferredPaymentTerms,
Select
"@

# Execute the SQL query
$command = New-Object System.Data.SqlClient.SqlCommand $query -Connection $connection
$reader = $command.ExecuteReader()

# Print the header row
Write-Output "MemberId,FirstName,LastName,Email,PhoneNumber,DateOfBirth,Gender,Address,City,State,ZipCode,Country,PreferredLanguage,PreferredCurrency,PreferredPaymentMethod,PreferredContactMethod,PreferredCommunicationMethod,PreferredDeliveryMethod,PreferredShippingMethod,PreferredReturnMethod"

# Print the member data
while ($reader.Read()) {
    Write-Output ("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28}" -f
    $reader.GetSqlValue(0),
    $reader.GetSqlValue(1),
    $reader.GetSqlValue(2),
    $reader.GetSqlValue(3),
    $reader.GetSqlValue(4),
    $reader.GetSqlValue(5),
    $reader.GetSqlValue(6),
    $reader.GetSqlValue(7),
    $reader.GetSqlValue(8),
    $reader.GetSqlValue(9),
    $reader.GetSqlValue(10),
    $reader.GetSqlValue(11),
    $reader.GetSqlValue(12),
    $reader.GetSqlValue(13),
    $reader.GetSqlValue(14),
    $reader.GetSqlValue(15),
    $reader.GetSqlValue(16),
    $reader.GetSqlValue(17),
    $reader.GetSqlValue(18),
    $reader.GetSqlValue(19),
    $reader.GetSqlValue(20),
    $reader.GetSqlValue(21),
    $reader.GetSqlValue(22),
    $reader.GetSqlValue(23),
    $reader.GetSqlValue(24),
    $reader.GetSqlValue(25),
    $reader.GetSqlValue(26),
    $reader.GetSqlValue(27),
    $reader.GetSqlValue(28))
}

# Close the connection to the Safes database
$connection.Close()

