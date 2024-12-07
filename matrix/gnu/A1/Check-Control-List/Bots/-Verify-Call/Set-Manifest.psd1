#!/home/admin/app/PowerShell/Members

# Set Manifest Version and Application Name
$manifestVersion = "1.0.0"
$applicationName = "PowerShell Members"

# Create the PowerShell script file
$scriptFile = Join-Path (Get-Location) "$applicationName.ps1"
New-Item -ItemType File -Path $scriptFile -Force

# Write the manifest header
$manifestHeader = @"
# Manifest Version
$manifestVersion

# Application Name
$applicationName

# PowerShell Version
$requiredPowerShellVersion = "7.0.0"

# Description
This PowerShell script lists all members of the current PowerShell group.
# Author
Your Name <your-email@example.com>
# License
MIT License
"@

Add-Content -Path $scriptFile -Value $manifestHeader

