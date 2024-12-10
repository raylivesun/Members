#!/home/admin/app/PowerShell/Members

# Ip Port Count ensure high performance. The compiled BPF can be shown by using the
# -d operator on tcpdump, Dumpcap, or TShark, and in the Capture
# Options menu in the GUI.
# This is useful when debugging a problem where your filter is not doing
# exactly what you were expecting. The following is an example output of a
# BPF filter:
# tcpdump -i any -ddd -s 0 -w /tmp/tcpdump.pcap -p -v -n -e 'tcp port 80 and ((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[1
# 2]&0xf)<<2)) != 0)'

# Set the IP and port range
$ip_range="192.168.1.100-192.168.1.200"
port_range="80-81"

# Get the IP addresses from the range
$ips = (Get-Content -Path "ip_addresses.txt") | Where-Object { Test-Connection -ComputerName $_ -Count 1 -Quiet }

foreach ($ip in $ips) {
    # Check if the IP address is within the specified range
    if ($ip -match "^($ip_range)$") {
        # Extract the port range from the IP address
        $port_start = [int]$ip.Split('.')[3] -shl 1
        $port_end = [int]$ip.Split('.')[3] + 1
        $port_range = "$port_start-$port_end"

        # Check if the port range is within the specified range
        if ($port_range -match "^($port_range)$") {
            # Execute the PowerShell script to check the status of the service
            & powershell.exe -NoProfile -ExecutionPolicy Bypass -File check_service.ps1 -IP $ip -Port 80
        }
        else {
            Write-Host "Port range $port_range does not match the specified range."
        }
    }
    else {
        Write-Host "IP address $ip does not match the specified range."
    }
}

dumpcap -f "ether host 00:01:02:03:04:05" -d
