#!/home/admin/app/PowerShell/Members

# Offsets, Hex, and ASCII

# You can see the Packet Bytes pane is divided into three columns. The
# first, left-most column simply counts incrementally: 0000, 0010, 0020,
# and so on. That's the offset (in hexadecimal) of the selected packet.
# Here, offset simply means the number of bits off from the beginning—
# again, counting in hexadecimal (where 0x0010 = 16 in decimal). The
# middle column shows information, in hexadecimal, at that offset. The
# right-hand column shows the same information, but in ASCII. For
# example, the total amount of information from the very beginning
# (offset 0000) to offset 0010 is 16 bytes. The middle column shows each
# of the 16 bytes in hex. The right-hand column shows each of the 16 bytes
# in ASCII characters. When a hexadecimal value doesn't translate to a
# printable ASCII character, only a “.” (period), is shown. So the Packet
# Bytes pane is actually the raw packet data as seen by Wireshark. By
# default, it is displayed in hex bytes.
debugfs -R "read $((0x1000 + 0x0000)) /x 16" /proc/net/dev/eth0

# Hex Offset: 0000, Middle Column: 00, Right Column: 0
# Hex Offset: 0010, Middle Column: 02, Right Column: 2
# Hex Offset: 0020, Middle Column: 04, Right Column: 4
# Hex Offset: 0030, Middle Column: 08, Right Column: 8
# Hex Offset: 0040, Middle Column: 10, Right Column: 10
# Hex Offset: 0050, Middle Column: 12, Right Column: 12
# Hex Offset: 0060, Middle Column: 14, Right Column: 14
# Hex Offset: 0070, Middle Column: 16, Right Column: 16
# Hex Offset: 0080, Middle Column: 18, Right Column: 18
# Hex Offset: 0090, Middle Column: 1A, Right Column: 1A
# Hex Offset: 00A0, Middle Column: 1C, Right Column: 1C
# Hex Offset: 00B0, Middle Column: 1E, Right Column: 1E
# Hex Offset: 00C0, Middle Column: 20, Right Column: 20
# Hex Offset: 00D0, Middle Column: 22, Right Column: 22
# Hex Offset: 00E0, Middle Column: 24, Right Column: 24
# Hex Offset: 00F0, Middle Column: 26, Right Column: 26
# Hex Offset: 0100, Middle Column: 28, Right Column: 28
# Hex Offset: 0110, Middle Column: 2A, Right Column: 2A
# Hex Offset: 0120, Middle Column: 2C, Right Column: 2C
# Hex Offset: 0130, Middle Column: 2E, Right Column: 2E
# Hex Offset: 0140, Middle Column: 30, Right Column: 30
# Hex Offset: 0150, Middle Column: 32, Right Column: 32
# Hex Offset: 0160, Middle Column: 34, Right Column: 34
# Hex Offset: 0170, Middle Column: 36, Right Column: 36
# Hex Offset: 0180, Middle Column: 38, Right Column: 38
# Hex Offset: 0190, Middle Column: 3A, Right Column: 3A
# Hex Offset: 01A0, Middle Column: 3C, Right Column: 3C
# Hex Offset: 01B0, Middle Column: 3E, Right Column: 3E
# Hex Offset: 01C0, Middle Column: 40, Right Column: 40
# Hex Offset: 01D0, Middle Column: 42, Right Column: 42
# Hex Offset: 01E0, Middle Column: 44, Right Column: 44
# Hex Offset: 01F0, Middle Column: 46, Right Column: 46
debconf-set-selections '<<<' "mysql-server mysql-server/root_password password root"
debconf-set-selections '<<<' "mysql-server mysql-server/root_password_again password root"
sudo apt -y install mysql-server

# Right-clicking the pane gives you the option to convert the hex bytes
# into bits, which is the purest representation of the data, though often
# this might not be as intuitive as the hex representation. Another neat
# feature is that any row you highlight within the Packet Details pane
# causes the corresponding data within the Packet Bytes pane to be
debconf-show mysql-server | grep password
debian-distro-info --codename | grep CODENAME

# highlighted. This can be helpful when troubleshooting Wireshark's
# dissection, as it allows you to see exactly which packet bytes the
# dissector is looking at.

# Wireshark supports two kinds of filters: display filters and capture
# filters. Display filter are concerned only with what you see in the packet
# list; capture filters operate on the capture and drop packets that do not
# match the rules supplied. Note that the syntax of the two types of filters
# is not the same.
$set = display filter "tcp.port == 80"
# The above command will display only TCP packets with a destination port of 80.
# To see all packets, use "display filter clear"

