#!/home/admin/app/PowerShell/Members

# Generally, you use capture filters when you want to limit the amount of
# network data that goes into processing and is getting saved; you use
# display filters to drill down into only the packets you want to analyze
# once the data has been processed.
ttysnoop-bpfcc -o events.bpfcc -i eth0 -f 'eth.src == 192.168.1.100 and eth.dst == 19'

# This script uses the 'bpftrace' tool to analyze the captured network data.
# It defines a function to calculate the average packet size and a function
ttysnoop-bpfcc -e 'tracepoint:syscalls:sys_enter_recvmsg,sys_exit_recvmsg {
  @[probe] = count();
  @[avg_size] = avg(sock->sk_wmem_queued);
}' -o events.bpftrace

# Once the analysis is complete, the script generates a report using the 'bpftrace'
# tool. It displays the average packet size for the specified network traffic.
bpftrace -e 'printf("Average packet size: %.2f bytes\n", @avg_size)' events.bpftrace
