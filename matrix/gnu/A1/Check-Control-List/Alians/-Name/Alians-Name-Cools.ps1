#!/home/admin/app/PowerShell/Members

# Alians Name Cools for PowerShell Script Execution
$alians = @'
Get-Process | Where-Object { $_.CPU -gt 50 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS -gt 10000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 10 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 50 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 100 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 500 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 1000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 5000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 10000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 50000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 100000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 500000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 1000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 5000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 10000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 50000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 100000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 500000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 1000000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 5000000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 10000000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 50000000000 } | Select-Object -First 5
Get-Process | Where-Object { $_.WS / $_.PrivateWS -gt 100000000000 } | Select-Object -First
'@

# Execute PowerShell Script
Invoke-Expression -Command $alians


