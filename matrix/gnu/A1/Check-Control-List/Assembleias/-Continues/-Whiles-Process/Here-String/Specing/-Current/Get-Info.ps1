#!/home/admin/app/PowerShell/Members

# Get Info the first 100 members of the PowerShell Team
$members = Get-ADUser -Filter {Enabled -eq $true -and MemberOf -like "*PowerShell*" -and ObjectClass -eq "user" } | Select-Object Name, Department, LastLogonDate, LastLogonTime, @{Name="LogonCount";
        Expression={Get-ADUser -Identity $_ -Properties LogonCount | Select-Object -ExpandProperty LogonCount}} | Sort-Object LastLogonDate -Descending | Limit 1
        # | Format-Table -AutoSize
        # | Out-GridView
        # | Select-Object -First 100

# Calculate the average logon count for all PowerShell Team members
$averageLogonCount = $members.LogonCount | Measure-Object -Average

# Calculate the median logon count for all PowerShell Team members
$medianLogonCount = $members.LogonCount | Sort-Object | Select-Object -Index ((($members.Count - 1) / 2).Ceiling())

# Calculate the number of PowerShell Team members who logged on more than the average
$membersMoreThanAverage = $members | Where-Object { $_.LogonCount -gt $averageLogonCount } | Measure-Object -Count

# Calculate the number of PowerShell Team members who logged on more than the median
$membersMoreThanMedian = $members | Where-Object { $_.LogonCount -gt $medianLogonCount } | Measure-Object -Count

# Output the results
Write-Host "Average Logon Count: $averageLogonCount"
Write-Host "Median Logon Count: $medianLogonCount"
Write-Host "Number of Members Who Logged on More Than the Average: $membersMoreThanAverage"
Write-Host "Number of Members Who Logged on More Than the Median: $membersMoreThanMedian"
