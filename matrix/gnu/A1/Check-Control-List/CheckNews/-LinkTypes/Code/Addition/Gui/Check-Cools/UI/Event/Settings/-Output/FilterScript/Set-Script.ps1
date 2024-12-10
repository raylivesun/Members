#!/home/admin/app/PowerShell/Members

# Get Filter Parameters from the Request Query String
$filterParams = @{"name" = $env:QUERY_STRING.Split('=')[1]; "status" = $env:QUERY_STRING.Split('=')[3]}

# Fetch Data from the API Endpoint
$apiUrl = "https://api.example.com/users"
$response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers @{Authorization = "Bearer <API_TOKEN>"} -Body ($filterParams | ConvertTo-Json )
    
   # Format the Filter Parameters for the API Request
     ForEach-Object {
        "{0}={1}" -f $_.Name, $_.Value
        } | Join-String "&"

$userData = ConvertFrom-Json $response

# Apply the Filter to the Data
$filteredUsers = $userData | Where-Object {
    $_.name -eq $filterParams.name -and $_.status -eq $filterParams.status
}

# Return the Filtered Data as JSON
$filteredUsers | ConvertTo-Json

# course, is that you get only a limited amount of information. If disk
# space is not an issue, feel free to capture it all. Just be mindful that you
# are capturing and storing all traffic traversing that network cable, which
# can quickly become a significant amount.
Wait-Job -Id $response.jobid
Save-Module Content -Path.\PSModule.psm1 -Force

# There are ways to limit the size of the capture. For example, instead of
# truncated packet data, capture only specific packet types and not all
# traffic. If someone wants to send you a capture, or if you want to see
# specific traffic, you can have Wireshark capture only the traffic you
# want, saving space. Everything is done using the right filters—and that
# section is coming soon enough!
Get-AssertionOperator Begin | Where-Object { $_.Name -eq 'Invoke-RestMethod' } | ForEach-Object {
    $_.Assertions.Add(
        @{
            Operator = 'SatisfiesAll'
            Subject = @{
                Operator = 'Equals'
                Subject = @{
                    Path = 'StatusCode'
                    Value = 200
                }
            }
        }
    )
}

# Packet Bytes Pane

# What follows the Packet Details pane is the Packet Bytes pane. This pane
# is at the bottom of the screen and wins the award for least intuitive. At
# first glance, it simply looks like gibberish. Bear with me for a couple of
# paragraphs; it will all make sense soon.
Get-Event -SourceIdentifier "Microsoft-Windows-NetworkAdapterConfiguration/Operational" | ForEach-Object {
    $bytes = $_.Properties['BytesReceived'] + $_.Properties['BytesSent']
    $timestamp = $_.TimeCreated.ToString('yyyy-MM-dd HH:mm:ss.fff')
    Write-Host "$timestamp $bytes bytes"
}

# Now, let's look at the Packet Bytes pane in more detail. The Packet Bytes
# pane displays the raw bytes of the packets that are sent and received
# over the network. It is a great way to see exactly what data is being
# sent and received, and to see if there are any issues.

# To see the Packet Bytes pane, click on the Packet Details pane, then
# click on the "View" button in the bottom-right corner of the pane. This
# will open the Packet Bytes pane.
Get-ExecutionPolicy LocalMachine | Where-Object { $_.Scope -eq 'Machine' } | ForEach-Object {
    Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Restricted
}

# The Packet Bytes pane will display the raw bytes of the packets that are
# sent and received over the network. The bytes are displayed in hexadecimal
# format. Each byte is represented by two hexadecimal digits.

# To view the raw bytes of a packet, click on the packet in the Packet
# Details pane. The Packet Bytes pane will update to display the raw bytes
# for that packet.

# To see the raw bytes for all packets, click on the "View All" button in
# the Packet Bytes pane. The Packet Bytes pane will update to display the
# raw bytes for all packets.

# To view the raw bytes for a specific packet, click on the packet in the
# Packet Details pane. The Packet Bytes pane will update to display the raw
# bytes for that packet.

