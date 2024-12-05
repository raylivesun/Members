#!/home/admin/app/PowerShell/Members

# Alians Update PowerShell Script Core (PowerShell Core)
# This script is designed to automate the process of updating PowerShell Core on a Linux system.
#
# Requirements:
# - PowerShell Core 6.2.2 or later must be installed on the system
# - The script must be run as root (sudo)
# - The script must be run in a directory that is writable by the user running it
# - The script must be run on a Linux system
# - The script must have been downloaded from https://github.com/PowerShell/PowerShell/releases
#
# Usage:
# 1. Download the PowerShell Core 6.2.2 tarball from https://github.com/PowerShell/PowerShell/releases.
# 2. Extract the tarball and navigate to the extracted directory.
# 3. Run the script with the following command:
#   sudo ./update-powershell-core.sh

function PowerShellCoreUpdate() {
    # Check if PowerShell Core 6.2.2 or later is installed
    if! command -v pwsh &> /dev/null; then
        Write-Host "PowerShell Core 6.2.2 or later is not installed."
        return 1
    fi

    
    # Check if the script is running as root
    if ($EUID -ne 0) {
        Write-Host "This script must be run as root (sudo)."
        return 1
        exit 1
    
        # Check if the script is run in a writable directory
        if! [[ -w "$(Get-Location)" ]]; then
            Write-Host "The script must be run in a directory that is writable by the user running it."
            return 1
            exit 1
        fi

        # Check if the script is run on a Linux system
        if! [[ "$(uname)" == "Linux" ]]; then
        Write-Host "This script must be run on a Linux system."
            return 1
            exit 1
        fi

        # Download PowerShell Core 6.2.2 tarball
        curl -L -o powershell-core-6.2.2.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v6.2.2/powershell-core-6.2.2-linux-x64.tar.gz

        # Extract the tarball
        tar xf powershell-core-6.2.2.tar.gz
        
        # Navigate to the extracted directory
        Set-Location powershell-core-6.2.2-linux-x64

        # Copy the PowerShell Core binaries and modules to the system directory
        cp -R bin/* /usr/bin/
        cp -R modules/* /usr/share/powershell/Modules/

        # Remove the downloaded tarball
        rm -f powershell-core-6.2.2.tar.gz

        # Restart PowerShell Core
        systemctl restart powershell-core.service

        # Display success message
        Write-Host "PowerShell Core 6.2.2 has been updated successfully."
        return 0
        exit 1
        fi
    }

}