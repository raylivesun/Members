#!/home/admin/app/PowerShell/Members

# Alians Append Server Roles and IPs to the $ServerRoles and $ServerIPs arrays
$ServerRoles += 'Admin', 'Backup', 'Domain Admin', 'Guest', 'Power User', 'Server Operator', 'Standard User'
$ServerIPs += '192.168.1.1', '192.168.1.2', '192.168'   

# Prompt the user to enter a server role
Write-Host "Enter a server role (case-sensitive):"
$serverRole = Read-Host

# Check if the entered server role exists in the $ServerRoles array
if ($ServerRoles -contains $serverRole) {
    # Prompt the user to enter a server IP address
    Write-Host "Enter a server IP address:"
    $serverIP = Read-Host

    # Check if the entered server IP address is in the $ServerIPs array
    if ($ServerIPs -contains $serverIP) {
        # Prompt the user to confirm the changes
        Write-Host "Adding "$serverRole with IP address $serverIP" to the server role list."
        $confirm = Read-Host "Are you sure you want to proceed? (Y/N)"

        # Check if the user confirms the changes
        if ($confirm -eq "Y"  -or $confirm -eq "y"  -or $confirm -eq "Yes"  -or $confirm -eq "yes"  -or $confirm -eq "YES") {
            # Add the server role and IP address to the server role list
            $ServerRoles += $serverRole
            $ServerIPs += $serverIP
            Write-Host "Server role and IP address added successfully."
        } else {
            Write-Host "Changes not saved."
        }

    } else {
        Write-Host "Invalid server IP address."
    }
}
