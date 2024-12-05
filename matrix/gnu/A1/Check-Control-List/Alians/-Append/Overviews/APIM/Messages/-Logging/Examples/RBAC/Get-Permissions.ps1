#!/home/admin/app/PowerShell/Members

# Alians RBAC Group ID (replace with your actual group ID) 
$RBAC_GROUP_ID = "your_group_id"

# Get the list of all Azure AD users
$users = Get-MsolUser -All

# Loop through each user and check if they are a member of the alians RBAC group
foreach ($user in $users) {
    $isMember = Test-MsGraphUserGroupMember -ObjectId $RBAC_GROUP_ID -UserObjectId $user.ObjectId

    if ($isMember) {
        # If the user is a member, add their email address to the output file
        $user.UserPrincipalName | Out-File -FilePath "alians_members.txt" -Append
    }
    else {
        # If the user is not a member, skip to the next iteration
        continue
    }
}


# Function to check if a user is a member of a group using Microsoft Graph API
function Test-MsGraphUserGroupMember {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectId,

        [Parameter(Mandatory=$true)]
        [string]$UserObjectId
    )

    # Get the access token for authentication
    $token = (Get-AzContext).AccessToken

    # Construct the request URL
    $graphUrl = "https://graph.microsoft.com/v1.0/groups/$ObjectId/members/$UserObjectId"

    # Make the API request
    $response = Invoke-RestMethod -Method Get -Uri $graphUrl -Headers @{Authorization = "Bearer $token" }

    # Check if the user is a member of the group
    if ($response.value -contains $UserObjectId) {
        return $true
    }
    else {
        return $false
    }
}


# Example usage
# Replace "your_group_id" with your actual group ID
# $RBAC_GROUP_ID = "your_group_id"
# Test-MsGraphUserGroupMember -ObjectId $RBAC_GROUP_ID -UserObjectId "user@domain.com"
