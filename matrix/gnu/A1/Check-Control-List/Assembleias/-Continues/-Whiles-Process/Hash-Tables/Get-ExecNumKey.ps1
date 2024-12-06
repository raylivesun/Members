#!/home/admin/app/PowerShell/Members

# Get Exec Numeric IDs of all members in the domain (for security reasons, do not hardcode IDs)
$members = Get-ADUser -Filter {Enabled -eq $true } -Properties MemberOf
$execNumericIds = $members.MemberOf | Where-Object { $_ -like '*\Executive*' } | ForEach-Object { $_.Identity.Value.Split(',')[
    0] } -split '\\' | Select-Object -Last 1

# Write the Executive Numeric IDs to a log file
$logFilePath = "executive_numeric_ids.log"
Write-Information "Executing Numeric IDs of Executive Members: {Join-String, ', '}" $execNumericIds
Wait-Debugger "Waiting for debugger to attach... Press any key to continue."

# Save the Executive Numeric IDs to a file
$execNumericIds | Set-Content -Path $logFilePath
# Get the number of Executive Members
$executiveMembersCount = $execNumericIds.Count
Write-Information "Number of Executive Members: $executiveMembersCount"

# Get the average age of Executive Members
$execMembersAge = $members | Where-Object { $_.Enabled -eq $true -and $_.MemberOf | Where-Object { $_ -like '*\Executive*' } } | ForEach-Object (Get-Date -Usec $_.AccountExpirationDate).
Write-Information "Average Age of Executive Members: {($execMembersAge / $executiveMembersCount).ToString('N2')} years"    
