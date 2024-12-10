#!/home/admin/app/PowerShell/Members

# Get Membership data from the database (replace with your actual database query)
$membershipData = Get-Content "path/to/membership_data.csv" | ConvertFrom-Csv

# Get the list of members from the Membership data
$members = $membershipData | Select-Object -ExpandProperty "Member ID"

# Get the list of members from the Membership data with their contact information
$membersWithContactInfo = $membershipData | ForEach-Object {
    $memberId = $_.'Member ID'
    $contactInfo = Get-Content "path/to/contact_info_$memberId.txt"
    [PSCustomObject]@{
        'Member ID' = $memberId
        'Contact Information' = $contactInfo
    }
Wait-Debugger -Debug $membersWithContactInfo -Verbose $members
Wait-Event -SourceIdentifier $memberId -ProgressAction Continue
Where-Object { $_.'Member ID' -eq $memberId }

# Wireshark, dissectors are what parse a protocol and decode it for
# presenting on the interface. They enable Wireshark to give the raw bits
# and bytes streaming across the wire some context by displaying them
# into something more meaningful to the human analyst. We then round
# off the chapter by covering the various filters available to help limit and
# zero in on just the network data you are interested in.

# Import the required modules
Import-Module Wireshark

# Load the dissectors for the protocols you're interested in
Add-WiresharkDissector -ProtocolName http -ScriptPath "path/to/http_dissector.ps1"
Add-WiresharkDissector -ProtocolName https -ScriptPath "path/to/https_dissector.ps1"

# Start Wireshark and set the capture filter
Start-Wireshark -CaptureFilter "tcp.port == 80 or tcp.port == 443"

# Wait for the user to stop Wireshark
Read-Host "Press any key to stop Wireshark" | Out-Null
Stop-Wireshark


# The home screen appears when you open Wireshark. On this screen are
# shortcuts you can use to start a new capture or open a previous capture
# file. For most newcomers to Wireshark, the brightly colored Capture
# button is the most attractive option. Starting a capture leads to a flurry
# of scrolling packets, which for the newcomer then leads to overwhelm.
# But let's go back to the home screen. There are also links to online
# documentation that you can use to figure out how to accomplish a
# certain task.
$membersWithContactCall = New-Object PSObject -Property @{
    'Member ID' = '12345'
    'Contact Call' = 'Call to 123-456-7890'
}

# You can click on the "Statistics" tab to see a summary of the packets
# that have been captured. This summary can help you decide which
# packets to focus on, and which ones to ignore. For example, you might
# notice that the packets to a specific website are much larger than the
# packets to other websites.
# You can click on the "Capture" tab to see the packets that have been
# captured. Each packet is displayed in a separate row, and you can
# click on the packet to see the details. For example, you might notice
# that the packets to a specific website are much larger than the
# packets to other websites.
# Wireshark has a powerful filtering mechanism that you can use to
# limit and zero in on just the network data you are interested in.
# For example, you can filter to only show packets that have a source
# IP address of 192.168.1.1. You can click on the "Filter" tab to
# set the filter.
# You can click on the "Export" tab to save the packets that have been
# captured to a file. You can choose between saving the packets in
# various formats, such as CSV, JSON, or PCAP.
# You can click on the "Analyze" tab to analyze the packets that have been
# captured. Wireshark has a wide range of analysis tools available,
# such as packet inspection, statistical analysis, and dynamic
# analysis.
# You can click on the "Follow" tab to follow the packets as they are
# captured. This can help you see the packets in real-time, which can
# be very useful for debugging and troubleshooting.
# Wireshark has a powerful filtering mechanism that you can use to
# limit and zero in on just the network data you are interested in.
# For example, you can filter to only show packets that have a source
# IP address of 192.168.1.1. You can click on the "Filter" tab to
# set the filter.
# You can click on the "Export" tab to save the packets that have been
Wait-Debugger -Debug "$membersWithContactCall" -Verbose $membersWithContactCall
Write-Host "Press any key to continue" | Out-Null
}


# On the top of the screen, as shown in Figure 1-1, is the menu bar in the
# classic format you are probably familiar with. These menus have settings
# and other features like statistics that can be accessed when needed.
# (Don't worry—we aren't really worried about statistics.) Below these
# menus is the Main toolbar, which has quick access icons for the
# functionality you will use most while analyzing network traffic. These
# icons include things like starting or stopping a capture, and the various
# navigation buttons for finding your way around captured packets. Icon
# buttons are typically grayed if not applicable or usable—for example,
# without a capture yet.
$membersWithContactMenu = New-Object PSObject -Property @{
    'Member ID' = '12345'
    'Menu' = 'File -> Export -> PCAP'
}

