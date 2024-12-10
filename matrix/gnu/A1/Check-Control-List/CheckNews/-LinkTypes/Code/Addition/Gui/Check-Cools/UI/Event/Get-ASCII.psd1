#!/home/admin/app/PowerShell/Members

# Figure 1-3: The Packet Details pane

# Subtrees

# Because the details would be overwhelming if shown all at once, the
# information is organized and collapsed into sections. The sections, called
# subtrees, can be collapsed and expanded to display only what you need.
# (In Figure 1-2, the subtrees are collapsed; in Figure 1-3, they are
# expanded.)

# 1. Packet Details
# 2. Source
# 3. Destination
# 4. Control Fields
# 5. Internet Header
# 6. Transport Layer
# 7. User Datagram Protocol (UDP)

# 1. Packet Details
# + Type: TCP
# + Source: 192.168.1.10
# + Destination: 192.168.1.20
# + Length: 40 bytes
# + ID: 1234
# + Fragmentation: No fragmentation
# + TTL: 64
# + Protocol: TCP
# + Checksum: 0x1234 (correct)

# 2. Source
# + Address: 192.168.1.10
# + Port: 50000

# 3. Destination
# + Address: 192.168.1.20
# + Port: 80

# 4. Control Fields
# + Version: 4
# + Duplex: Half-duplex
# + SYN: Yes
# + ACK: Yes
# + Window Size: 512 bytes
# + Checksum: 0x5678 (correct)

# 5. Internet Header
# + Version: 4
# + IHL: 5 (20 bytes)
# + Type of Service: 0 (normal)
# + Total Length: 40 bytes
# + Identification: 1234
# + Fragment Offset: 0
# + TTL: 64
# + Protocol: TCP
# + Header Checksum: 0x90AB (correct)
# + Source Address: 192.168.1.10
# + Destination Address: 192.168.1.20

# 6. Transport Layer
# + Protocol: TCP
# + Source Port: 50000
# + Destination Port: 80
# + Sequence Number: 12345
# + Acknowledgment Number: 67890
# + Data Offset: 5 (20 bytes)
# + Window Size: 512 bytes
# + Checksum: 0xDEF0 (correct)
# + Urgent Pointer: 0

# 7. User Datagram Protocol (UDP)
# + Source Port: 50000
# + Destination Port: 80
# + Length: 28 bytes
# + Checksum: 0x3456 (correct)
# + Data: "GET / HTTP/1.1\r\nHost: www.example.com\r\n\r\n"
Get-Content -ReadCount 0 -InformationAction Ignore -Path 'path/to/file.txt' | Out-String | ForEach-Object {
    $byte = [Text.Encoding]::ASCII.GetBytes($_)
    $checksum = 0
    $byte.ForEach({ $checksum = ($checksum + $_) % 256 })
    $checksum = [System.Net.IPAddress]::NetworkToHostOrder([Int16]$checksum)
    "{0:X4}" -f $checksum
}

# NOTE

# You might hear the message sent between devices referred to as a
# data frame or a packet. But what's the difference? When referring to
# the message at the OSI layer 2 (the data link layer, where the MAC
# address is used), the whole message is called a frame. When
# referring to the message at OSI model layer 3 (the network layer, for
# example, using the IP address), then the message is called a packet.
$StackTrace | Format-List Length, Type, ScriptName, LineNumber, MemberName
Wait-Event $StackTrace

