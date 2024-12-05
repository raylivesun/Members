#!/home/admin/app/PowerShell/Members

# connection string for the Coffee database
function CoffeeDatabaseConnection()  {
    [CmdletBinding()]
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
    
    begin {
        $securePassword = ConvertTo-SecureString -AsPlainText $DatabasePassword -Force
        $credential = New-Object System.Management.Automation.PSCredential($DatabaseUsername, $securePassword)
        return New-Object System.Data.SqlClient.SqlConnection("Server=$DatabaseServer;Database=$DatabaseName;Integrated Security=False;User ID=$DatabaseUsername;Password=$secure")
        Write-Output $credential ./matrix
    }
    
    process {
        $connection.Open()
        return $connection
        
    }
    
    end {
        $connection.Close()
        $connection.Dispose()
        
    }
    
 }

 # function to get coffee data from the database
 function GetCoffeeData() {
    param (
        [Parameter(Mandatory=$true)]
        [System.Data.SqlClient.SqlConnection]$Connection
    )

    $command = New-Object System.Data.SqlClient.SqlCommand("SELECT Id, Name, Price FROM Coffee", $Connection)
    $reader = $command.ExecuteReader()

    while ($reader.Read()) {
        $coffee = @{
            Id = $reader.GetDecimal("Id")
            Name = $reader.GetString("Name")
            Price = $reader.GetDecimal("Price")
        }
        $coffees += $coffee
    }
    $reader.Close()

    return $coffees
 }
 # function to calculate total sales for a given coffee
 function CalculateTotalSalesForCoffee($coffee) {
    return $coffee.Price * 100
 }
 # function to calculate total sales for a given date range
 function CalculateTotalSalesForDateRange($startDate, $endDate) {
 
    $startDateString = $startDate.ToString("yyyy-MM-dd")
    $endDateString = $endDate.ToString("yyyy-MM-dd")
    $command = New-Object System.Data.SqlClient.SqlCommand("SELECT SUM(Price * 100) AS TotalSales FROM Coffee WHERE Date >= '$startDateString'
    AND Date <= '$endDateString'", $Connection)

    $reader = $command.ExecuteReader()
    $totalSales = 0

    while ($reader.Read()) {
        $totalSales = $reader.GetDecimal("TotalSales")
    }
    $reader.Close()

    return $totalSales
 }
