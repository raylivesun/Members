#!/home/admin/app/PowerShell/Members

# Get Exec Host details from Event Viewer
$eventLog = Get-WinEvent -LogName System -FilterHashtable @{EventID=4624; LogName='System'; ProviderName='Microsoft-Windows-PowerShell/Operational'} | Select-Object TimeCreated, Id, Message
Write-Host "Event ID 4624 details: $eventLog"

# Get logged-in users from Event Viewer
$loggedInUsers = Get-WinEvent -LogName System -FilterHashtable @{EventID=7036; LogName='System'; ProviderName='Microsoft-Windows-Security-Auditing'} | Select-Object TimeCreated, Id, Message
Write-Host "Logged-in users: $loggedInUsers"

# Get event details from Event Viewer
$eventDetails = Get-WinEvent -LogName System -FilterHashtable @{EventID=4688; LogName='System'; ProviderName='Microsoft-Windows-Kernel-Process'} | Select-Object TimeCreated, Id, Message
Write-Host "Event ID 4688 details: $eventDetails"

# Get system shutdown event details from Event Viewer
$shutdownEvent = Get-WinEvent -LogName System -FilterHashtable @{EventID=4608; LogName='System'; ProviderName='Microsoft-Windows-Kernel-General'} | Select-Object TimeCreated, Id, Message
Write-Host "System shutdown event: $shutdownEvent"

# Get event details from Event Viewer for a specific process ID
$processId = 3248
$processEventDetails = Get-WinEvent -LogName System -FilterHashtable @{EventID=4688; LogName='System'; ProviderName='Microsoft-Windows-Kernel-
                    Process'; ProcessId=$processId} | Select-Object TimeCreated, Id, Message
Write-Host "Event details for process ID $processId $processEventDetails"


# Get event details from Event Viewer for a specific event ID
$eventId = 4688
$eventDetailsById = Get-WinEvent -LogName System -FilterHashtable @{EventID=$eventId; LogName='System'} | Select-Object TimeCreated, Id, Message
Write-Host "Event details for event ID $eventId $eventDetailsById"


