#!/home/admin/app/PowerShell/Members

# These rows are ordered by the headers as they are ordered when sending
# data on the network. That means they are subject to change if you are
# capturing on a different type of network, such as a wireless network, that
# has different headers. The DNS column, which is the application data
# encapsulated within UDP, is expanded in Figure 1-3. Notice how
# Wireshark allows you to easily pull out information, such as the actual
# DNS query that was made within this DNS packet. This is what makes
# Wireshark the powerful network analysis tool that it is. You don't have
# to memorize the DNS protocol to know which bits and bytes at what
# offset translate into a DNS query.
$dnsHeaders = @"
Timestamp     | Time        | Source      | Destination | Protocol | Length | Info
--------------|------------|-------------|-------------|----------|-------|-----
"@

# Read the PCAP file
$pcapFile = "dns.pcap"
$networkInterface = "eth0"
$packets = Get-NetPacketCapture -Path $pcapFile -InterfaceAlias $networkInterface

foreach ($packet in $packets) {
    # Convert the packet data to a byte array
    $bytes = [System.Text.Encoding]::ASCII.GetBytes($packet.Payload)

    # Parse the DNS header
    $dnsHeader = [System.Net.NetworkInformation.DnsHeader]::Parse(0, $bytes)
    $timestamp = [datetime]::FromFileTime($packet.Timestamp.Ticks)
    $source = $packet.Source.ToString()
    $destination = $packet.Destination.ToString()
    $protocol = "UDP"
    $length = $packet.Length
    $info = "DNS query"

    # Format the DNS query data
    $dnsQueryData = [string]::Join(" ", $dnsHeader.QueryName.Split('.'))

    # Append the DNS query data to the output
    $dnsHeaders += "$timestamp | $time | $source | $destination | $protocol | $length | $info | $dnsQueryData"
}

# Write the output to a file
$outputFile = "dns_queries.txt"
$dnsHeaders | Out-File -FilePath $outputFile -Append