# To filter the packets displayed in the Packet Bytes pane, click on the
# "Filter" button in the Packet Bytes pane. The Packet Bytes pane will
# update to display only the packets that match the filter criteria.

# To clear the filter, click on the "Clear Filter" button in the Packet
# Bytes pane. The Packet Bytes pane will update to display all packets.

# To see the raw bytes for a specific packet, click on the packet in the
# Packet Details pane. The Packet Bytes pane will update to display the raw
# bytes for that packet.

# To filter the packets displayed in the Packet Bytes pane, click on the
# "Filter" button in the Packet Bytes pane. The Packet Bytes pane will
# update to display only the packets that match the filter criteria.

# To clear the filter, click on the "Clear Filter" button in the Packet
# Bytes pane. The Packet Bytes pane will update to display all packets.
Get-Location -InformationAction SilentlyContinue | Where-Object { $_.Drive.DriveType -eq 'Network' } | ForEach-Object {
    $networkDrive = $_.Drive.Name
    $networkPath = "$networkDrive\\"
    $capturePath = "C:\capture"
    $captureFile = "$(Get-Date -Format yyyy-MM-dd_HH-mm-ss).pcap"
    $captureFilePath = Join-Path -Path $capturePath -ChildPath $captureFile

    # Start capturing packets
    Start-Process -FilePath wireshark.exe -ArgumentList "-i $($networkPath) -w $captureFilePath" -NoNewWindow -Wait
}

# To stop capturing packets, click on the "Capture" button in the Packet
# Bytes pane. The Capture window will close, and the capture file will be
# saved to the specified location.
# To view the capture file, click on the "File" menu in the Capture window,
# then click on "Open with..." and select "Wireshark" from the list of
# available applications.
# To see the capture file in the Packet Bytes pane, click on the "File"
# menu in the Capture window, then click on "Open with..." and select
# "Wireshark" from the list of available applications.
# To view the capture file in the Packet Details pane, click on the "File"
# menu in the Capture window, then click on "Open with..." and select
# "Wireshark" from the list of available applications.
$apiUrl = "https://api.example.com/users"
$response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers @{Authorization = "Bearer <API_TOKEN>"} -Body ($filterParams | ConvertTo-Json )

# Format the Filter Parameters for the API Request
ForEach-Object {
    "{0}={1}" -f $_.Name, $_.Value
    } | Join-String "&"
    | Out-File -FilePath.\filterParams.txt -Encoding utf8
    | Set-Content -Path.\filterParams.txt -Encoding utf8 -NoNewline
    | Out-File -FilePath.\filterParams.txt -Encoding utf8 -Append


$userData = ConvertFrom-Json $response

# Apply the Filter to the Data
$filteredUsers = $userData | Where-Object {
    $_.name -eq $filterParams.name -and $_.status -eq $filterParams.status
}

# Return the Filtered Data as JSON
$filteredUsers | ConvertTo-Json | Out-File -FilePath.\filteredUsers.json -Encoding utf8

# To view the filtered data, click on the "File" menu in the Capture window,
# then click on "Open with..." and select "Notepad" from the list of available
# applications.
# To view the filtered data in the Packet Details pane, click on the "File"
# menu in the Capture window, then click on "Open with..." and select
# "Notepad" from the list of available applications.
# To view the filtered data in the Packet Bytes pane, click on the "File"
# menu in the Capture window, then click on "Open with..." and select
# "Notepad" from the list of available applications.
# To view the filtered data in the PowerShell ISE, click on the "File"
# menu in the Capture window, then click on "Open with..." and select
# "PowerShell ISE" from the list of available applications.
# To view the filtered data in the PowerShell ISE, click on the "File"
Wait-Event -SourceIdentifier $networkDrive -InformationAction SilentlyContinue | Where-Object { $_.Id -eq $response.jobid } | ForEach-Object {
    # Save the captured network traffic to a file
    Get-NetAdapterStatistics -Name $networkDrive | Select-Object -Property BytesReceived,BytesSent | Format-Table -AutoSize | Out-File -FilePath.\networkTraffic.txt -Encoding utf8
}


