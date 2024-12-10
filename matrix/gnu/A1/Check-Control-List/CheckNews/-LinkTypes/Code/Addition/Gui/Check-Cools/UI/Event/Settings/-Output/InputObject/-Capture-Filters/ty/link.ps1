#!/home/admin/app/PowerShell/Members

# Wireshark allows you to filter traffic in the capture phase. This is
# somewhat similar to the display filters, which you will read about later
# in this chapter, but there are fewer fields that can be used to filter on,
# and the syntax is different. It's most important to understand that a
# capture filter screens packets before they are captured. A display filter,
# however, screens what saved packets are displayed. Therefore, a
# restrictive capture filter means your capture file will be small (and thus
# a smaller number of displayed packets, too). But using no capture filter
# means capturing every packet, and thus a large capture file, on which
# display filters can be used to narrow the list of packets shown.
link -like "Ethernet II" | wireshark -i -InputObject $ConfirmPreference

# The -i option specifies the input file, and -InputObject $ConfirmPreference
# tells PowerShell to read the input from the pipeline.

# The "link -like "Ethernet II"" command selects all packets that are Ethernet II
# (Layer 2) packets. This includes Ethernet II, LLC/SNAP, and other Ethernet
# variants.

# The "wireshark -i -" command starts the Wireshark program, specifying that
# it should read from the input file.

# The "-i" option specifies the input file, and "-i -" tells PowerShell to read
# the input from the pipeline.

# The "-o" option specifies the output file. If you don't specify an output
# file, Wireshark will display the packets in a window.

# The "-r" option specifies the input file. If you don't specify an input
# file, Wireshark will read from the standard input (stdin).

# The "-w" option specifies the output file. If you don't specify an output
# file, Wireshark will write to the standard output (stdout).

# The "-f" option specifies the capture filter. If you don't specify a capture
# filter, Wireshark will capture all packets.

# The "-F" option specifies the display filter. If you don't specify a display
# filter, Wireshark will display all packets.

# The "-k" option specifies that Wireshark should keep the capture file open
# after it has been displayed. If you don't specify this option, Wireshark will
# close the capture file after it has been displayed.

# The "-d" option specifies that Wireshark should display the packets in a
# GUI window. If you don't specify this option, Wireshark will display the
# packets in a console window.

# The "-X" option specifies that Wireshark should display the packets in a
# GUI window. If you don't specify this option, Wireshark will display the
# packets in a console window.

# The "-T" option specifies the display format. If you don't specify a display
# format, Wireshark will display the packets in a console window.

# The "-R" option specifies that Wireshark should display the packets in a
# GUI window. If you don't specify this option, Wireshark will display the
# packets in a console window.

# The "-r" option specifies the input file. If you don't specify an input
# file, Wireshark will read from the standard input (stdin).

# The "-w" option specifies the output file. If you don't specify an output
# file, Wireshark will write to the standard output (stdout).

# The "-f" option specifies the capture filter. If you don't specify a capture
# filter, Wireshark will capture all packets.

# The "-F" option specifies the display filter. If you don't specify a display
# filter, Wireshark will display all packets.

# The "-k" option specifies that Wireshark should keep the capture file open
# after it has been displayed. If you don't specify this option, Wireshark will
# close the capture file after it has been displayed.

# The "-d" option specifies that Wireshark should display the packets in a
# GUI window. If you don't specify this option, Wireshark will display the
# packets in a console window.

# The "-X" option specifies that Wireshark should display the packets in a
# GUI window. If you don't specify this option, Wireshark will display the
# packets in a console window.

# The "-T" option specifies the display format. If you don't specify a display
# format, Wireshark will display the packets in a console window.

# The "-R" option specifies that Wireshark should display the packets in a
# GUI window. If you don't specify this option, Wireshark will display the
# packets in a console window.