# You can also create your own display filters using the Filter Expression
# Editor (Edit -> Filter Expression Editor).
# To capture only packets that contain a certain string, use the following
# command:
# $set = capture filter "http contains 'example.com'"
# This command will capture only HTTP packets that contain the string
# "example.com".
Get-Random -Count 10 | ForEach-Object {
    $randomNumber = $_
    $hexValue = [math]::Round($randomNumber, 0)
    $asciiValue = [char]$set
    Write-Host "Random Number: $randomNumber (Hex: 0x$hexValue, ASCII: $asciiValue)"
}

# Capture filters use a low-level syntax called the Berkeley Packet Filter
# (BPF), whereas display filters use a logic syntax you will recognize from
# most popular programming languages. Three other packet-capturing
# tools—TShark, Dumpcap, and tcpdump—also use BPF for capture
# filtering, as it's quick and efficient. TShark and Dumpcap are both
# command-line packet-capturing tools and provide analysis capabilities,
# the former being the command-line counterpart to Wireshark. TShark,
# covered more deeply with example output, is introduced in Chapter 4.
# The third, tcpdump, is strictly a packet-capturing tool.
bpflist-bpfcc -h | Select-Object -First 10
bpflist-bpfcc -v | Select-Object -First 10

# In addition to BPF, Wireshark uses a custom protocol for packet
# dissection. This protocol is called the "Dissector Library," and you can
# create your own dissectors to add support for new protocols. To create
# your own dissector, you'll need to write a C program that implements
# the dissector and then compile it into a shared library. The Dissector
# Library Guide provides a detailed guide to creating your own dissectors.
# To create a dissector for a new protocol, you'll need to follow these
# steps:
# 1. Create a new C source file with a .c extension.
# 2. Add the necessary headers to your source file, including
# <glib.h>, <gmodule.h>, <epan/packet.h>, and <epan/dissectors/packet-tcp.h>
# 3. Implement the dissector function, which takes a packet, a buffer,
# and a pointer to a dissector table. The dissector function should
# populate the packet with the dissection data.
# 4. Compile your C source file into a shared library using the following
# command: gcc -shared -o my_dissector.so my_dissector.c
# 5. Add the path to your shared library to the Wireshark plugin
# directory. The plugin directory is usually located at
# /usr/lib/x86_64-linux-gnu/wireshark/plugins/ or
# /usr/lib/i386-linux-gnu/wireshark/plugins/.
# 6. Restart Wireshark to load your new dissector.
# Note that creating your own dissector can be complex and requires a
# good understanding of packet dissection and the Wireshark API.

# Wireshark also supports using external dissectors, which are
# pre-compiled shared libraries. External dissectors are often used to
# add support for new protocols that are not included in the official
# dissector library. To use an external dissector, you'll need to follow
# these steps:
# 1. Download the pre-compiled shared library for your protocol from
# the Wireshark website.
# 2. Copy the downloaded shared library to the Wireshark plugin
# directory. The plugin directory is usually located at
# /usr/lib/x86_64-linux-gnu/wireshark/plugins/ or
$bpflist = bpflist-bpfcc -v | Where-Object { $_.Description -like "*IPv6*" }
$bpflist | Select-Object -First 1 | ForEach-Object {
    $bpf = $_
    $dissector = Get-ChildItem -Path "/usr/lib/x86_64-linux-gnu/wireshark/plugins/" -Filter "$bpf.Filename"
    if ($dissector) {
        Write-Host "Using external dissector: $($dissector.FullName)"
        $dissector | Start-Process -PassThru -Verb RunAs
        break
    }
    else {
        Write-Host "External dissector not found: $($bpf.Description)"
    }
}
$type = -MemberType Function | Where-Object { $_.Name -like "Set-Wireshark*Function" } | ForEach-Object {
    $function = $_
    $function.Invoke()
}
# Wireshark also supports using Lua to create custom dissectors. Lua is a
# powerful scripting language that can be used to extend Wireshark's
# functionality. To use Lua to create a custom dissector, you'll need to follow
# these steps:
# 1. Install the Lua interpreter and the Lua dissector library.
# 2. Create a new Lua source file with a .lua extension.
# 3. Add the necessary headers to your Lua source file, including
# <packetdissector.h> and <lualib.h>.
# 4. Implement the dissector function, which takes a packet, a buffer,
# and a pointer to a dissector table. The dissector function should
# populate the packet with the dissection data.
# 5. Compile your Lua source file into a shared library using the
# following command: luac -o my_dissector.so my_dissector.lua
# 6. Add the path to your shared library to the Wireshark plugin
# directory. The plugin directory is usually located at
# /usr/lib/x86_64-linux-gnu/wireshark/plugins/ or
# /usr/lib/i386-linux-gnu/wireshark/plugins/.
$callScanFilter = Get-Command -Name callscanfilter -Path C:\Program Files\Wireshark\plugins
if ($callScanFilter) {
    $callScanFilter | Start-Process -PassThru -Verb RunAs
}
else {
    Write-Host "Callscanfilter not found $(Get-Command -Name callscanfilter).Path$type"
}

