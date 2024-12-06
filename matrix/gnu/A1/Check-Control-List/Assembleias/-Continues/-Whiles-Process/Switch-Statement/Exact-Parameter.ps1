#!/home/admin/app/PowerShell/Members

# Exact Parameters to filter the results by in this script
$startDate = '2022-01-01'
$endDate = '2022-12-31'
$status = 'Active'

# Connect to Active Directory
$ad = New-Object System.DirectoryServices.DirectoryContext('AD', 'domain.com')

# Query Active Directory for all users who meet the specified criteria
$query = "(&(objectCategory=person)(objectClass=user)(status=$status)(lastLogonDate:gt=$startDate)(lastLogonDate:lt=$endDate))"
$users = Get-ADUser -SearchBase 'DC=domain,DC=com' -Filter $query -Properties *

# Export the filtered users to a CSV file
$users | Select-Object Name, SamAccountName, EmailAddress, LastLogonDate | Export-Csv -Path 'active_users.csv' -NoTypeInformation

# Print a success message
Write-Host "Filtered Active Users exported to 'active_users.csv'"
Write-Host "Total Users: $($users.Count)"
Write-Host "Start Date: $startDate"
Write-Host "End Date: $endDate"
Write-Host "Status: $status"
Write-Host "Powered by: PowerShell"
Write-Host "Press any key to exit..."
Write-Host "$_ $ad.Name"
