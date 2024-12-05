#!/home/admin/app/PowerShell/Members

# Services Account Configuration - Modify as needed
$serviceAccount = "your_service_account@your_domain.com"
$serviceAccountPassword = "your_service_account_password"

# Directory Configuration - Modify as needed
$directoryPath = "/path/to/your/directory"

# Group Configuration - Modify as needed
$groupName = "your_group_name"
$groupDescription = "your_group_description"
Write-Host ./.local.csv $groupDescription



# Function to add a service account to a directory
function Add-DirectoryServiceAccount {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [Parameter(Mandatory=$true)]
        [string]$AccountName,
        [Parameter(Mandatory=$true)]
        [SecureString]$Password
    )

    $domain = $Path.Split("\")[1]
    $userName = "$($AccountName)@$domain"

    # Convert the password to a secure string
    $securePassword = ConvertTo-SecureString -String $Password -Force

    # Add the service account to the directory
    Add-ADAccount -AccountPassword $securePassword -Path $Path -Name $userName -Enabled $true -UserPrincipalName $userName -ChangePasswordAtLogon $false

    # Add the service account to the local administrator group
    Add-ADGroupMember -Identity $groupName -Members $userName
}

# Call the function to add the service account to the directory
Add-DirectoryServiceAccount -Path $directoryPath -AccountName $serviceAccount -Password $serviceAccountPassword

Write-Host "Service account '$serviceAccount' added to directory '$directoryPath' and added to group '$groupName'"
