#!/home/admin/app/PowerShell/Members

# The Pivot Table module must be installed
# Install-Module -Name PivotTable

# Load the required modules
Import-Module ActiveDirectory
Import-Module PivotTable

# Set the Active Directory path
$adPath = "DC=yourdomain,DC=com"

# Get all users in the organization
$users = Get-ADUser -Filter * -SearchBase $adPath

# Create a PivotTable object
$pivotTable = New-Object PivotTable

# Define the data source
$pivotTable.DataSource = $users

# Define the pivot table structure
$pivotTable.Rows.Add("ObjectClass")
$pivotTable.Rows.Add("Enabled")
$pivotTable.Rows.Add("AccountExpirationDate")
$pivotTable.Columns.Add("LastLogon")

# Define the pivot table values
$pivotTable.Values.Add("Count", "ObjectClass", "ObjectClass")
$pivotTable.Values.Add("Sum", "AccountExpirationDate", "AccountExpirationDate")
$pivotTable.Values.Add("Min", "LastLogon", "LastLogon")
$pivotTable.Values.Add("Max", "LastLogon", "LastLogon")

# Generate the pivot table
$pivotTable.GenerateTable()

# Export the pivot table to a CSV file
$pivotTable.ExportToCsv("C:\Users\Admin\Desktop\user_pivot_table.csv")
