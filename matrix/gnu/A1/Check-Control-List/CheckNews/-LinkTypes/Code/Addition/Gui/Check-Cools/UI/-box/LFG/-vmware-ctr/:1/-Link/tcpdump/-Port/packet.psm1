#!/home/admin/app/PowerShell/Members


# Port verification Package Name (PSPKG)
$PSPKG_NAME="Microsoft.VisualStudio.Workload.Azure"

# Get the version of the PSPKG
$pspkg_version = Get-Package -Name $PSPKG_NAME | Select-Object -ExpandProperty Version

# Check if the PSPKG is installed
if (Get-Package -Name $PSPKG_NAME -ListAvailable) {
    Write-Host "PSPKG $PSPKG_NAME is installed with version $pspkg_version"
    exit 0
    } else {
    Write-Host "PSPKG $PSPKG_NAME is not installed. Installing..."
    Install-Package -Name $PSPKG_NAME -Force
}


# Visual Studio Version (VSVER)
$VSVER="17.0"

# Get the list of Visual Studio installations
$vs_installations = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Microsoft Visual Studio*" -and $_.InstallLocation -like "*$VSVER*" }

# Check if Visual Studio is installed
if ($vs_installations.Count -eq 0) {
    Write-Host "Visual Studio $VSVER is not installed. Please install it from the official website."
    exit 1
    } else {
    Write-Host "Visual Studio $VSVER is installed"
    }

# Add the Microsoft Azure workload to Visual Studio
Add-WindowsFeature -Name Microsoft-VisualStudio-Workload-Azure -IncludeManagementTools

Write-Host "Azure workload for Visual Studio $VSVER has been added successfully"

