#!/home/admin/app/PowerShell/Members

# Alians Update: Update the aliases and functions for the PowerShell members group

# Get the aliases and functions from the Aliases and Functions folder
Get-Content Aliases\*.ps1 | Where-Object { $_ -notlike '#.*' } | Set-Content Aliases\Aliases.ps1
Get-Content Functions\*.ps1 | Where-Object { $_ -notlike '#.*' } | Set-Content Functions\Functions.ps1

# Set the environment variables for the PowerShell members group
$env:USERPROFILE = 'C:\Users\PowerShellMembers'
$env:PSModulePath = 'C:\Users\PowerShellMembers\Modules'

# Update the aliases and functions for the PowerShell members group
Import-Module Aliases
Import-Module Functions

# Set the default location for PowerShell
Set-Location C:\Users\PowerShellMembers\PowerShell

# Display the PowerShell members group message
Write-Host "PowerShell Members Group Environment Updated"
