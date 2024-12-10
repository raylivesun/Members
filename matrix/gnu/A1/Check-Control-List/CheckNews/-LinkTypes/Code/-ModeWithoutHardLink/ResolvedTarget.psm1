#!/home/admin/app/PwoerShell/Members

# Resolved Target IP  (192.168.1.100) 
$ip="192.168.1.100"
Write-Host $ip "has been successfully added to the blocked IP list."

# Add IP to the blocked IP list
$path = "C:\Program Files\WindowsPowerShell\Modules\PowerTools\PowerTools.psm1"
if (Test-Path $path) {
    Import-Module $path
    Add-BlockedIPAddress -IPAddress $ip -Comment "Added by PowerShell script"
    Write-Host "IP $ip has been added to the blocked IP list."
    } else {
    Write-Host "The PowerTools module is not installed."
}


# Check if the IP is in the blocked IP list
$blockedIpList = Get-BlockedIPAddress
if ($blockedIpList -contains $ip) {
    Write-Host "IP $ip is currently blocked."
    } else {
    Write-Host "IP $ip is not currently blocked."
}

# Remove the IP from the blocked IP list
Remove-BlockedIPAddress -IPAddress $ip
if ($blockedIpList -notcontains $ip) {
    Write-Host "IP $ip has been removed from the blocked IP list."
    } else {
    Write-Host "Failed to remove IP $ip from the blocked IP list."
}


# Clear the blocked IP list
Clear-BlockedIPAddress
if ($blockedIpList.Count -eq 0) {
    Write-Host "The blocked IP list has been cleared."
    } else {
    Write-Host "Failed to clear the blocked IP list."
}


# Check if the IP is in the blocked IP list after clearing
if ($blockedIpList -contains $ip) {
    Write-Host "IP $ip is still in the blocked IP list after clearing."
    } else {
    Write-Host "IP $ip is no longer in the blocked IP list after clearing."
}


# Create a backup of the blocked IP list
$backupPath = "C:\Temp\blockedIPListBackup.txt"
Get-BlockedIPAddress | Format-Table -AutoSize | Out-File $backupPath -Append
Write-Host "Backup of the blocked IP list has been created at $backupPath."


# Restore the blocked IP list from a backup
Restore-BlockedIPAddress -FilePath $backupPath
if (Get-BlockedIPAddress -IPAddress $ip) {
    Write-Host "IP $ip has been restored from the backup."
    } else {
    Write-Host "Failed to restore IP $ip from the backup."
}


# Check if the IP is in the blocked IP list after restoring
if ($blockedIpList -notcontains $ip) {
    Write-Host "IP $ip is no longer in the blocked IP list after restoring."
    } else {
    Write-Host "IP $ip is still in the blocked IP list after restoring."
}


# Delete the backup file
Remove-Item $backupPath
if (!(Test-Path $backupPath)) {
    Write-Host "Backup file has been deleted."
    } else {
    Write-Host "Failed to delete the backup file."
}


# Check if the IP is in the blocked IP list after deleting the backup
if ($blockedIpList -contains $ip) {
    Write-Host "IP $ip is still in the blocked IP list after deleting the backup."
    } else {
    Write-Host "IP $ip is no longer in the blocked IP list after deleting the backup."
}

