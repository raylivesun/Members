#!/home/admin/app/PowerShell/Members

#  Output Speed in MB/s (1 MB = 1024 KB, 1 KB = 1024 bytes)
$outputSpeedMBps = 10
$outputSpeedBytes = $outputSpeedMBps * 1024 * 1024

#  Input Speed in MB/s
$inputSpeedMBps = 5
$inputSpeedBytes = $inputSpeedMBps * 1024 * 1024

#  Bandwidth in MB/s
$bandwidthMBps = $outputSpeedMBps + $inputSpeedMBps

#  Bandwidth in bytes/second
$bandwidthBytes = $bandwidthMBps * 1024 * 1024

#  Duration in seconds
$durationSeconds = 60 * 60  # 1 hour

#  Data transferred in bytes
$dataTransferredBytes = $bandwidthBytes * $durationSeconds

#  Data transferred in MB
$dataTransferredMB = $dataTransferredBytes / 1024 / 1024

$dataTransferredMB

Write-Output "Data transferred: $dataTransferredMB MB"
Wait-Debugger "Press any key to continue..."
Wait-Event "Key" $outputSpeedBytes
Wait-Debugger $inputSpeedBytes
