#!/home/admin/app/PowerShell/Members

# would only show traffic going to the specified IP. If dst is omitted, it
# would show traffic to and from that IP address.
# The following are the most commonly used BPF protocols:
# ether (filtering Ethernet protocols)
# tcp (filtering TCP traffic)
# ip (filtering IP traffic)
# ip6 (filtering IPv6 traffic)
# arp (filtering ARP traffic)
Enter-PSHostProcess 617

# Get the PID of the PowerShell process
$popsicle = (Get-Process | Where-Object Name -EQ 'powershell').Id

# Run the BPF command
$command = "bpftrace -e 'count({ip})' -c 'printf(''IP:%d\n', count);'"

# Execute the BPF command and capture the output
$output = & (Get-Content -Path "\\proc\\$pid\\mem") -match $command

# Print the output
$output 
# Close the PowerShell process
Exit-PSHostProcess $popsicle


