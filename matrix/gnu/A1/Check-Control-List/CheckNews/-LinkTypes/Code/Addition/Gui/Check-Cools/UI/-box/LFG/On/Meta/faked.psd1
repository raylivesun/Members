#!/home/admin/app/PowerShell/Members

# The faked URL to the Azure AD Graph API
$AAD_GRAPH_API_URL='https://graph.microsoft.com/beta/users?$filter=accountEnabled eq true'

# Use the Invoke-RestMethod cmdlet to send a GET request to the Azure AD Graph API
$response = Invoke-RestMethod -Method Get -Uri $AAD_GRAPH_API_URL -Headers @{Authorization = 'Bearer <Your-Azure-AD-Access-Token>' }

# Convert the JSON response to a PSObject for easier manipulation
$users = ConvertFrom-Json $response.Content

# Loop through each user and print their name and email address
foreach ($user in $users) {
    Write-Output "Name: $($user.displayName)"
    Write-Output "Email: $($user.mail)"
}


