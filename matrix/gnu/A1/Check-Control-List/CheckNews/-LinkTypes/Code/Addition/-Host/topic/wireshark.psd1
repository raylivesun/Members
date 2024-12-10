#!/home/admin/app/PowerShell/Members

# investigations directory path smilesh mine is /path/to/investigations
$investigations_dir="/path/to/investigations"

# List all files in the investigations directory
$files = Get-ChildItem -Path $investigations_dir -Recurse -File

# Loop through each file and check if it has a.eml extension
foreach ($file in $files) {
    if ($file.Extension -eq ".eml") {
        # Extract the sender's email address from the file name
        $sender_email = $file.BaseName.Split("_")[0] + "@example.com"

        # Print the sender's email address
        Write-Host "Sender's email: $sender_email"
    }
    else {
        # Skip non-email files
        continue
    }
}

cups-browsed -Filter ./Members.csv -Property "Sender's email" -Action "print"

# The building blocks of a capture filter are the protocol, direction, and
# type. For example, tcp dst port 22 captures only TCP packets with a
# destination port of 22. The possible types are:
tcpaccept-bpfcc -Capture-filter "tcp dst port 22" -out-file /path/to/tcp_connections.pcap

# The tcpdump command is used to capture network traffic on a local
# network interface. The -i argument specifies the interface to capture
# traffic on, and the -w argument specifies the output file to save the
# captured packets.
tcpdump -i eth0 -w /path/to/network_traffic.pcap


# An IDS signature is a rule that identifies a specific type of
# activity in a network traffic. For example, a signature might look for
# a specific IP address, port, or protocol. IDS signatures are used by
# intrusion detection systems (IDS) to monitor network traffic and
# alert the network administrator when suspicious activity is detected.
#
# An IDS rule is a combination of a signature and a condition that
# specifies when the signature should be triggered. For example, a rule
# might look for a specific IP address, port, or protocol and then
# trigger an alert if it is detected more than 10 times within a 5-minute
# period.
#
# An IDS ruleset is a collection of IDS rules that are applied to a
# network traffic data stream. IDS rulesets help to identify and respond
# to potential threats in a network.
#
# To create an IDS ruleset, you need to define the signatures and
# rules that will be used to monitor and alert the network administrator.
# Example:
#
# Signature 1:
# IP address: 192.168.1.100
# Port: 80
# Protocol: TCP
#
# Rule 1:
# Signature 1 (triggered if more than 10 occurrences within 5 minutes)
# Alert: Firewall blocked IP address 192.168.1.100
#
# Signature 2:
# IP address: 192.168.1.200
# Port: 443
# Protocol: TCP
#
# Rule 2:
# Signature 2 (triggered if more than 5 occurrences within 10 minutes)
# Alert: Firewall blocked IP address 192.168.1.200
#
# IDS ruleset:
# Rule 1
hostname 192.168.1.100 and port 80 and not ip src 192.168.1.100 and not

# Log analysis tools like Splunk, Elasticsearch, or Kibana can be used to
# analyze network traffic data, identify patterns, and detect anomalies.
# Splunk provides powerful search and visualization capabilities, while
# Elasticsearch and Kibana provide a more user-friendly interface for
# analyzing data.
#
# Example:
#
# Splunk query to find IP addresses that have been blocked by the firewall
# within the last 24 hours:
# index=firewall_logs sourcetype="firewall_blocked_ip"
# time_range=1d
# | stats count by ip_address | sort count desc | head 10
#
# Elasticsearch query to find IP addresses that have been blocked by the
# firewall within the last 24 hours:
# GET firewall_logs/_search
# {
#   "query": {
#     "bool": {
#       "must": [
#         {
#           "range": {
#             "@timestamp": {
#               "gte": "now-24h"
#             }
#           }
#         },
#         {
#           "match": {
#             "sourcetype": "firewall_blocked_ip"
#           }
#         }
#       ]
#     }
#   },
#   "aggs": {
#     "blocked_ips": {
#       "terms": {
#         "field": "ip_address",
#         "size": 10
#       }
#     }
#   }
# }
#
# Kibana dashboard to visualize the blocked IP addresses by the firewall:
# Create a Time-Series chart with the blocked IP addresses as the X-axis,
# and the count of blocked occurrences as the Y-axis.
# Use the "Top hits" visualization to display the top 10 blocked IP addresses
# along with their count of blocked occurrences.
# Firewall configurations can be managed using various tools and
# methods, such as iptables, iptables-save, or firewalld. Examples of
# firewall configurations include allowing incoming connections on specific
# ports, blocking outgoing connections to specific IP addresses or domains,
# and enabling or disabling specific services.
#
# Example:
#
# iptables command to allow incoming connections on port 80:
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#
# iptables command to block outgoing connections to IP address 192.168.1.100:
iptables -A OUTPUT -s 192.168.1.100 -j DROP



