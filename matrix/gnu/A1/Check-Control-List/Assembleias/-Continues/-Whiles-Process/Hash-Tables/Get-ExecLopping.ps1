#!/home/admin/app/PowerShell/Members

# Get Exec Logging Configuration Parameters from App.config
$execLoggingConfig = (Get-Content -Path (Join-Path $PSScriptRoot "App.config") | Where-Object { $_ -like "*<execLogging*>" })

# Extract parameters from Exec Logging Configuration
$logFile = $execLoggingConfig | Select-String -Pattern "logFile=\"(.+)\"" | ForEach-Object { $_.Matches.Groups[1].Value }
$logFileFormat = $execLoggingConfig | Select-String -Pattern "logFileFormat=\"(.+)\"" | ForEach-Object { $_.Matches.Groups[1].Value }
$logFilePath = $execLoggingConfig | Select-String -Pattern "logFilePath=\"(.+)\"" | ForEach-Object { $_.Matches.Groups[1].Value }
$logRetentionDays = $execLoggingConfig | Select-String -Pattern "logRetentionDays=\"(.+)\"" | ForEach-Object { $_.Matches.Groups[1].Value }

# Set logging parameters
$logFile = Resolve-Path -Path $logFilePath
$logFormatter = New-Object System.IO.LogFormatter($logFileFormat)
Write-Debug "Log File: $logFile"
Where-Object { $_.Name -eq "Exec Logging" } | ForEach-Object {
    $_.Listeners.Clear()
    $listener = New-Object System.Diagnostics.TextWriterTraceListener($logFile)
    $listener.Formatter = $logFormatter
    $_.Listeners.Add($listener)
}

# Set log settings
$logSettings = New-Object System.Diagnostics.TraceSource("Exec Logging", $logRetentionDays)
$logSettings.Switch.Level = [System.Diagnostics.SourceLevels]::All
Write-Debug "Log Settings: $logSettings"

# Set logging level
$loggingLevel = [System.Diagnostics.TraceLevel]::Info
Write-Debug "Logging Level: $loggingLevel"

# Enable logging
$logSettings.Listeners.Add($listener)
Set-Item -Path (Join-Path $PSScriptRoot "App.config") -Value ($execLoggingConfig | Select-String -NotMatch "*<execLogging*>")
Write-Host "Logging enabled successfully!"
