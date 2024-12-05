#!/home/admin/app/PowerShell/Members

# Alians Update script for the Alians PowerShell module key Thruway Password Hasher
# Author: 3xploit0r
# Version: 1.0.0
# Date: 2023-07-06

# Import the Alians PowerShell module
Import-Module Alians.PowerShell

# Get the Alians PowerShell module version
$aliansVersion = (Get-Module Alians.PowerShell).Version.ToString()

# Get the Alians PowerShell module key Thruway Password Hasher version
$thruwayVersion = (Get-Module Alians.PowerShell.ThruwayPasswordHasher).Version.ToString()

# Check if the Alians PowerShell module key Thruway Password Hasher is installed
if (!(Get-Module Alians.PowerShell.ThruwayPasswordHasher)) {
    Write-Host "Alians PowerShell module key Thruway Password Hasher is not installed. Please install it first."
    exit 1
}

# Check if the Alians PowerShell module is installed
if (!(Get-Module Alians.PowerShell)) {
    Write-Host "Alians PowerShell module is not installed. Please install it first."
    exit 1
}

# Get the Alians PowerShell module key Thruway Password Hasher hash
$thruwayHash = (Get-Module Alians.PowerShell.ThruwayPasswordHasher).ModuleBase | Get-FileHash -Algorithm SHA256

# Get the Alians PowerShell module hash
$aliansHash = (Get-Module Alians.PowerShell).ModuleBase | Get-FileHash -Algorithm SHA256

# Compare the Alians PowerShell module hashes
if ($aliansHash.Hash -ne $thruwayHash.Hash) {
    Write-Host "Alians PowerShell module key Thruway Password Hasher is outdated. Please update it to the latest version."
    exit 1
}

# Compare the Alians PowerShell module versions
if ($aliansVersion -ne $thruwayVersion) {
    Write-Host "Alians PowerShell module is outdated. Please update it to the latest version."
    exit 1
}

# Check if the Alians PowerShell module key Thruway Password Hasher is enabled
if (!(Get-AliansKey ThruwayPasswordHasher).Enabled) {
    Write-Host "Alians PowerShell module key Thruway Password Hasher is disabled. Please enable it."
    exit 1
}

# Check if the Alians PowerShell module is enabled
if (!(Get-AliansModule Alians.PowerShell).Enabled) {
    Write-Host "Alians PowerShell module is disabled. Please enable it."
    exit 1
}

Write-Host "Alians PowerShell module key Thruway Password Hasher is up to date and enabled."
