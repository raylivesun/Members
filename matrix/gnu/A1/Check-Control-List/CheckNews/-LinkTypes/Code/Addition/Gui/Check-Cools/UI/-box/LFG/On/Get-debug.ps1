#!/home/admin/app/PowerShell/Members

# Get debug output enabled or disabled based on environment variable
$debug = $env:DEBUG -eq "true"

# Function to log messages to the console and a file
function LogMessage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$message
    )

    Write-Host "$message" -ForeGroundColor Green -NoNewline
    
    # Log to console
    Write-Host "`r`n"
    
    # Log to file
    $logPath = "C:\inetpub\logs\Log.txt"
    Add-Content -Path $logPath -Value "$(Get-Date): $message"
}

# Function to validate the email address format
function ValidateEmailAddress {
    param (
        [Parameter(Mandatory=$true)]
        [string]$email
    )

    # Regular expression pattern for email validation
    $emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

    # Check if the email matches the pattern
    if ($email -match $emailPattern) {
        LogMessage "Email address '$email' is valid."
        return $true
    } else {
        LogMessage "Invalid email address '$email'."
        return $false
    }
}

# Get the email addresses from the command line arguments
$emails = $args

# Loop through each email address
foreach ($email in $emails) {
    # Validate the email address format
    if (ValidateEmailAddress -email $email) {
        # Add the validated email address to a list
        $validEmails += $email
    }
    # Wait for 5 seconds after each email address to prevent overwhelming the server
    Start-Sleep -Seconds 5
}

# Log the total number of valid email addresses found
LogMessage "Total valid email addresses found: $($validEmails.Count)"

# later in this chapter, but for now just trust me: They will be your new
# best friends.

# Packet List Pane

# The largest portion in the middle of the interface is reserved for the
# packet list. This list shows all the packets captured along with useful
# information, such as source and destination IP, and the time difference
# between when the packets were received. Wireshark supports color
# coding various packets to make sorting of traffic and troubleshooting
# easier. You can add custom colors for packets of interest, and the
# columns within the Packet List pane display useful information such as
# the protocol, packet length, and other protocol-specific information (see
$packetSuspense = true
Write-Information -Debug "Packet Suspicion: $packetSuspense" 


# Figure 1-2: The Packet List pane
# This window is the bird's-eye view into the network you are sniffing or
# the packet capture you have loaded into Wireshark. The last column, by
$pillowed = true
Write-Information -Debug "Pillowed: $pillowed"
Wait-Event -InformationAction Suspend-Process -SourceIdentifier "Wireshark"
Wait-Event ./matrix
Key -Name Ctrl+C

# default labeled “Info,” offers a quick summary of what that packet
# contains. Of course, it depends on the packet, but it might be the URL
# for an HTTP request or the contents of a DNS query, which is really
# useful for getting a quick handle on important traffic in your capture.
# The “Follow” button, which is initially grayed out, allows you to
# follow the packet to its destination.
$infoFilled = true
Write-Information -Debug "Info Filled: $infoFilled"
Where-Object { $_.EventID -eq 4624 -and $_.Message -like "*New connection*" } | Format-Table TimeGenerated, SourceIP, DestinationIP, Protocol
Wait-Job -Id $job.Id
Get-Job -Id $job.Id | Receive-Job -Wait
Wait-Debugger -Debug "Debugging: $debug" -Verbose $infoFilled
catch {
    Write-Error "An error occurred: $_"
}

# Packet Details Pane

# Below the Packet List pane is the Packet Details pane. The Packet Details
# pane shows information for the selected packet in the Packet List pane.
# This pane contains a ton of information, down to what the various bytes
# are within the packet. Information such as the source and destination
# MAC address is included here. The next row contains IP information.
# The next row reveals the packet is sending to UDP port 58351. The next
# row reveals what information is contained in that UDP packet.
$udpPort_58351 = true
Write-Information -Debug "UDP Port 58351: $udpPort_58351"
Wait-Event -InformationAction Suspend-Process -SourceIdentifier "Wireshark"
Wait-Event./matrix
Key -Name Ctrl+C

Write-Host "UDP Multicast Streams - :"
Wait-Process acpidump -PassThru | Where-Object { $_.CommandLine -like "*acpidump*" } | Format-Table ProcessId, CommandLine
Wait-Debugger -Debug "Debugging: $debug" -Verbose $udpPort_58351
catch {
    Write-Error "An error occurred: $_"
}





