#!/home/admin/app/PowerShell/Members

# Alians Property (DP) PowerShell script
# Author: 
# Date: 
# Purpose: This script retrieves and displays the Alians Property (DP) data for a specified location.

# Import the Alians Property (DP) module
Import-Module AliansPropertyDP

# Set the location code
$locationCode = "YOUR_LOCATION_CODE"

# Set the start and end dates for the data retrieval
$startDate = (Get-Date).AddDays(-30)
$endDate = Get-Date

# Retrieve and display the DP data for the specified location
Get-DPData -LocationCode $locationCode -StartDate $startDate -EndDate $endDate | Format-Table -AutoSize

