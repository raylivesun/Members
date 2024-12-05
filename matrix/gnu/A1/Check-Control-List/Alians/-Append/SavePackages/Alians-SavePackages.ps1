#!/home/admin/app/PowerShell/Members

# Alians Save Packages Directory (Adjust as needed) 
$aliansSavePackagesDir = "/home/admin/alians-save-packages"

# Alians Packages Directory (Adjust as needed) 
$aliansPackagesDir = "/home/admin/alians-packages"

# Alians Packages File (Adjust as needed) 
$aliansPackagesFile = "$aliansPackagesDir/alians-packages.txt"

# Alians Aliases File (Adjust as needed) 
$aliansAliasesFile = "$aliansPackagesDir/alians-aliases.txt"

# Alians Aliases Save File (Adjust as needed) 
$aliansAliasesSaveFile = "$aliansSavePackagesDir/alians-aliases.save.txt"

# Alians Aliases Backup File (Adjust as needed) 
$aliansAliasesBackupFile = "$aliansSavePackagesDir/alians-aliases.backup.txt"

# Alians Packages Backup File (Adjust as needed) 
$aliansPackagesBackupFile = "$aliansSavePackagesDir/alians-packages.backup.txt"

# Alians Aliases Backup Date (Adjust as needed) 
$aliansAliasesBackupDate = Get-Date -Format "yyyy-MM-dd_HHmmss"

# Alians Packages Backup Date (Adjust as needed) 
$aliansPackagesBackupDate = Get-Date -Format "yyyy-MM-dd_HHmmss"

# Alians Aliases Backup Directory (Adjust as needed) 
$aliansAliasesBackupDir = "$aliansSavePackagesDir/aliases-backup"

# Alians Packages Backup Directory (Adjust as needed) 
$aliansPackagesBackupDir = "$aliansSavePackagesDir/packages-backup"

# Create Alians Aliases Backup Directory if it doesn't exist
New-Item -ItemType Directory -Path $aliansAliasesBackupDir -Force | Out-Null

# Create Alians Packages Backup Directory if it doesn't exist
New-Item -ItemType Directory -Path $aliansPackagesBackupDir -Force | Out-Null

# Save Alians Aliases to Backup File
Get-Content $aliansAliasesFile | Out-File $aliansAliasesBackupFile -Append

# Save Alians Packages to Backup File
Get-Content $aliansPackagesFile | Out-File $aliansPackagesBackupFile -Append

# Clear Alians Aliases
Clear-Content $aliansAliasesFile

# Clear Alians Packages
Clear-Content $aliansPackagesFile

# Read Alians Aliases from Alians Aliases File
Get-Content $aliansAliasesFile | ForEach-Object {
    $alias = $_.Split("=")[0]
    $command = $_.Split("=")[1]
    New-Alias -Name $alias -Value $command -Scope Global
}

# Read Alians Packages from Alians Packages File
Get-Content $aliansPackagesFile | ForEach-Object {
    $package = $_.Split("=")[0]
    $version = $_.Split("=")[1]
    Install-Package -Name $package -Version $version -Force -Scope CurrentUser
}

# Print success message
Write-Host "Alians Aliases and Packages saved successfully."
Write-Host "Alians Aliases Backup: $aliansAliasesBackupFile"
Write-Host "Alians Packages Backup: $aliansPackagesBackupFile"
Write-Host "Alians Aliases Backup Directory: $aliansAliasesBackupDir"
Write-Host "Alians Packages Backup Directory: $aliansPackagesBackupDir"
Write-Host "Backup Date: $aliansAliasesBackupDate"
Write-Host "Backup Date: $aliansPackagesBackupDate"
Write-Host "Please run the PowerShell script with administrative privileges to install the required packages."
Write-Host "To restore Alians Aliases and Packages, please copy the backup files to their respective locations and run the PowerShell script with administrative privileges."
Write-Host "Remember to replace the file paths and backup directory paths in the script with your own."
Write-Host "Press any key to continue..."
Read-Host -Force ``` $aliansAliasesSaveFile

