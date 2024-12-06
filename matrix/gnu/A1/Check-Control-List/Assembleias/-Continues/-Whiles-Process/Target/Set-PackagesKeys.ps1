#!/home/admin/app/PowerShell/Members

# Set exec packages key for package name and version
$EXEC_PACKAGES_KEY="ExecPackage"
Write-Debug "PowerShell module path: $PS_MODULE_PATH"
Where-Object { $_.Name -eq "ExecPackage" } | ForEach-Object {
    $_.Version -match $EXEC_PACKAGES_KEY
    if ($matches) {
        Write-Debug "Found ExecPackage module version: $($matches[0])"
        return $true
    }
}

# Set PowerShell module path
$PS_MODULE_PATH="/home/admin/app/PowerShell/Modules"

# Set PowerShell module name
$PS_MODULE_NAME="PowerShellModule"

# Check if PowerShell module exists
if (Test-Path -Path "$PS_MODULE_PATH/$PS_MODULE_NAME") {
    Write-Debug "PowerShell module $PS_MODULE_NAME exists"
    # Check if PowerShell module version is compatible
    $PS_MODULE_VERSION = (Get-Module -Name $PS_MODULE_NAME).Version.ToString()
    Write-Debug "PowerShell module version: $PS_MODULE_VERSION"

    # Set ExecPackage version
    $EXEC_PACKAGE_VERSION = "1.0.0"
    Write-Debug "ExecPackage version: $EXEC_PACKAGE_VERSION"

    # Compare versions
    if ($PS_MODULE_VERSION -ge $EXEC_PACKAGE_VERSION) {
        Write-Host "PowerShell module $PS_MODULE_NAME is compatible with ExecPackage version $EXEC_PACKAGE_VERSION"
        return $true
    } else {
        Write-Host "PowerShell module $PS_MODULE_NAME is not compatible with ExecPackage version $EXEC_PACKAGE_VERSION"
        return $false
    }

} else {
    Write-Host "PowerShell module $PS_MODULE_NAME does not exist"
    return $false
}
