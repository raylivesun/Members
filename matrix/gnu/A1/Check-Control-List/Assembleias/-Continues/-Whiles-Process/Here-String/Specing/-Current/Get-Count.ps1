#!/home/admin/app/PowerShell/Members

# Get Count of Members in the Database with Age greater than 30
$members = Get-ADUser -Filter {Enabled -eq $true -And Age -gt 30 } | Measure-Object -Property Name | Select-Object Count

Write-Host "Number of Members Aged 30 or More: $members.count"
    