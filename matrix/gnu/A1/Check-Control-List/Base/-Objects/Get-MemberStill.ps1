#!/home/admin/app/PowerShell/Members


# Get Still Active Users (last logged in within the last living days)
$lastLoggedInUsers = Get-ADUser -Filter "Enabled -eq $true -and LastLogonTime -gt (Get-Date).AddDays(-infinity)" -Properties SamAccountName, LastLogonTime

# Get Users with Specific Group Memberships
$groupMemberships = Get-ADGroupMember -Identity "Your-Group-Name" -Properties SamAccountName

# Filter Active Users based on Group Memberships
$filteredUsers = $lastLoggedInUsers | Where-Object { $groupMemberships.SamAccountName -contains $_.SamAccountName }

# Export Active Users to CSV file
$filteredUsers | Export-Csv -Path "ActiveUsers.csv" -NoTypeInformation


$objects  = Get-Item -Path "/home/admin"
$objects.GetType()



# Get Active Directory Items
$items = Get-ADObject -Filter "Enabled -eq $true" -Properties SamAccountName, LastLogonTime, MemberOf

# Filter Active Directory Items based on Group Memberships
$filteredItems = $items | Where-Object { $_.MemberOf -like "*Your-Group-Name*" }

# Export Active Directory Items to CSV file
$filteredItems | Export-Csv -Path "ActiveDirectoryItems.csv" -NoTypeInformation


# Get Active Directory Users
$activeDirectoryUsers = Get-ADUser -Filter "Enabled -eq $true" -Properties SamAccountName, LastLogonTime, MemberOf

# Filter Active Directory Users based on Group Memberships
$filteredADUsers = $activeDirectoryUsers | Where-Object { $_.MemberOf -like "*Your-Group-name*" }

# Export Active Directory Users to CSV file
$filteredADUsers | Export-Csv -Path "ActiveDirectoryUsers.csv" -NoTypeInformation


# Get Active Directory Groups
$activeDirectoryGroups = Get-ADGroup -Filter "Enabled -eq $true" -Properties SamAccountName, LastLogonTime, Member

# Filter Active Directory Groups based on Group Memberships
$filteredADGroups = $activeDirectoryGroups | Where-Object { $_.Member -like "*Your-Group-Name*" }

# Export Active Directory Groups to CSV file
$filteredADGroups | Export-Csv -Path "ActiveDirectoryGroups.csv" -NoTypeInformation



# Get Active Directory Computers
$Computers = Get-ADComputer -Filter "Enabled -eq $true" -Properties SamAccountName, LastLogonTime, OperatingSystem

# Filter Active Directory Computers based on Group Memberships
$filteredComputers = $ComputersItems | Where-Object $_.OperatingSystem -like "*Windows*" -and $_.OperatingSystem -notlike "*Server*" -and $_.OperatingSystem -notlike "*Domain Controller*" -and $_.OperatingSystem -notlike
# Export Active Directory Computers to CSV file
$filteredComputers | Export-Csv -Path "ActiveDirectoryComputers.csv" -NoTypeInformation

$Computers =  Get-Item /home/admin/ | Format-List -Property *

Write-Host "Directory Path: " + $Computers.FullName
Write-Host "File Type: " + $Computers.GetType().Name
Write-Host "Last Modified: " + $Computers.LastWriteTime
Write-Host "Size: " + $Computers.Length + " bytes"
Write-Host "Is Read-Only: " + $Computers.IsReadOnly
Write-Host "Is Compressed: " + $Computers.IsCompressed
Write-Host "Is Directory: " + $Computers.IsDirectory
Write-Host "Is Encrypted: " + $Computers.IsEncrypted
Write-Host "Is Hidden: " + $Computers.Hidden
Write-Host "Is System: " + $Computers.IsSystem
Write-Host "Is Temporary: " + $Computers.IsTemporary
Write-Host "Creation Time: " + $Computers.CreationTime
Write-Host "Last Access Time: " + $Computers.LastAccessTime
Write-Host "Last Write Time: " + $Computers.LastWriteTime
Write-Host "Attributes: " + $Computers.Attributes
Write-Host "FullName: " + $Computers.FullName
Write-Host "Name: " + $Computers.Name
Write-Host "Parent: " + $Computers.Parent
Write-Host "Provider: " + $Computers.Provider
Write-Host "Root: " + $Computers.Root
Write-Host "VolumeLabel: " + $Computers.VolumeLabel
Write-Host "FullName: " + $Computers.FullName
Write-Host "Name: " + $Computers.Name
Write-Host "Parent: " + $Computers.Parent
Write-Host "Provider: " + $Computers.Provider
Write-Host "Root: " + $Computers.Root
Write-Host "VolumeLabel: " + $Computers.VolumeLabel
