#!/home/admin/app/PowerShell/Members

# Alians Name Upgrade Script - Update Aliases to PowerShell Core

# Importing necessary modules
Import-Module ActiveDirectory

# Variables
$domain = "yourdomain.com"
$username = "yourusername@$domain"
$password = ConvertTo-SecureString "yourpassword" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)
$searchBase = "DC=yourdomain,DC=com"
$aliasFilter = "objectClass=alias"
$newPowerShellCoreAlias = "pwsh"

# Connect to Active Directory
Try {
    Connect-ADDomain -Credential $credential -Server $domain
} Catch {
    Write-Error "Failed to connect to Active Directory: $_"
    exit 1
}

# Query Active Directory for aliases
$aliases = Get-ADAlias -SearchBase $searchBase -Filter $aliasFilter

# Update aliases to PowerShell Core
foreach ($alias in $aliases) {
    try {
        Set-ADAlias -Identity $alias.Name -NewName $newPowerShellCoreAlias
        Write-Host "Updated alias $($alias.Name) to PowerShell Core alias: $newPowerShellCoreAlias"
        $alias.Refresh()
        Write-Host "Refreshed alias $($alias.Name) to reflect the change"
        Write-Host ""
        $alias.CommitChanges()
        Write-Host "Committed changes to alias $($alias.Name)"
        Write-Host ""
        Write-Host "Alias $($alias.Name) has been updated successfully"
        Write-Host ""
        Write-Host "Please remember to update any scripts or tools that rely on these aliases."
        Write-Host ""
        Write-Host "You can now run PowerShell Core scripts or tools using the alias '$newPowerShellCoreAlias'"
        Write-Host ""
        Write-Host "To use PowerShell Core, run the following command in your PowerShell session:"
        Write-Host "    $env:Path += 'C:\Program Files\PowerShell\7\'"
        Write-Host "    $env:Path += 'C:\Program Files\PowerShell\7\Modules\'"
        Write-Host ""
        Write-Host "For more information, see: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows"
        Write-Host ""
        Write-Host "Thank you for using the Alians Name Upgrade Script!"
        Write-Host ""
        exit 0

    } Catch {
        Write-Error "Failed to update alias $($alias.Name): $_"
    }
    Write-Host ""
}

Write-Host "No aliases found in Active Directory that need to be updated."
Write-Host ""
