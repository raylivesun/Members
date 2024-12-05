#!/home/admin/app/PowerShell/Members

# Alians Microsoft.Graph modules for PowerShell
Import-Module Microsoft.Graph -Scope Local
Import-Module Microsoft.Graph.Authentication -Scope Local

# Set tenant ID, client ID, and client secret
$tenantId = "your-tenant-id"
$clientId = "your-client-id"
$clientSecret = "your-client-secret"

# Set the endpoint URL
$graphEndpoint = "https://graph.microsoft.com/v1.0"

# Authenticate the app with Azure AD
$authContext = New-Object Microsoft.Graph.Authentication.AuthenticationContext($graphEndpoint)
$authenticationResult = $authContext.AcquireTokenAsync($tenantId, $clientId, $clientSecret).Result

# Check if authentication was successful
if ($null -ne $authenticationResult) {
    $accessToken = $authenticationResult.AccessToken

    # Set the access token in the HTTP client
    $httpClient = New-Object System.Net.Http.HttpClient
    $httpClient.DefaultRequestHeaders.Authorization = "Bearer $accessToken"

    # Make a GET request to get all users
    $users = Get-GraphUser -Client $httpClient -Filter "mail eq 'your-email-address'"

    # Process each user
    foreach ($user in $users) {
        # Get user's profile photo
        $photo = Get-GraphUserPhoto -Client $httpClient -UserId $user.Id -Size 48

        # Save the profile photo to a file
        $photoPath = "C:\temp\profile-photo.jpg"
        [System.IO.File]::WriteAllBytes($photoPath, $photo.Content)

        # Log the user's name and profile photo path
        Write-Host "User Name: $($user.DisplayName)"
        Write-Host "Profile Photo Path: $photoPath"
    }
    Write-Host "Profile photos downloaded successfully!"

} else {
    Write-Host "Authentication failed!"
}
