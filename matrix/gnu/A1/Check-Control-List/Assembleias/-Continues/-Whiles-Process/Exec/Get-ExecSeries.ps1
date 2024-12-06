#!/home/admin/app/PowerShell/Members

# Get Exec Witch History (EWH) log file path
$ewh_log_path=$(find /var/log/ewh -name "ewh_log_*.txt" | sort | tail -n 1)

# Get last 1000 lines of EWH log
$ewh_log_tail = Get-Content -Path $ewh_log_path -Tail 1000

# Find all EWH entries that contain the string "Error"
$ewh_errors = $ewh_log_tail | Where-Object { $_ -like "*Error*" }

# Print the number of EWH errors found
Write-Host "Number of EWH errors found: $($ewh_errors.Count)"

# Print the first 10 EWH errors
Write-Host "First 10 EWH errors:"
$ewh_errors | Select-Object -First 10



