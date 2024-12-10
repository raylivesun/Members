#!/home/admin/app/PowerShell/Members

# In Figures 1-2 and 1-3, packet number 7 is selected. Whatever packet is
# selected in the Packet List pane is the packet presented in the panes
# below it. In this case, it's packet number 7 showing within the Packet
# Details pane.

# NOTE
# Packets are usually numbered based on the time they are received,
# although this isn't guaranteed. The packet capture (pcap) library
# determines how to order the packets.
$pcapShowFile = "capture.pcap"
# Load the pcap file into a packet capture object
$pcap = New-Object -ComObject "Win32_NetworkAdapterConfiguration"
$adapter = $pcap.GetAdapterByName("Ethernet 1")
$packetCapture = $adapter.GetPacketCaptureFile($pcapShowFile)

# Get the 7th packet from the packet capture object
$packet = $packetCapture.GetPacket(6)

# Convert the packet to a byte array
$packetBytes = [System.Text.Encoding]::ASCII.GetBytes($packet.PacketData)

# Print the packet bytes in hexadecimal format
$packetBytes | ForEach-Object { [System.Convert]::ToString($_, 16) }

