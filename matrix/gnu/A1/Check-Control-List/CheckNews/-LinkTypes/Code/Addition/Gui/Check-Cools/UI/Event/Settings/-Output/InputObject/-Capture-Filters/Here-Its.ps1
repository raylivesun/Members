#!/home/admin/app/PowerShell/Members

# Capture Filters

# There are times when capturing network traffic that you can limit the
# traffic you want beforehand; at other times you will have to because the
# capture files will grow too large too fast if you don't start filtering.
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies"

# Example: Limit to SYN traffic
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies" | grep "tcp[[:space:]]syn"

# Example: Limit to SYN traffic for a specific IP address
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies" | grep "tcp[[:space:]]syn[[:space:]]src host 192.168.0.10"

# Example: Limit to SYN traffic for a specific IP address and port
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies" | grep "tcp[[:space:]]syn[[:space:]]src host 192.168.0.10 port 8080"

# Example: Limit to SYN traffic for a specific IP address, port, and protocol
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies" | grep "tcp[[:space:]]syn[[:space:]]src host 192.168.0.10 port 8080 protocol tcp"

# Example: Limit to SYN traffic for a specific IP address, port, protocol, and destination IP address and port
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies" | grep "tcp[[:space:]]syn[[:space:]]src host 192.168.0.10 port 8080 protocol tcp"


# Example: Limit to SYN traffic for a specific IP address, port, protocol, destination IP address and port, and destination MAC address
bpflist-bpfcc -o text | grep "net.ipv4.tcp_syncookies" | grep "tcp[[:space:]]syn[[:space:]]src host 192.168.0.10 port 8080 protocol tcp"


