#!/home/admin/app/PowerShell/Members

# Get Shark 3 Headers from the Shark 3 log file
awk '/shark3/ {print $11}' /var/log/shark3/shark3.log | sort | uniq > /tmp/shark3_headers.txt

# Get HTTP Headers from the Nginx access log file
awk '{print $7}' /var/log/nginx/access.log | sort | uniq > /tmp/nginx_headers.txt

# Find common headers between Shark 3 and Nginx
comm -12 /tmp/shark3_headers.txt /tmp/nginx_headers.txt > /tmp/common_headers.txt

# Display the common headers
Write-Host "Common Headers between Shark 3 and Nginx:"
cat /tmp/common_headers.txt


# Clean up temporary files
rm /tmp/shark3_headers.txt /tmp/nginx_headers.txt /tmp/common_headers.txt

# End of script


