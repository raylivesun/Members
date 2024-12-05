#!/home/admin/app/PowerShell/Members

# Alians Append the following lines to your PowerShell profile to automatically load this script
# $profile = "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
# if (!(Test-Path $profile)) { New-Item -ItemType File -Path $profile -Force }
# Add-Content -Path $profile -Value "Import-Module $PSScriptRoot\Members.ps1"

# Import the module
Import-Module .\Members.psm1

# List all members
Get-Member -Module Members

# List all members with a specific type
Get-Member -Module Members -MemberType Function

# List all members with a specific name
Get-Member -Module Members -Name Get-Member

# List all members with a specific name and type
Get-Member -Module Members -Name Get-Member -MemberType Function

# List all members with a specific name and type, excluding inherited members
Get-Member -Module Members -Name Get-Member -MemberType Function -ExcludeInherited

# List all members with a specific name and type, excluding inherited members and those starting with an underscore
Get-Member -Module Members -Name Get-Member -MemberType Function -ExcludeInherited -Filter { $_.Name -notlike '_' }

# List all members with a specific name and type, excluding inherited members and those starting with an underscore, and sort them by name in ascending order
Get-Member -Module Members -Name Get-Member -MemberType Function -ExcludeInherited -Filter { $_.Name -notlike '_' } | Sort-Object Name

