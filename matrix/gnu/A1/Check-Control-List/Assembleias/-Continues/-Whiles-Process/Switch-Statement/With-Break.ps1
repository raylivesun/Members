#!/home/admin/app/PowerShell/Members

# With Break and Continue statements
for ($i = 0; $i -lt 10; $i++) {
    if ($i -eq 5) {
        continue
    }

    Write-Host "Current Number: $i"

    if ($i -eq 7) {
        break
    }
    Write-Host "Loop Iteration: $i"
}

# With Switch statement
$imp = "Hello, World!"
switch ($imp) {
    "Hello" {
        Write-Host "Hello World!"
        break
    }
    "Goodbye" {
        Write-Host "Goodbye, World!"
        break
    }
    default {
        Write-Host "Unknown input: $input"
    }
}


# With Trap statement
trap {
    Write-Host "An error occurred: $_"
}

try {
    throw "An error occurred"
} catch {
    Write-Host "Caught an error: $_"
}

# With ForEach-Object cmdlet
$items = @("Apple", "Banana", "Cherry")
foreach ($item in $items) {
    Write-Host "Current Item: $item"
}

# With Where-Object cmdlet
$items | Where-Object { $_ -like "*a*" } | ForEach-Object { Write-Host "Matched Item: $_" }

# With Group-Object cmdlet
$items | Group-Object { $_ } | ForEach-Object { Write-Host "Group Name: $($_.Name)" } {
    Write-Host "Items in Group: $_"
}


# With Measure-Object cmdlet
$items | Measure-Object -Property Length -Average


# With Sort-Object cmdlet
$items | Sort-Object Length -Descending


# With Format-Table cmdlet
$items | Format-Table -AutoSize Name, Length


# With Select-Object cmdlet
$items | Select-Object Name, Length | Sort-Object Length -Descending


# With Out-File cmdlet
$items | Format-Table -AutoSize Name, Length | Out-File "items.txt"


# With Import-Csv cmdlet
$csvData = Import-Csv "items.csv"
$csvData | Format-Table -AutoSize Name, Length


# With Export-Csv cmdlet
$items | Format-Table -AutoSize Name, Length | Export-Csv "items_export.csv" -NoTypeInformation


# With Join-Object cmdlet
$csvData = Import-Csv "items.csv"
$jsonData = Get-Content "items.json" | ConvertFrom-Json
$joinedData = Join-Object -InputObject $csvData, $jsonData -On Name -AsPrefix "CSV_" | Format-Table -AutoSize Name, CSV_Length, JSON
$joinedData | Out-File "joined_data.txt"


# With Add-Member cmdlet
$items | Add-Member -MemberType NoteProperty -Name LengthInMeters -Value ($_.Length / 1000)


# With Remove-Member cmdlet
$items | Remove-Member -MemberType NoteProperty -Name LengthInMeters


# With Format-Custom cmdlet
$items | Format-Custom -AutoSize Name, LengthInMeters -Format @{
    Name = { $_.Name }
    LengthInMeters = { "{0:N2}" -f $_.LengthInMeters }
}


# With Get-Command cmdlet
$command = Get-Command -Name "Get-Process"
Write-Host "Command Name: $($command.Name)"
Write-Host "Command Path: $($command.Path)"
Write-Host "Command Version: $($command.Version)"
Write-Host "Command Description: $($command.Description)"
Write-Host "Command HelpTopic: $($command.HelpTopic)"
Write-Host "Command Parameters:"
foreach ($parameter in $command.Parameters) {
    Write-Host "    Name: $($parameter.Name)"
    Write-Host "    Type: $($parameter.ParameterType.FullName)"
    Write-Host "    Description: $($parameter.Description)"
}


