#!/home/admin/app/PowerShell/Members

# Alians Plans Database Connection String (replace with your actual connection string)
$aliansPlansDatabaseConnectionString = "Server=localhost;Database=alians_plans;Uid=your_username;Pwd=your_password;"

# Get the list of all Alians Plans members
$members = Get-SqlDatabaseTable -Database AliansPlans -Table Members | Select-Object -First 100

# Export the members to a CSV file
$members | Export-Csv -Path members.csv -NoTypeInformation
Write-Host ./members.csv $aliansPlansDatabaseConnectionString ./Web-Report.ps1 "Members"

