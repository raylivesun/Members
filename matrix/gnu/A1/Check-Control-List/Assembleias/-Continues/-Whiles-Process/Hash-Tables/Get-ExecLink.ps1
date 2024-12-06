#!/home/admin/app/PowerShell/Members

# Get Exec Link file path from command line arguments
$filePath = $args[0]

# Check if the file exists
if (!(Test-Path -Path $filePath)) {
    Write-Error "File not found: $filePath"
    exit 1
}

# Get the target path from the Exec Link file
$execLinkProperties = Get-ItemProperty -Path $filePath
$targetPath = $execLinkProperties.TargetPath

# Check if the target path is a valid file
if (!(Test-Path -Path $targetPath)) {
    Write-Error "Target file not found: $targetPath"
    exit 1
}

# Get the target file properties
$targetFileProperties = Get-Item -Path $targetPath

# Get the file size in bytes
$fileSize = $targetFileProperties.Length

# Convert the file size to megabytes
$fileSizeMB = [math]::Round($fileSize / 1MB, 2)
Write-Debug "File size: $fileSizeMB MB"

# Get the creation time of the target file
$creationTime = $targetFileProperties.CreationTime

# Convert the creation time to a human-readable format
$creationTimeString = $creationTime.ToString("yyyy-MM-dd HH:mm:ss")
Write-Debug "Creation time: $creationTimeString"

# Get the last write time of the target file
$lastWriteTime = $targetFileProperties.LastWriteTime
Write-Debug "Last write time: $lastWriteTime"

# Get the file's security descriptor
$securityDescriptor = Get-ACL -Path $targetPath

# Get the owner and group of the target file
$owner = $securityDescriptor.Owner
$group = $securityDescriptor.Group
Write-Debug "Owner: $owner"
Write-Debug "Group: $group"

# Get the permissions of the target file
$permissions = Get-ACL -Path $targetPath | Format-Table IdentityReference,FileSystemRights,AccessControlType
Write-Debug "Permissions:"
$permissions

