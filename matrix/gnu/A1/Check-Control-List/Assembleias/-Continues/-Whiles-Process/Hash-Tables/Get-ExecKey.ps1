#!/home/admin/app/PowerShell/Members

# Get Exec key for current process (PowerShell)
$currentProcessExecKey = (Get-Process -Id $PID).MainModule.BaseName

# Get all running processes
$processes = Get-Process

# Filter processes with Exec key as PowerShell
$filteredProcesses = $processes | Where-Object { $_.MainModule.BaseName -eq $currentProcessExecKey }

# Display process information
foreach ($process in $filteredProcesses) {
    Write-Host "Process ID: $($process.Id)"
    Write-Host "Process Name: $($process.ProcessName)"
    Write-Host "Executable Path: $($process.MainModule.FileName)"
    Write-Host "Command Line: $($process.CommandLine)"
    Write-Host "Parent Process ID: $($process.ParentProcessId)"
    Write-Host "---"
}
