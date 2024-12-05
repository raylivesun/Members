#!/home/admin/app/PowerShell/Members

# Alians Update Script for PowerShell Core 7.1 and newer versions

# Define the aliases for the commands we will use
Get-alias Get-Alians='Get-ADAlias'
Get-alias Set-Alians='Set-ADAlias'
Get-alias Remove-Alians='Remove-ADAlias'


# Prompt the user to confirm the update
$confirmUpdate = Read-Host "Do you want to update the Alians? (Y/N)" -As Boolean

if ($confirmUpdate) {
    try {
        # Update the Alians for all PowerShell Core users
        Get-ADPrincipalGroupMember -Identity 'PowerShell Core Users' | ForEach-Object {
            $user = $_

            # Get the current Alians
            $currentAlians = Get-Alians -Identity $user.SamAccountName -ErrorAction SilentlyContinue
            if ($currentAlians) {
                # Remove the current Alians
                Remove-Alians -Identity $user.SamAccountName -Confirm:$false

                # Add the new Alians
                $newAlians = $user.SamAccountName + ',PowerShell Core Users'
                Set-Alians -Identity $user.SamAccountName -Members $newAlians
                Write-Host "Alians updated for $($user.SamAccountName)"

                # Add the new Alians to the PowerShell Core Admins group
                $group = Get-ADGroup -Identity 'PowerShell Core Admins'
                if ($group) {
                    Add-ADGroupMember -Identity $group -Members $user.SamAccountName
                    Write-Host "Added $($user.SamAccountName) to the PowerShell Core Admins group"
                }
                else {
                    Write-Host "The PowerShell Core Admins group does not exist"
                }
            }
            else {
                Write-Host "No Alians found for $($user.SamAccountName)"
            }
        }
        Write-Host "Alians update completed successfully"
    }
    catch {
        Write-Host "An error occurred while updating the Alians: $_"
    }
}
else {
    Write-Host "Alians update cancelled"
}


# Prompt the user to run the script with elevated privileges
$confirmElevated = Read-Host "Do you want to run this script with elevated privileges? (Y/N)" -As Boolean

if ($confirmElevated) {
    Start-Process powershell -Verb runas -File $PSScriptRoot\update-alians.ps1
}

