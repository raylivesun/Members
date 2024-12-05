#!/home/admin/app/Powershell/Members

# Call Stoping-Service cmdlet to stop the Windows Event Log service
Stop-Service -Name EventLog -Force

# Call Get-Service cmdlet to get the current status of the Windows Event Log service
$eventLogService = Get-Service -Name EventLog

# If the service is running, write a message to the PowerShell output
if ($eventLogService.Status -eq 'Running') {
    Write-Output "Event Log service is running."
}

# If the service is stopped, start the service and write a message to the PowerShell output
else {
    Start-Service -Name EventLog
    Write-Output "Event Log service has been started."
}


# Call Get-EventLog cmdlet to get the last 10 entries from the Application log
$last10ApplicationLogEntries = Get-EventLog -LogName Application -Newest 10

# If there are any entries in the Application log, write the entries to the PowerShell output
if ($last10ApplicationLogEntries) {
    Write-Output "Last 10 entries in the Application log:"
    foreach ($entry in $last10ApplicationLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the System log
$last10SystemLogEntries = Get-EventLog -LogName System -Newest 10

# If there are any entries in the System log, write the entries to the PowerShell output
if ($last10SystemLogEntries) {
    Write-Output "Last 10 entries in the System log:"
    foreach ($entry in $last10SystemLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Security log
$last10SecurityLogEntries = Get-EventLog -LogName Security -Newest 10

# If there are any entries in the Security log, write the entries to the PowerShell output
if ($last10SecurityLogEntries) {
    Write-Output "Last 10 entries in the Security log:"
    foreach ($entry in $last10SecurityLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Setup log
$last10SetupLogEntries = Get-EventLog -LogName Setup -Newest 10

# If there are any entries in the Setup log, write the entries to the PowerShell output
if ($last10SetupLogEntries) {
    Write-Output "Last 10 entries in the Setup log:"
    foreach ($entry in $last10SetupLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the W3wp log
$last10W3wpLogEntries = Get-EventLog -LogName W3wp -Newest 10

# If there are any entries in the W3wp log, write the entries to the PowerShell output
if ($last10W3wpLogEntries) {
    Write-Output "Last 10 entries in the W3wp log:"
    foreach ($entry in $last10W3wpLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-Security-Auditing log
$last10AuditingLogEntries = Get-EventLog -LogName Microsoft-Windows-Security-Auditing -Newest 10

# If there are any entries in the Microsoft-Windows-Security-Auditing log, write the entries to the PowerShell output
if ($last10AuditingLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-Security-Auditing log:"
    foreach ($entry in $last10AuditingLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-Terminal-Services log
$last10TerminalServicesLogEntries = Get-EventLog -LogName Microsoft-Windows-Terminal-Services -Newest 10

# If there are any entries in the Microsoft-Windows-Terminal-Services log, write the entries to the PowerShell output
if ($last10TerminalServicesLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-Terminal-Services log:"
    foreach ($entry in $last10TerminalServicesLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WMI-Activity log
$last10WmiActivityLogEntries = Get-EventLog -LogName Microsoft-Windows-WMI-Activity -Newest 10

# If there are any entries in the Microsoft-Windows-WMI-Activity log, write the entries to the PowerShell output
if ($last10WmiActivityLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WMI-Activity log:"
    foreach ($entry in $last10WmiActivityLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-Win32-Security log
$last10Win32SecurityLogEntries = Get-EventLog -LogName Microsoft-Windows-Win32-Security -Newest 10

# If there are any entries in the Microsoft-Windows-Win32-Security log, write the entries to the PowerShell output
if ($last10Win32SecurityLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-Win32-Security log:"
    foreach ($entry in $last10Win32SecurityLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WindowsUpdate log
$last10WindowsUpdateLogEntries = Get-EventLog -LogName Microsoft-Windows-WindowsUpdate -Newest 10

# If there are any entries in the Microsoft-Windows-WindowsUpdate log, write the entries to the PowerShell output
if ($last10WindowsUpdateLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WindowsUpdate log:"
    foreach ($entry in $last10WindowsUpdateLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WindowsUpdate-Client-Agent log
$last10WindowsUpdateClientAgentLogEntries = Get-EventLog -LogName Microsoft-Windows-WindowsUpdate-Client-Agent -Newest 10

# If there are any entries in the Microsoft-Windows-WindowsUpdate-Client-Agent log, write the entries to the PowerShell output
if ($last10WindowsUpdateClientAgentLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WindowsUpdate-Client-Agent log:"
    foreach ($entry in $last10WindowsUpdateClientAgentLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WindowsUpdate-Downloader log
$last10WindowsUpdateDownloaderLogEntries = Get-EventLog -LogName Microsoft-Windows-WindowsUpdate-Downloader -Newest 10

# If there are any entries in the Microsoft-Windows-WindowsUpdate-Downloader log, write the entries to the PowerShell output
if ($last10WindowsUpdateDownloaderLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WindowsUpdate-Downloader log:"
    foreach ($entry in $last10WindowsUpdateDownloaderLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WindowsUpdate-Discovery log
$last10WindowsUpdateDiscoveryLogEntries = Get-EventLog -LogName Microsoft-Windows-WindowsUpdate-Discovery -Newest 10

# If there are any entries in the Microsoft-Windows-WindowsUpdate-Discovery log, write the entries to the PowerShell output
if ($last10WindowsUpdateDiscoveryLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WindowsUpdate-Discovery log:"
    foreach ($entry in $last10WindowsUpdateDiscoveryLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WindowsUpdate-Install log
$last10WindowsUpdateInstallLogEntries = Get-EventLog -LogName Microsoft-Windows-WindowsUpdate-Install -Newest 10

# If there are any entries in the Microsoft-Windows-WindowsUpdate-Install log, write the entries to the PowerShell output
if ($last10WindowsUpdateInstallLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WindowsUpdate-Install log:"
    foreach ($entry in $last10WindowsUpdateInstallLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

# Call Get-EventLog cmdlet to get the last 10 entries from the Microsoft-Windows-WindowsUpdate-Service log
$last10WindowsUpdateServiceLogEntries = Get-EventLog -LogName Microsoft-Windows-WindowsUpdate-Service -Newest 10

# If there are any entries in the Microsoft-Windows-WindowsUpdate-Service log, write the entries to the PowerShell output
if ($last10WindowsUpdateServiceLogEntries) {
    Write-Output "Last 10 entries in the Microsoft-Windows-WindowsUpdate-Service log:"
    foreach ($entry in $last10WindowsUpdateServiceLogEntries) {
        Write-Output "Source: $($entry.Source), Time: $($entry.TimeGenerated), ID: $($entry.Id), Message: $($entry.Message)"
    }
    Write-Output ""
}

