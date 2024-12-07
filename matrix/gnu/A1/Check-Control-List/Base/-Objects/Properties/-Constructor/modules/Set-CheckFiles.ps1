#!/home/admin/app/PowerShell/Members

# Set Check Point Management Server IP and credentials
$server = '192.168.1.1'
$username = 'admin'
$password = 'password'

# Import the Check Point Management SDK
Import-Module -Name CheckPointManagementSDK

# Connect to the Check Point Management Server
Connect-CheckPointServer -Server $server -Username $username -Password $password

# Get the list of all networks
$networks = Get-CheckPointNetwork

# Iterate through the networks and print their names and subnets
foreach ($network in $networks) {
    Write-Host "Network Name: $($network.Name)"
    Write-Host "Subnets:"
    foreach ($subnet in $network.Subnets) {
        Write-Host "  - $($subnet.IP) / $($subnet.PrefixLength)"
    }
    Write-Host ""
}




# Disconnect from the Check Point Management Server
Disconnect-CheckPointServer

function Set-VerifyingCredentials {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Server,
        [Parameter(Mandatory=$true)]
        [string]$Username
    )
    
    # Validate the Check Point Management Server IP address format
    if (!(Test-IPAddress -Address $Server -AllowIPv4)) {
        throw "Invalid Check Point Management Server IP address: $Server"
    }
    
    # Validate the username and password
    if ($username.Length -lt 8) {
        throw "Username must be at least 8 characters long"
    
    }
    
    # Check if the provided username contains at least one uppercase letter, one lowercase letter, one digit, and one special character
    if (!(Test-StringContainsAny -InputObject $username -Pattern '[A-Z]')) {
        throw "Username must contain at least one uppercase letter"
    }
    
    if (!(Test-StringContainsAny -InputObject $username -Pattern '[a-z]')) {
        throw "Username must contain at least one lowercase letter"
    
    }

    if (!(Test-StringContainsAny -InputObject $username -Pattern '[0-9]')) {
        throw "Username must contain at least one digit"
    
    }

    if (!(Test-StringContainsAny -InputObject $username -Pattern '[!@#$%^&*(),.?":{}|<>]')) {
        throw "Username must contain at least one special character"
    
    }
    
    Write-Host "Credentials are valid"
}

# Section 14.1: Create a Module Manifest

@{
RootModule = 'MyCoolModule.psm1'
ModuleVersion = '1.0'
CompatiblePSEditions = @('Core')
GUID = '6b42c995-67da-4139-be79-597a328056cc'
Author = 'Bob Schmob'
CompanyName = 'My Company'
Copyright = '(c) 2017 Administrator. All rights reserved.'
Description = 'It does cool stuff.'
FunctionsToExport = @()
CmdletsToExport = @()
VariablesToExport = @()
AliasesToExport = @()
DscResourcesToExport = @()
}