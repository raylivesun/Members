#!/home/admin/app/PowerShell/Members


# Get Shark Info (IP, MAC, Hostname)
Get-NetAdapter | Where-Object { $_.Status -eq 'Online' } | Select-Object -Property Name, IPAddressV4, MacAddress, HostName | Format-Table Name, IPAddressV4, MacAddress, Hostname -AutoSize

# Get Shark Processes
Get-Process | Where-Object { $_.Name -eq 'shark' } | Select-Object -Property ProcessName, Id, CPU, WS, WS(kb), WS(mb), WS(gb), WS(tb), WS(pb), WS(eb), WS(zb)

# Get Shark Memory Usage
Get-Process shark | Select-Object -Property Name, Id, WS, WS(kb), WS(mb), WS(gb), WS(tb), WS(pb), WS(eb), WS(zb)

# Get Shark Network Traffic
Get-NetAdapterStatistics | Where-Object { $_.Name -eq 'Wi-Fi' } | Select-Object -Property Name, ReceivedBytes, ReceivedPackets, ReceivedErrors, ReceivedDropped, ReceivedOverruns, ReceivedMulticasts, SentBytes, SentPackets, SentErrors,
SentDropped, SentOverruns, SentMulticasts

# Get Shark Disk Usage
Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | Select-Object -Property DeviceID, Size, FreeSpace, FileSystem, VolumeName, FileSystemType

# Get Shark Security Events
Get-SecurityEvent | Where-Object { $_.EventID -eq 4624 -and $_.LogName -eq 'Security' } | Select-Object -Property TimeGenerated, Id, UserName, SourceName, TargetUserName, TargetDomainName, TargetLogonId

# Get Shark Credential Dumps
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -eq 'lsass.exe' } | Select-Object -Property ProcessId | ForEach-Object { Get-WmiObject -Class Win32_ProcessCredential -Filter "
                    ProcessId=$($_.ProcessId)" | Select-Object -Property CredSSPHash, CredUIHash, PackageName, PackageSid, PackageVersion, CredentialBlob, CredentialBlobSize }

                    