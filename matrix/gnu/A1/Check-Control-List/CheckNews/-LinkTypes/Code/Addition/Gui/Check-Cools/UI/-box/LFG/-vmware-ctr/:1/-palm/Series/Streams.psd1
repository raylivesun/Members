#!/home/admin/app/PowerShell/Members

# Direction can be set using src or dst. As you suspect, src is for capturing
# from a specified source address, while dst can specify the destination
# address. If it is not specified, both will be matched. In addition to
# specifying one direction, the following combined direction modifiers can
# be used: src or dst and src and dst.
dbstat-bpfcc --list-bpf-programs | grep -i 'tcpdump' | while read -r line; 
