#!/home/admin/app/PowerShell/Members

# Alians Name and Path to PowerShell Script Upgrade Full Path 
$aliansName = "Alians"
$aliansPath = "/home/admin/app/PowerShell/Alians.ps1"

# Alians Name and Path to PowerShell Script Upgrade Full Path 
$upgradeName = "Upgrade"
$upgradePath = "/home/admin/app/PowerShell/Upgrade.ps1"

# Alians Name and Path to PowerShell Script Downgrade Full Path 
$downgradeName = "Downgrade"
$downgradePath = "/home/admin/app/PowerShell/Downgrade.ps1"

# Check if Alians PowerShell Script Upgrade Exists
if (Test-Path -Path $upgradePath) {
    # Check if Alians PowerShell Script Downgrade Exists
    if (Test-Path -Path $downgradePath) {
        # Check if Alians PowerShell Script Alians Exists
        if (Test-Path -Path $aliansPath) {
            # Run Alians PowerShell Script Upgrade
            & $upgradePath
            Write-Host "Alians PowerShell Script $upgradeName executed successfully."

            # Run Alians PowerShell Script Downgrade
            & $downgradePath
            Write-Host "Alians PowerShell Script $downgradeName executed successfully."

            # Run Alians PowerShell Script Alians
            & $aliansPath
            Write-Host "Alians PowerShell Script $aliansName executed successfully."

        } else {
            Write-Host "Alians PowerShell Script Alians does not exist."
        }

    } else {
        Write-Host "Alians PowerShell Script Downgrade does not exist."
    }

} else {
    Write-Host "Alians PowerShell Script Upgrade does not exist."
}

