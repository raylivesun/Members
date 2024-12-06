#!/home/admin/app/PowerShell/Members

# ping static IPs and save output to a file
ping -n 4 192.168.1.1 > ping_results.txt

# parse the ping results and extract the IP addresses and round-trip times
# store these in an associative array (hash map)
$results = @{}
Get-Content ping_results.txt | ForEach-Object {
    if ($_ -like '*bytes=32*') {
        $ip = $_.Split()[3]
        $rtt = $_.Split()[4]
        $results[$ip] = $rtt
    }
    else {
        continue
    }
}

# sort the hash map by round-trip time in ascending order
$sortedResults = $results | Sort-Object Value

# display the sorted results
foreach ($ip in $sortedResults.Keys) {
    Write-Host "IP: $ip, Round-Trip Time: $($sortedResults[$ip])ms"
}