# With Test-Connection cmdlet
$connectionTest = Test-Connection -ComputerName "localhost" -Count 1 -Quiet
if ($connectionTest) {
    Write-Host "Connection to localhost successful"
    Write-Host "Ping status: $($connectionTest.PingStatus)"
    Write-Host "Round-trip time: $($connectionTest.RoundTripTime) ms"
    Write-Host "Response time: $($connectionTest.ResponseTime) ms"
    Write-Host "Bytes received: $($connectionTest.BytesReceived)"
    Write-Host "Bytes sent: $($connectionTest.BytesSent)"
    Write-Host "Time taken: $($connectionTest.TimeTaken) ms"
    Write-Host "Source IP: $($connectionTest.SourceIP)"
    Write-Host "Destination IP: $($connectionTest.DestinationIP)"
    Write-Host "Source port: $($connectionTest.SourcePort)"
    Write-Host "Destination port: $($connectionTest.DestinationPort)"
    Write-Host "TTL: $($connectionTest.TTL)"
    Write-Host "Interface: $($connectionTest.Interface)"
    Write-Host "Options: $($connectionTest.Options)"
    Write-Host "ReplyStatus: $($connectionTest.ReplyStatus)"
    Write-Host "ReplyType: $($connectionTest.ReplyType)"
    Write-Host "ReplyTTL: $($connectionTest.ReplyTTL)"
    Write-Host "ReplyDestinationIP: $($connectionTest.ReplyDestinationIP)"
    Write-Host "ReplySourceIP: $($connectionTest.ReplySourceIP)"
    Write-Host "ReplySourcePort: $($connectionTest.ReplySourcePort)"
    Write-Host "ReplyDestinationPort: $($connectionTest.ReplyDestinationPort)"
    Write-Host "ReplyOptions: $($connectionTest.ReplyOptions)"
    Write-Host "ReplyBytesReceived: $($connectionTest.ReplyBytesReceived)"
    Write-Host "ReplyBytesSent: $($connectionTest.ReplyBytesSent)"
    Write-Host "ReplyTimeTaken: $($connectionTest.ReplyTimeTaken) ms"
    Write-Host "ReplySourceIP: $($connectionTest.ReplySourceIP)"
    Write-Host "ReplyDestinationIP: $($connectionTest.ReplyDestinationIP)"
    Write-Host "ReplySourcePort: $($connectionTest.ReplySourcePort)"
    Write-Host "ReplyDestinationPort: $($connectionTest.ReplyDestinationPort)"
    Write-Host "ReplyOptions: $($connectionTest.ReplyOptions)"
    Write-Host "ReplyBytesReceived: $($connectionTest.ReplyBytesReceived)"
    Write-Host "ReplyBytesSent: $($connectionTest.ReplyBytesSent)"
    Write-Host "ReplyTimeTaken: $($connectionTest.ReplyTimeTaken) ms"
    Write-Host "ReplySourceIP: $($connectionTest.ReplySourceIP)"
    Write-Host "ReplyDestinationIP: $($connectionTest.ReplyDestinationIP)"
    Write-Host "ReplySourcePort: $($connectionTest.ReplySourcePort)"
    Write-Host "ReplyDestinationPort: $($connectionTest.ReplyDestinationPort)"
    Write-Host "ReplyOptions: $($connectionTest.ReplyOptions)"
    Write-Host "ReplyBytesReceived: $($connectionTest.ReplyBytesReceived)"
    Write-Host "ReplyBytesSent: $($connectionTest.ReplyBytesSent)"
    Write-Host "ReplyTimeTaken: $($connectionTest.ReplyTimeTaken) ms"
    Write-Host "ReplySourceIP: $($connectionTest.ReplySourceIP)"
    Write-Host "ReplyDestinationIP: $($connectionTest.ReplyDestinationIP)"
    Write-Host "ReplySourcePort: $($connectionTest.ReplySourcePort)"
    Write-Host "ReplyDestinationPort: $($connectionTest.ReplyDestinationPort)"
    Write-Host "ReplyOptions: $($connectionTest.ReplyOptions)"
    Write-Host "ReplyBytesReceived: $($connectionTest.ReplyBytesReceived)"
    Write-Host "ReplyBytesSent: $($connectionTest.ReplyBytesSent)"
    Write-Host "ReplyTimeTaken: $($connectionTest.ReplyTimeTaken) ms"
    Write-Host "ReplySourceIP: $($connectionTest.ReplySourceIP)"
    Write-Host "ReplyDestinationIP: $($connectionTest.ReplyDestinationIP)"
    Write-Host "ReplySourcePort: $($connectionTest.ReplySourcePort)"
    Write-Host "ReplyDestinationPort: $($connectionTest.ReplyDestinationPort)"
    Write-Host "ReplyOptions: $($connectionTest.ReplyOptions)"
    Write-Host "ReplyBytesReceived: $($connectionTest.ReplyBytesReceived)"
    Write-Host "ReplyBytesSent: $($connectionTest.ReplyBytesSent)"
    Write-Host "ReplyTimeTaken: $($connectionTest.ReplyTimeTaken) ms"
    Write-Host "ReplySourceIP: $($connectionTest.ReplySourceIP)"
    Write-Host "ReplyDestinationIP: $($connectionTest.ReplyDestinationIP)"
    Write-Host "ReplySourcePort: $($connectionTest.ReplySourcePort)"
    Write-Host "ReplyDestinationPort: $($connectionTest.ReplyDestinationPort)"
    Write-Host "ReplyOptions: $($connectionTest.ReplyOptions)"
    Write-Host "ReplyBytesReceived: $($connectionTest.ReplyBytesReceived)"
} else {
    Write-Host "Connection to localhost failed"
}
