#!/home/admin/app/PowerShell/Members

# Set exec packages and their versions for the required PowerShell modules
$execPackages = @{
    'Pester' = '4.10.1'
    'PSScriptAnalyzer' = '1.21.0'
}

# Install required PowerShell modules
foreach ($package in $execPackages.Keys) {
    if (!(Get-Module -ListAvailable | Where-Object Name -EQ $package)) {
        Install-Module -Name $package -RequiredVersion $execPackages[$package] -Force
    }
    else {
        Update-Module -Name $package -RequiredVersion $execPackages[$package] -Force
    }
}

# Set the path to the PowerShell script that checks for execution permissions
$scriptPath = 'C:\scripts\CheckExecutionPermissions.ps1'

# Run the PowerShell script to check for execution permissions
if (Test-Path -Path $scriptPath) {
    $results = & $scriptPath
    Write-Output "Execution permissions check results:"
    Write-Output $results
}
else {
    Write-Error "The PowerShell script '$scriptPath' does not exist."
}
