#!/home/admin/app/PowerShell/Members

# Alians Update Script for Members WebApp (PowerShell)

# Import required modules
Import-Module ActiveDirectory

# Set variables
$domain = "your-domain.com"
$ouPath = "OU=Users,DC=your-domain,DC=com"
$logFile = "alians_update.log"

# Create log file
New-Item -ItemType File -Path $logFile -Force | Out-Null

# Function to update Alians
function Update-Alians {
    param (
        [Parameter(Mandatory=$true)]
        [string]$username
    )

    try {
        # Get user object
        $user = Get-ADUser -Filter "sAMAccountname -eq '$username'" -Properties Alians

        # Check if Alians attribute exists
        if ($null -ne $user.Alians) {
            # Get current Alians value
            $currentAlians = $user.Alians

            # Create a new Alians array
            $newAlians = $currentAlians + "your-new-alians@domain.com"

            # Update Alians attribute
            Set-ADUser -Identity $username -Alians $newAlians

            # Log success
            Write-Host "Alians updated for $username" -ForegroundColor Green
            Add-Content -Path $logFile -Value "$(Get-Date) - Alians updated for $username"
            return $true

        } else {
            # Log failure
            Write-Host "Alians attribute not found for $username" -ForegroundColor Red
            Add-Content -Path $logFile -Value "$(Get-Date) - Alians attribute not found for $username"
            return $false
        }

    } catch {
        # Log error
        Write-Host "Error updating Alians for $username $_" -ForegroundColor Red
        Add-Content -Path $logFile -Value "$(Get-Date) - Error updating Alians for $username $_"
        return $false
    }
    Write-Host $domain
    Write-Host $ouPath
}
