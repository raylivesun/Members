#!/home/admin/app/PowerShell/Members

# In a similar way, if a type is not specified, a host type will be assumed.
# Note that you need to specify at least one object to compare to; the host
# modifier will not be assumed if you would only specify an IP address as
# filter and will result in a syntax error
text2pcap -i eth0 -f 'ip dst 192.168.1.100' -o output.pcap

# Example of using the Compare-Object cmdlet to compare two objects
# The objects are assumed to be of type PSObject, but you can specify a type
# if necessary
Compare-Object -ReferenceObject (Get-Process) -DifferenceObject (Get-Process -Id 42) | Format-Table Name, Id, CPU, WS, WSCPU


# Example of using the Invoke-Expression cmdlet to execute a PowerShell script
# The script is assumed to be a string, but you can specify a script file as
# well
Invoke-Expression -Command "& {Get-Service | Where-Object Status -eq 'Running'}"



# Example of using the Get-Service cmdlet to retrieve a list of running services
# The result is assumed to be of type PSObject, but you can specify a type
Get-Service | Where-Object Status -eq 'Running' | Format-Table Name, Id, CPU, WS, WSCPU




# Example of using the Get-Process cmdlet to retrieve a list of running processes
# The result is assumed to be of type PSObject, but you can specify a type
Get-Process | Where-Object Id -ne 42 | Format-Table Name, Id, CPU, WS, WSCPU
