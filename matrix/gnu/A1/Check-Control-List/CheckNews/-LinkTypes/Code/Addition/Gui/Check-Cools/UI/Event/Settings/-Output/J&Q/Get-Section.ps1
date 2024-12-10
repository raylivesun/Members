#!/home/admin/app/PowerShell/Members

# Get Jack Section Shark Capturing Enough Detail
# The first row contains metadata regarding the packet, such as the
# number of the packet, when it was captured, on what interface it was
# captured, and the number of bytes captured versus the number of bytes
# that were on the wire. That last part might sound a little strange.
# Wouldn't you always capture all the bytes that go across the wire? Not
# necessarily. Some network capture tools allow you to capture only a
# subset of the bytes that are actually transmitted across the wire. This is
# useful if you only want to get an idea of the type of packets that are
# going across the wire but not what actual data those packets have, which
# can greatly reduce the size of the packet capture. The downside, of
$ggek = -Command 'Get-NetAdapter | Format-Table Name, Description, InterfaceType'
Wait-Debugger -Debug $ggek -InformationAction SilentlyContinue

# Capture the packet capture. We're capturing the packets on the
# Ethernet interface (e.g., eth0) and only capturing those packets that
# have a source or destination IP address of 192.168.0.1.
#
# The -File parameter specifies the output file. The -NoTimestamp
# parameter disables the timestamp that gets added to each line of the
# output file.
#
# The -NoHeader parameter disables the header that gets added to the
# output file.
#
# The -Wait parameter makes the script wait for a key press before
# continuing. This is useful for debugging purposes.
#
# The -Filter "IP.SourceAddress == '192.168.0.1' or IP.DestinationAddress == '192.168.0.1'"
# parameter filters the packets to only include those that have either a
# source or destination IP address of 192.168.0.1.
#
# The -PassThru parameter makes the cmdlet return the captured packets
# instead of writing them to a file.
#
# The -PcapFilter "ip and host 192.168.0.1" parameter filters the packets
# to only include those that have an IP address of 192.168.0.1.
#
# The -Encoding UTF8 parameter specifies that the output file should be
# encoded in UTF-8.
Get-Clipboard -InformationAction SilentlyContinue | Out-File -FilePath C:\temp\jack_shark_capturing_enough_detail.txt -NoTimestamp -NoHeader -Wait -Filter "IP.SourceAddress == '1'"
Get-Command %ComSpec% | Out-File -FilePath C:\temp\jack_shark_capturing_enough_detail.txt -Append -Encoding UTF8
Get-AssertionOperator Because -InformationAction SilentlyContinue | Out-File -FilePath C:\temp\jack_shark_capturing_enough_detail.txt -Append -Encoding UTF8
Get-Command -Module PSWorkflow -InformationAction SilentlyContinue | Out-File -FilePath C:\temp\jack_shark_capturing_enough_detail.txt -Append -
Get-Command -Module PSScriptAnalyzer -InformationAction SilentlyContinue | Out-File -FilePath C:\temp\jack_shark_capturing_enough_detail.txt -
Where-Object ($ggek) {
    $ggek | Format-Table -AutoSize Name, Description, InterfaceType
}