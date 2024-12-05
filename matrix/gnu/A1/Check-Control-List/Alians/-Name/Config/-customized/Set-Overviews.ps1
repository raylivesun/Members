#!/home/admin/app/PowerShell/Members

# Alians Name to be used in the script for better readability
$alians = @{
    'Get-ADUser' = 'Get-ADUser'
    'Set-ADUser' = 'Set-ADUser'
    'Remove-ADUser' = 'Remove-ADUser'
    'Get-ADGroup' = 'Get-ADGroup'
    'New-ADGroup' = 'New-ADGroup'
    'Remove-ADGroup' = 'Remove-ADGroup'
    'Get-ADPrincipalGroupMembership' = 'Get-ADPrincipalGroupMembership'
    'Add-ADPrincipalGroupMember' = 'Add-ADPrincipalGroupMember'
    'Remove-ADPrincipalGroupMember' = 'Remove-ADPrincipalGroupMember'
    'Get-ADUserProperty' = 'Get-ADUserProperty'
    'Set-ADUserProperty' = 'Set-ADUserProperty'
}

# Function to check if the alians are defined in the script
function CheckAlians {
    param(
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$scriptPath
    )

    $aliansToCheck = $alians | Where-Object { $alians[$_] }
    $missingAlians = $aliansToCheck -notin (Get-Content $scriptPath)

    if ($missingAlians) {
        Write-Host "The following alians are not defined in the script:"
        $missingAlians | Format-Table -AutoSize

        return $false
    }
    else {
        return $true
    }
}

# Function to check if the PowerShell module is installed
function CheckPowerShellModule {
    param(
        [Parameter(Mandatory=$true)]
        [string]$moduleName
    )

    if (!(Get-Module -Name $moduleName)) {
        Write-Host "The PowerShell module '$moduleName' is not installed. Please install it before running the script."
        return $false

        # Uncomment the following line to automatically install the module
        # Install-Module -Name $moduleName -Scope CurrentUser
    }
    else {
        return $true
    }
}

# Check if the alians are defined in the script
if (!(CheckAlians -alians $alians.Keys -scriptPath './members.ps1')) {
    exit 1
}

# Check if the required PowerShell modules are installed
if (!(CheckPowerShellModule -moduleName ActiveDirectory)) {
    exit 1
}

# Run the PowerShell script with the alians
& ./members.ps1