# A vulnerability scanner is a tool that identifies weaknesses or vulnerabilities
# in software or systems. Vulnerability scanners can be used to find potential
# security issues, such as unpatched software, outdated software, or weak
# passwords.
#
# Example:
#
# Nessus vulnerability scanner:
# Download and install the Nessus vulnerability scanner from https://www.tenable.com/download/nessus.
# Configure the Nessus scanner to scan a network or host, and then run the
# scanner to identify vulnerabilities.
#
# OpenVAS vulnerability scanner:
# Download and install the OpenVAS vulnerability scanner from https://www.openvas.org/downloads/.
# Configure the OpenVAS scanner to scan a network or host, and then run the
# scanner to identify vulnerabilities.
#
# Nmap vulnerability scanner:
# Download and install the Nmap vulnerability scanner from https://nmap.org/download.html.
# Run the Nmap scanner with the -sV option to scan a network or host, and then
# analyze the output to identify vulnerabilities.
#
# Example:
#
# Nmap vulnerability scanner:
nmap -sV -p- -oN nmap_scan.txt 192.168.1.0/24

# Metasploit framework:
# Download and install the Metasploit framework from https://www.metasploit.com/download/.
# Create a new Metasploit project by running the following command in a terminal:
msfconsole -r metasploit.rc


# A vulnerability management system (VMS) is a tool that helps organizations manage and prioritize
# vulnerabilities in their software and systems. VMS can be used to identify weaknesses, assess their
# impact, and develop mitigation strategies.
#
# Example:
#
# Red Team VMS:
# Download and install the Red Team VMS from https://redteam.nmap.org/downloads/.
# Configure the Red Team VMS to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Nessus VMS:
# Download and install the Nessus VMS from https://www.tenable.com/download/nessus.
# Configure the Nessus VMS to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# OpenVAS VMS:
# Download and install the OpenVAS VMS from https://www.openvas.org/downloads/.
# Configure the OpenVAS VMS to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Example:
#
# Nessus VMS:
faked-tcp ./filteredMembers.csv -t 192.168.1.100 -p 80 --port-range 1-1000 --scan-type syn -o open

# A vulnerability assessment framework (VAF) is a tool that helps organizations assess the security
# of their software and systems. VAFs can be used to identify weaknesses, assess their impact, and
# develop mitigation strategies.
#
# Example:
#
# Nessus VAF:
# Download and install the Nessus VAF from https://www.tenable.com/download/nessus.
# Configure the Nessus VAF to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# OpenVAS VAF:
# Download and install the OpenVAS VAF from https://www.openvas.org/downloads/.
# Configure the OpenVAS VAF to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Example:
#
# Nessus VAF:
nessus-vaf --scan-type syn --targets targets.txt --port-range 1-1000 --output-format open

# A vulnerability management tool (VMT) is a tool that helps organizations manage and prioritize
# vulnerabilities in their software and systems. VMTs can be used to identify weaknesses, assess their
# impact, and develop mitigation strategies.
#
# Example:
#
# Red Team VMT:
# Download and install the Red Team VMT from https://redteam.nmap.org/downloads/.
# Configure the Red Team VMT to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Nessus VMT:
# Download and install the Nessus VMT from https://www.tenable.com/download/nessus.
# Configure the Nessus VMT to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# OpenVAS VMT:
# Download and install the OpenVAS VMT from https://www.openvas.org/downloads/.
# Configure the OpenVAS VMT to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Example:
#
# Nessus VMT:
netqtop-bpfcc --output-format open ./filteredMembers.csv -t 192.168.1.100 -p 80 --port-range 1-1


