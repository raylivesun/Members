#!/home/admin/app/PowerShell/Members

# Get mount points for all filesystems in the system
$mount_points = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 4} | Select-Object DeviceID, FileSystem, FreeSpace, Size

# Function to convert bytes to human-readable format
function Convert-BytesToHumanReadable {
    param (
        [Parameter(Mandatory=$true)]
        [int]$bytes
    )

    $units = @("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
    $index = 0
    while ($bytes -gt 1024) {
        $bytes = $bytes / 1024
        $index++
    }
    return "{0:N2} {1}" -f ($bytes), $units[$index]
}

# Function to calculate percentage of used space
function CalculateUsedPercentage {
    param (
        [Parameter(Mandatory=$true)]
        [int]$total_size,
        [Parameter(Mandatory=$true)]
        [int]$used_space
    )
    return ($used_space / $total_size) * 100
}

# Format and print the header
$header = "Device ID | Filesystem | Free Space | Total Space | Used Percentage"
$header_length = $header.Length
$header_line = "-" * $header_length

Write-Host $header_line
Write-Host $header
Write-Host $header_line

# Loop through each mount point and print the information
foreach ($mount_point in $mount_points) {
    $device_id = $mount_point.DeviceID
    $filesystem = $mount_point.FileSystem
    $free_space_bytes = $mount_point.FreeSpace
    $total_space_bytes = $mount_point.Size
    $used_space_bytes = $total_space_bytes - $free_space_bytes
    $total_space_human = Convert-BytesToHumanReadable $total_space_bytes
    $used_percentage = Calculate-UsedPercentage $total_space_bytes $used_space_bytes
    $row = "{0} | {1} | {2} | {3} | {4:N2}%" -f $device_id, $filesystem, $free_
     space_human $total_space_human, $used_percentage

    Write-Host $row
}


