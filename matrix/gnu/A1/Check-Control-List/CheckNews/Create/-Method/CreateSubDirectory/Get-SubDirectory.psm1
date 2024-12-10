#!/home/admin/app/PowerShell/Members

# Get Sub Directory List of Members Directory (replace 'Members' with your directory name)
$subDirectories = Get-ChildItem -Path 'Members' -Directory | Select-Object Name

# Loop through each subdirectory
foreach ($subDirectory in $subDirectories) {
    # Get the date of the last modification in the subdirecto
    $lastModifiedDate = Get-Item -Path ('Members/' + $subDirectory.Name) | Select-Object LastWriteTime

    # Check if the last modification was within the last 30 days
    if ($lastModifiedDate -gt (Get-Date).AddDays(-30)) {
        # If it was, move the subdirectory to a backup directory (replace 'Backup' with your directory name)
        Move-Item -Path ('Members/' + $subDirectory.Name) -Destination 'Backup/' + $subDirectory.Name -Force
    }
    else {
        # If it wasn't, delete the subdirectory (replace 'Members' with your directory name)
        Remove-Item -Path ('Members/' + $subDirectory.Name) -Force -Recurse
    }
    Write-Host "Processed $($subDirectory.Name)"
}


# Get Sub Directory List of Public Directory (replace 'Public' with your directory name)
$subDirectories = Get-ChildItem -Path 'Public' -Directory | Select-Object Name

# Loop through each subdirectory
foreach ($subDirectory in $subDirectories) {
    # Get the date of the last modification in the subdirecto
    $lastModifiedDate = Get-Item -Path ('Public/' + $subDirectory.Name) | Select-Object LastWriteTime

    # Check if the last modification was within the last 30 days
    if ($lastModifiedDate -gt (Get-Date).AddDays(-30)) {
        # If it was, move the subdirectory to a backup directory (replace 'Backup' with your directory name)
        Move-Item -Path ('Public/' + $subDirectory.Name) -Destination 'Backup/' + $subDirectory.Name -Force
    }
    else {
        # If it wasn't, delete the subdirectory (replace 'Public' with your directory name)
        Remove-Item -Path ('Public/' + $subDirectory.Name) -Force -Recurse
    }
    Write-Host "Processed $($subDirectory.Name)"
}


# Get Sub Directory List of Staff Directory (replace 'Staff' with your directory name)
$subDirectories = Get-ChildItem -Path 'Staff' -Directory | Select-Object Name

# Loop through each subdirectory
foreach ($subDirectory in $subDirectories) {
    # Get the date of the last modification in the subdirecto
    $lastModifiedDate = Get-Item -Path ('Staff/' + $subDirectory.Name) | Select-Object LastWriteTime

    # Check if the last modification was within the last 30 days
    if ($lastModifiedDate -gt (Get-Date).AddDays(-30)) {
        # If it was, move the subdirectory to a backup directory (replace 'Backup' with your directory name)
        Move-Item -Path ('Staff/' + $subDirectory.Name) -Destination 'Backup/' + $subDirectory.Name -Force
    }
    else {
        # If it wasn't, delete the subdirectory (replace 'Staff' with your directory name)
        Remove-Item -Path ('Staff/' + $subDirectory.Name) -Force -Recurse
    }
    Write-Host "Processed $($subDirectory.Name)"
}