# A vulnerability scanner is a tool that identifies weaknesses or vulnerabilities
# in software or systems. Vulnerability scanners can be used to find potential
# security issues, such as unpatched software, outdated software, or weak
# passwords.
#
# Example:
#
# Nessus vulnerability scanner:
# Download and install the Nessus vulnerability scanner from https://www.tenable.com/download/nessus.
# Configure the Nessus scanner to scan a network or host, and then run the
# scanner to identify vulnerabilities.
#
# OpenVAS vulnerability scanner:
# Download and install the OpenVAS vulnerability scanner from https://www.openvas.org/downloads/.
# Configure the OpenVAS scanner to scan a network or host, and then run the
# scanner to identify vulnerabilities.
#
# Nmap vulnerability scanner:
# Download and install the Nmap vulnerability scanner from https://nmap.org/download.html.
# Run the Nmap scanner with the -sV option to scan a network or host, and then
# analyze the output to identify vulnerabilities.
#
# Example:
#
# Nmap vulnerability scanner:
glib-genmarshal --header --prefix=g_marshal_data_marshal_data --copy g_marshal_data_marshal.list
glib-genmarshal --prefix=g_marshal_data_marshal_data --copy g_marshal_data_marshal.list g_marshal_data_marshal.list.tmp

# Metasploit framework:
# Download and install the Metasploit framework from https://www.metasploit.com/download/.
# Create a new Metasploit project by running the following command in a terminal:
msfconsole -r metasploit.rc

# A vulnerability management system (VMS) is a tool that helps organizations manage and prioritize
# vulnerabilities in their software and systems. VMS can be used to identify weaknesses, assess their
# impact, and develop mitigation strategies.
#
# Example:
#
# Red Team VMS:
# Download and install the Red Team VMS from https://redteam.nmap.org/downloads/.
# Configure the Red Team VMS to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Nessus VMS:
# Download and install the Nessus VMS from https://www.tenable.com/download/nessus.
# Configure the Nessus VMS to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# OpenVAS VMS:
# Download and install the OpenVAS VMS from https://www.openvas.org/downloads/.
# Configure the OpenVAS VMS to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Example:
#
# Nessus VMS:
faked-tcp ./filteredmembers.csv -t 192.168.1.100 -p 80 --port-range 1-1000 --scan-type syn -o open
fakeroot ./filteredMembers.csv -t 192.168.1.100 -p 80 --port-range 1-1000 --scan-type syn -o open



# A vulnerability assessment framework (VAF) is a tool that helps organizations assess the security
# of their software and systems. VAFs can be used to identify weaknesses, assess their impact, and
# develop mitigation strategies.
#
# Example:
#
# Nessus VAF:
# Download and install the Nessus VAF from https://www.tenable.com/download/nessus.
# Configure the Nessus VAF to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# OpenVAS VAF:
# Download and install the OpenVAS VAF from https://www.openvas.org/downloads/.
# Configure the OpenVAS VAF to scan a network or host, and then analyze the output to identify
# vulnerabilities.
#
# Example:
#
# Nessus VAF:
cpuunclaimed-bpfcc --output-format open ./filteredmembers.csv -t 192.168.1.100 -p 80 --port-range 1-1
fakeroot cpuunclaimed-bpfcc --output-format open ./filteredmembers.csv -t 192.168.1.100 -p 8


# A vulnerability management tool (VMT) is a tool that helps organizations manage and prioritize
# vulnerabilities in their software and systems. VMTs can be used to identify weaknesses, assess their
# impact, and develop mitigation strategies.
#
# Example:
#
# Red Team VMT:
vmwarectrl ./.Rhistory --host 192.168.1.100 --port 443 --username root --password password --command "vim /etc/passwd"
fakeroot vmwarectrl ./.Rhistory --host 192.168.1.100 --port 443 --username root --password password --command
