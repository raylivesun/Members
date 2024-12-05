#!/home/admin/app/PowerShell/Members

# Alians Prepare-Members function for bulk membership management
function PrepareMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$csvFilePath,

        [Parameter(Mandatory=$true)]
        [string]$groupName,

        [Parameter(Mandatory=$true)]
        [string]$roleName,

        [Parameter(Mandatory=$false)]
        [string]$domain,

        [Parameter(Mandatory=$false)]
        [string]$accountType = 'User'
    )

    # Load CSV file into a PSObject array
    $members = Import-Csv -Path $csvFilePath

    # Check if domain is provided and set the domain variable accordingly
    if ($domain) {
        $domain = "$domain."
    }

    # Loop through the members array and update their membership
    foreach ($member in $members) {
        # Prepare the user account name
        $userName = $member.Username.Replace(" ", "")

        # Check if the user already exists in the group
        if (!(Get-ADGroupMember -Identity $groupName -Members $userName)) {
            # Create the user account if it doesn't exist
            if (!(Test-Connection -ComputerName $domain$userName -Count 1)) {
                New-ADUser -SamAccountName $userName -Name $member.Name -Enabled $true -PassThru |
                Set-ADUser -AccountPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force)

                # Add the user to the specified group
                Add-ADGroupMember -Identity $groupName -Members $userName
            }
            else {
                Write-Host "User '$userName' already exists in the domain."
            }

            # Add the user to the specified role
            if ($accountType -eq 'User') {
                Add-ADGroupMember -Identity $roleName -Members $userName
            }
            else {
                Add-ADGroupMember -Identity $roleName -Members "cn=$userName,ou=Users,$domainDC"
            }
            Write-Host "Membership updated for user '$userName'."
        }
        else {
            Write-Host "User '$userName' already exists in the group '$groupName'."
        }
    }
    Write-Host "Membership preparation completed."
}

# Example usage
PrepareMembers -csvFilePath 'members.csv' -groupName 'Group1' -roleName 'Role1' -domain 'example.com'

