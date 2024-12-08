#!/home/admin/app/PowerShell/Members

# Get Claim Value from the ClaimsPrincipal object (retrieved from the JWT token)
function Get-ClaimValue($claimsPrincipal, $claimType) {
    $claim = $claimsPrincipal.Claims | Where-Object { $_.Type -eq $claimType }
    return $claim.Value
}

# Function to get the current date and time in UTC format
function Get-UtcDateTime() {
    [datetime]::UtcNow.ToString('o')
}

# Function to get the JWT token from the provided API endpoint
function Get-JwtToken($apiUrl, $clientId, $clientSecret) {
    $authUrl = "https://login.microsoftonline.com/common/oauth2/v2.0/token"
    $grantType = "client_credentials"
    $scope = "https://graph.microsoft.com/.default"

    $body = @{
        client_id     = $clientId
        client_secret = $clientSecret
        grant_type    = $grantType
        scope        = $scope
        resource      = "https://graph.microsoft.com"
    }

    $bodyJson = ConvertTo-Json -InputObject $body
    $headers = @{
        'Content-Type'  = 'application/json'
        'Accept'       = 'application/json'
    }
    try {
        $response = Invoke-RestMethod -Method POST -Uri $authUrl -Headers $headers -Body $bodyJson
        return $response.access_token
    }
    catch {
        Write-Error "Error retrieving JWT token: $_"
        return $null
    }
}

# Function to get the list of all users in the tenant
function Get-Users($jwtToken, $apiUrl) {
    $headers = @{
        'Authorization' = "Bearer $jwtToken"
        'Accept'       = 'application/json'
    }
    try {
        $response = Invoke-RestMethod -Method GET -Uri "$apiUrl/users" -Headers $headers
        return $response.value
    }
    catch {
        Write-Error "Error retrieving users: $_"
        return $null
    }
    finally {
        Remove-Variable -Name response -Scope Global
    }
}

# Function to get the user's profile by ID
function Get-UserProfile($jwtToken, $apiUrl, $userId) {
    $headers = @{
        'Authorization' = "Bearer $jwtToken"
        'Accept'       = 'application/json'
    }
    try {
        $response = Invoke-RestMethod -Method GET -Uri ("$apiUrl/users/{0}" -f $userId) -Headers $headers
        return $response
        # Uncomment the following line to return the full response body
        # return $response.Content | ConvertFrom-Json
    }
    catch {
        Write-Error "Error retrieving user profile: $_"
        return $null
    }
    finally {
        Remove-Variable -Name response -Scope Global
    }
}

# Function to update the user's profile
function Update-UserProfile($jwtToken, $apiUrl, $userId, $updateData) {
    $headers = @{
        'Authorization' = "Bearer $jwtToken"
        'Content-Type'  = 'application/json'
        'Accept'       = 'application/json'
    }
    $headers
}

# Main script
$clientId     = "your_client_id"
$clientSecret = "your_client_secret"
$apiUrl      = "https://graph.microsoft.com/v1.0"

# Get JWT token
$jwtToken = Get-JwtToken -apiUrl $apiUrl -clientId $clientId -clientSecret $clientSecret

# Get list of all users
$users = Get-Users -jwtToken $jwtToken -apiUrl $apiUrl

# Print the number of users
Write-Host "Number of users: $($users.Count)"

# Get user profile by ID
$userId = "user_id_to_update"
$userProfile = Get-UserProfile -jwtToken $jwtToken -apiUrl $apiUrl -userId $userId

# Print the user's profile
Write-Host "User profile:"
Write-Host "ID: $($userProfile.id)"
Write-Host "Name: $($userProfile.displayName)"
Write-Host "Email: $($userProfile.mail)"

# Update the user's profile
# Uncomment the following lines to update the profile
# $updateData = @{ displayName = "New Display Name" }
# $headers = Update-UserProfile -jwtToken $jwtToken -apiUrl $apiUrl -userId $userId -updateData $updateData
# Write-Host "Updated user profile headers:"
# Write-Host $headers

