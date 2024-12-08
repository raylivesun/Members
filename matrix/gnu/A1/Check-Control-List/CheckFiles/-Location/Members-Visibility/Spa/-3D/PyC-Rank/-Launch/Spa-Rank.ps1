#!/home/admin/admin/app/PowerShell/Members

# Jackson's account details (replace with your own) 
$accountName = "your_account_name"
$password = "your_password"
$tenantID = "your_tenant_id"
$applicationID = "your_application_id"
$applicationSecret = "your_application_secret"

# Get the current date and time for logging purposes
$currentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Log the start of the script
Write-Host "$currentDateTime - Starting script..."

# Set the environment variables for the Azure AD PowerShell module
$env:AZURE_TENANT_ID = $tenantID
$env:AZURE_APPLICATION_ID = $applicationID
$env:AZURE_APPLICATION_SECRET = $applicationSecret

# Import the Azure AD PowerShell module
Import-Module AzureAD

# Authenticate with Azure AD using the provided credentials
try {
    Connect-AzureAD -Credential (New-Object System.Management.Automation.PSCredential($accountName, (ConvertTo-SecureString -AsPlainText -Force $password)))
    Write-Host "$currentDateTime - Authenticated successfully."

    # Get the list of all Azure AD groups
    $groups = Get-AzureADGroup

    # Loop through each group
    foreach ($group in $groups) {
        # Check if the group has the "Office 365 Administrators" role
        if ($group.DisplayName -eq "Office 365 Administrators") {
            # Get the members of the group
            $members = Get-AzureADGroupMember -ObjectId $group.ObjectId

            # Loop through each member
            foreach ($member in $members) {
                # Check if the member is an external user
                if ($member.UserType -eq "ExternalUser") {
                    # Get the member's details
                    $memberDetails = Get-AzureADUser -ObjectId $member.ObjectId

                    # Log the member's details
                    Write-Host "$currentDateTime - Member details:"
                    Write-Host "Name: $($memberDetails.DisplayName)"
                    Write-Host "Email: $($memberDetails.UserPrincipalName)"
                    Write-Host "Department: $($memberDetails.Department)"
                }
                else {
                    Write-Host "$currentDateTime - Member $($member.UserPrincipalName) is not an external user."
                }
            }
            break
        }
        else {
            Write-Host "$currentDateTime - Group $($group.DisplayName) does not have the 'Office 365 Administrators' role."
        }
    }

} catch {
    # Log any authentication errors
    Write-Host "$currentDateTime - Authentication failed: $_"
}

# Log the end of the script
Write-Host "$currentDateTime - Script completed."
