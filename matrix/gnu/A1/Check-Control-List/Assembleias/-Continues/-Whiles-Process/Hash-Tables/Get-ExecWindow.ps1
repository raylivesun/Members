#!/home/admin/app/PowerShell/Members

# Get Exec windows processes (those running as SYSTEM)
$processes = Get-Process | Where-Object { $_.UserName -eq 'SYSTEM' }

# Format the output
$output = @"
+-------------------+--------------+-------------+-----------+
| Process Name     | ID          | CPU Usage (%) | Memory Usage (MB) |
+-------------------+--------------+-------------+-----------+
"@

foreach ($process in $processes) {
    $cpuUsage = [math]::Round(($process.CPU * 100) / $process.ParentProcess.CPU, 2)
    $memoryUsage = [math]::Round($process.WorkingSet64 / 1MB, 2)
    $output += "{0,-20} | {1,-10} | {2,-11} | {3,-14}" -f $process.ProcessName
    $process.Id, $cpuUsage, $memoryUsage
}

$output


