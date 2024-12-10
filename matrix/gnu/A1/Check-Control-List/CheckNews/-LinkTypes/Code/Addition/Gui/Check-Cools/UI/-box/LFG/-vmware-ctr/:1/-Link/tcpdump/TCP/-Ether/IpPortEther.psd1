#!/home/admin/app/PowerShell/Members

# Ip Port EtherType Protocol Source Destination Length 
# 192.168.0.1 50001 0800 00:00:00:00:00:01 00:00:00:00:00:0
# 192.168.0.2 50002 0800 00:00:00:00:00:02 00:00:00:00:00:0
# 192.168.0.3 50003 0800 00:00:00:00:00:03 00:00:00:00:00:0
# 192.168.0.4 50004 0800 00:00:00:00:00:04 00:00:00:00:00:0

# Create the output file
Write-Output "IP Address,Port,EtherType,Protocol,Source,Destination,Length" > packet_capture.csv

# Loop through the input file
while (IFS= read -r line) {
    # Split the line into fields
    fields=($line)

    # Extract the required fields
    ip_address=${fields[0]}
    port=${fields[1]}
    ether_type=${fields[2]}
    protocol=${fields[3]}
    source=${fields[4]}
    destination=${fields[5]}
    length=${fields[6]}
}


# Use PowerShell to filter and format the captured packets
powershell -NoProfile -Command "
    $input_file = 'packet_capture.csv'
    $output_file = 'filtered_packets.csv'

    Import-Csv $input_file |
        Where-Object {
        $_.Source -eq '00:00:00:00:00:01' -and
        $_.Destination -eq '00:00:00:00:00:02' -or
        $_.Destination -eq '00:00:00:00:00:03' -or
        $_.Destination -eq '00:00:00:00:00:04'
        } |
         Format-Table -AutoSize |
         Select-Object -Property IPAddress, Port, EtherType, Protocol, Source, Destination, Length |
         Export-Csv -Path $output_file -NoTypeInformation
         
         # Display the number of filtered packets
         $filtered_count = (Get-Content $output_file).Count
         Write-Host "Number of filtered packets: $filtered_count"
          
         # Calculate the average length of filtered packets
         $average_length = (Get-Content $output_file | Measure-Object Length -Average).Average
         Write-Host "Average length of filtered packets: $average_length bytes"
         "

# Display the number of filtered packets
$filtered_count = (Get-Content filtered_packets.csv).Count
Write-Host "Number of filtered packets: $filtered_count"

# Calculate the average length of filtered packets
$average_length = (Get-Content filtered_packets.csv | Measure-Object Length -Average).Average
Write-Host "Average length of filtered packets: $average_length bytes"
