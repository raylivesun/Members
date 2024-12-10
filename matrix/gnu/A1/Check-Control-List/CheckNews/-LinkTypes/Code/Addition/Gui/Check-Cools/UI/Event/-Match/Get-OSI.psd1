#!/home/admin/app/PowerShell/Members

# If you're already familiar with how a data frame is structured, you
# recognize how the packet details subtrees are divided. Details are
# structured into subtrees along the lines of the data frame's headers. You
# can collapse/expand a subtree by clicking the arrow sign next to the
# relevant section. The arrow is pointing to the right if the subtree is
# collapsed. Once you click on the arrow to expand that subtree, you'll see
# the arrow points down (refer to Figure 1-3). And, of course, you'll always
# have the option to expand or collapse all subtrees by right-clicking
# anywhere in the Packet Details pane to launch its pop-up menu.
$Match = (Get-NetAdapter -Name Ethernet* | Where-Object { $_.Status -eq 'Connected' }).Name

# Create a new data frame to store the packet details
$df = New-Object System.Data.DataFrame

# Add column headers to the data frame
$df.Columns.AddRange(@(
    'Interface',
    'IP Address',
    'MAC Address',
    'Source Port',
    'Destination Port',
    'Protocol',
    'Length',
    'TTL',
    'Time To Live',
    'Source',
    'Destination'
))

foreach ($interface in $Matches) {
    $adapter = Get-NetAdapter -Name $interface
    $ipAddresses = Get-NetIPAddress -InterfaceAlias $interface | Where-Object { $_.AddressFamily -eq 'IPv4' }
    foreach ($ipAddress in $ipAddresses) {
        $macAddress = (Get-NetAdapter -Name $interface | Get-NetIPAddress -AddressFamily IPv4).GetNetworkAddress().GetPhysicalAddress().ToString()
        $packetDetails = Get-NetAdapterPacketDetail -InterfaceAlias $interface

        foreach ($detail in $packetDetails) {
            $df.Rows.Add(
                $interface,
                $ipAddress.IPAddressToString(),
                $macAddress,
                $detail.SourcePort,
                $detail.DestinationPort,
                $detail.Protocol,
                $detail.Length,
                $detail.TimeToLive,
                $detail.Source,
                $detail.Destination
            )
            # Uncomment the following line to print the packet details to the console
            # Write-Host $detail
        }
    }
    # Uncomment the following line to print the data frame to the console
    # Write-Host $df
}


# Export the data frame to a CSV file
$df | Export-Csv -Path.\packet_details.csv -NoTypeInformation


# Uncomment the following line to open the CSV file in a default text editor
# Start-Process.\packet_details.csv
Start-Process $match \packet_details.csv -WorkingDirectory $adapter

