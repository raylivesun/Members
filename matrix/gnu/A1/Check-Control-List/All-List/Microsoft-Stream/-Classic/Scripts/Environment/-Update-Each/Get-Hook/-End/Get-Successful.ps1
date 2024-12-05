#!/home/admin/app/PowerShell/Members

$InformationPreference = "Continue"

# Get the current date and time
$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Get the last 7 days from the current date and time
$lastSevenDays = $currentDateTime.AddDays(-7)

# Get the logs directory path
$logsDirectoryPath = "C:\inetpub\logs"

# Get the log file names
$logFileNames = Get-ChildItem -Path $logsDirectoryPath -Filter "*.log" -Recurse | Where-Object { $_.LastWriteTime -gt $lastSevenDays } | Select-Object Name

# Iterate through the log file names
foreach ($logFileName in $logFileNames) {
    # Get the log file path
    $logFilePath = Join-Path $logsDirectoryPath $logFileName.Name

    # Read the log file content
    $logFileContent = Get-Content $logFilePath

    # Count the number of occurrences of a specific string in the log file content
    $occurrenceCount = $logFileContent | Where-Object { $_ -like "*ERROR*" } | Measure-Object -Property Count | Select-Object Count

    # Print the log file name and its occurrence count
    Write-Host "Log file: $($logFileName.Name)"
    Write-Host "Occurrence count: $occurrenceCount"
}
