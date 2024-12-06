#!/home/admin/app/PowerShell/Members

# Get Exec Target Hosts from the AD (Active Directory)
$execTarget = Get-ADComputer -Filter {OperatingSystem -like '*Windows*Server*' -and OperatingSystem -notlike '*Server Core*' -and OperatingSystem -notlike '*Hyper-V*'}

# Loop through each Exec Target Host
foreach ($host in $execTarget) {
    # Get the hostname and IP address
    $hostname = $host.Name
    $ipAddress = $host.IPAddressToString

    # Check if the host is online and has a valid IP address
    if ($host.Online -and [System.Net.NetworkInformation.Ping]::GetPingReply($ipAddress).Status -eq [System.Net.NetworkInformation.IPStatus]::Success) {
        # Generate a unique ID for the host
        $uniqueId = [guid]::NewGuid().ToString("N")
        Write-Debug "Host $($hostname) is offline or has an invalid IP address"
        Write-Host "Processing host $($hostname)..."
        Write-Information "Host $($hostname) is online and has a valid IP address"
        Write-Verbose "Unique ID: $uniqueId" 
    } else {
        continue
    }

    # Connect to the host using SSH
    $ssh = New-Object System.Net.SSH.SSHClient
    $ssh.Connect($ipAddress, 22, 'username', 'password')

    # Check if the SSH connection is successful
    if ($ssh.IsConnected) {
        Write-Host "Connected to host $($hostname) using SSH"
        Write-Information "SSH connection to host $($hostname) successful"
    }
    else {
        Write-Error "Failed to connect to host $($hostname) using SSH"
        Write-Error "Please check the username, password, and SSH connectivity"
        continue
    }
    # Perform any necessary actions on the host using SSH commands

    # Close the SSH connection
    $ssh.Disconnect()
    Write-Host "Disconnected from host $($hostname) using SSH"
    Write-Information "SSH connection to host $($hostname) closed"
}

$aliasProperty = $execTarget.Add("Alias", $hostname['link'])
$aliasProperty
     