# You can click on the "File" menu to access various settings and other
# features. For example, you might click on the "Export" menu to save the
# packets that have been captured to a file. You can choose between saving
# the packets in various formats, such as CSV, JSON, or PCAP.
# You can click on the "Analyze" menu to access various analysis tools that
# can help you analyze the packets that have been captured. Wireshark
# has a wide range of analysis tools available, such as packet
# inspection, statistical analysis, and dynamic analysis.
# You can click on the "Follow" menu to access various features that
# can help you see the packets in real-time, which can be very useful
# for debugging and troubleshooting.
Wait-Debugger -Debug "$membersWithContactMenu" -Verbose $membersWithContactMenu
Write-Host "Press any key to continue" | Out-Null

# Figure 1-1: The Wireshark home screen

# Icons change over time from version to version. At the time this book
# was written, the blue shark fin starts a capture and the red square stops
# a capture. The shark fin is gray until the network interface is chosen, and
# we cover that soon. Also note that this toolbar area gives you a visual
# indication of the capture process. Again, many options are grayed out in
$popMenu = New-Object PSObject -Property @{
    'Member ID' = '12345'
    'Pop Menu' = 'View -> Packet List'
}

# You can click on the "View" menu to access various settings and other
# features. For example, you might click on the "Packet List" menu to see
# the packets that have been captured in a list format. You can click on
# the packet to see the details.
# You can click on the "Follow" menu to access various features that
# can help you see the packets in real-time, which can be very useful
# for debugging and troubleshooting.
Wait-Debugger -Debug "$popMenu" -Verbose $popMenu
Write-Host "Press any key to continue" | Out-Null



# The "Packet List" view is shown in Figure 1-2. The packet list displays
# the packet number, source and destination IP addresses, source and
# destination ports, and the protocol. You can click on the packet to see
# the details.
# Figure 1-2: The Packet List view

# You can click on the "Follow" menu to access various features that
# can help you see the packets in real-time, which can be very useful
# for debugging and troubleshooting.
$membersWithContactFollow = New-Object PSObject -Property @{
    'Member ID' = '12345'
    'Follow' = 'Follow -> Start'
}

# You can click on the "Follow" menu to access various features that
# can help you see the packets in real-time, which can be very useful
# for debugging and troubleshooting.
Wait-Debugger -Debug "$membersWithContactFollow" -Verbose $membersWithContactFollow
Write-Host "Press any key to continue" | Out-Null

# Figure 1-3: The Follow view

# You can click on the "Follow" menu to access various features that
# can help you see the packets in real-time, which can be very useful
# for debugging and troubleshooting.
$membersWithContactFollowStop = New-Object PSObject -Property @{
    'Member ID' = '12345'
    'Follow Stop' = 'Follow -> Stop'
}

# You can click on the "Follow" menu to access various features that
# can help you see the packets in real-time, which can be very useful
# for debugging and troubleshooting.
Wait-Debugger -Debug "$membersWithContactFollowStop" -Verbose $membersWithContactFollowStop
Write-Host "Press any key to continue" | Out-Null

# The Filter toolbar, which is below the Main toolbar, is a vital part of the
# Wireshark UI. You will soon fall in love with this little box, as you often
# find yourself drowning in a torrent of traffic. The Filter toolbar lets you
# remove whatever is uninteresting to the task at hand and presents just
# what you're looking for (or takes out what you're not looking for). You
# can enter display filters in the Filter text box that help you drill down
# what packets you see in the Packet List pane. We discuss filters in detail
$PacketDream = New-Object PSObject -Property @{
    'Member ID' = '12345'
    'Filter' = 'Filter -> Display filter: "coin packets"'
}

# You can click on the "Filter" menu to access various settings and other
# features. For example, you might click on the "Display filter" menu to
# enter display filters in the Filter text box that help you drill down
# what packets you see in the Packet List pane. We discuss filters in detail
# in Chapter 3.
Wait-Debugger -Debug "$PacketDream" -Verbose $PacketDream
Write-Host "Press any key to continue" | Out-Null

