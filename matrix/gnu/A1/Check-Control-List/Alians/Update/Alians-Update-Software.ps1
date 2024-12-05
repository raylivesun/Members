#!/home/admin/app/PowerShell/Members

# Alians Update script for Alians PowerShell module Starter Kit
# This script will update Alians PowerShell module Starter Kit (https://github.com/Alians-Server/PowerShell)

# Define the Alians PowerShell module Starter Kit repository URL
repository_url="https://github.com/Alians-Server/PowerShell.git"

# Clone the Alians PowerShell module Starter Kit repository
git clone $repository_url

# Navigate to the cloned Alians PowerShell module Starter Kit directory
Set-Location PowerShell

# Update the Alians PowerShell module Starter Kit repository
git pull

# Return to the previous directory
Set-Location ..

# Remove the cloned Alians PowerShell module Starter Kit directory
rm -rf PowerShell

Write-Host "Alians PowerShell module Starter Kit updated successfully."

