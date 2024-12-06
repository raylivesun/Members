#!/home/admin/app/PowerShell/Members

# Get Exec wines from Sysmon events with ID 4688 (CreateProcess)
# We only want the ExecutablePath, CommandLine, and UserName
# This assumes Sysmon is configured with the correct event IDs and filters
$execWines = Get-WinEvent -FilterHashtable @{
    Id = 4688
    ComputerName = '*'
    EventID = 4688
    ProviderName = 'Microsoft-Windows-Sysmon'
    TimeCreated = @{
        Start = (Get-Date).AddDays(-1)
    }
    ProcessName = 'wine*'
    ProcessCommandLine = '*wine*'
    ProcessId = '*'
    UserName = '*'
    LogName = '*'
    ResultCount = 1000
    Select = @{
        ExecutablePath = 'ProcessImagePath'
        CommandLine = 'CommandLine'
        UserName = 'SubjectUserName'
    }
}

# Get the unique ExecutablePaths and UserNames
$uniqueExecutables = $execWines | Select-Object ExecutablePath, UserName | Group-Object ExecutablePath, UserName | Select-Object ExecutablePath, @{Name='UserCount';Expression={$_.Count}}

# Sort by UserCount in descending order
$uniqueExecutables | Sort-Object -Property UserCount -Descending

# Print the results
$uniqueExecutables
