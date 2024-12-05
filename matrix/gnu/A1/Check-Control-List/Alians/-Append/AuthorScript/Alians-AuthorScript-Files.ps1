#!/home/admin/app/PowerShell/Members

# Alians Authorization Server URL (replace with your actual URL) 
$authServerUrl = "https://your-auth-server.com"

# Client ID and Client Secret for the application (replace with your actual values)
$clientId = "your-client-id"
$clientSecret = "your-client-secret"

# Token endpoint endpoint (replace with your actual URL)
$tokenEndpoint = "$authServerUrl/connect/token"

# Resource endpoint (replace with your actual URL)
$resourceEndpoint = "https://your-resource-server.com/api/v1"

# Scope for the API request (replace with your actual scope)
$scope = "api1"

# Set the headers for the HTTP request
$headers = @{
    'Content-Type' = 'application/x-www-form-urlencoded'
}

# Authenticate with the Authorization Server
$authResponse = Invoke-RestMethod -Method Post -Uri $tokenEndpoint -Body @{
    client_id     = $clientId
    client_secret = $clientSecret
    grant_type    = 'client_credentials'
    scope         = $scope
} -Headers $headers

# Check if authentication was successful
if ($authResponse.access_token) {
    # Set the Authorization header for the API request
    $headers['Authorization'] = "Bearer $($authResponse.access_token)"

    # Make a GET request to the resource server
    $resourceResponse = Invoke-RestMethod -Method Get -Uri $resourceEndpoint -Headers $headers

    # Output the response from the resource server
    Write-Host $resourceResponse
    Write-Host "Access Token: $($authResponse.access_token)"
    Write-Host "Expires In: $($authResponse.expires_in) seconds"
    Write-Host "Refresh Token: $($authResponse.refresh_token)"
    Write-Host "Scope: $($authResponse.scope)"
    Write-Host "Token Type: $($authResponse.token_type)"
    Write-Host "Created At: $($authResponse.created_at)"
    Write-Host "Not Before: $($authResponse.not_before)"
    Write-Host "Jti: $($authResponse.jti)"
    Write-Host "User Name: $($authResponse.user_name)"
    Write-Host "Subject: $($authResponse.sub)"
    Write-Host "Issued At: $($authResponse.issued_at)"
    Write-Host "Audiences: $($authResponse.audiences)"
    Write-Host "Client Id: $($authResponse.client_id)"
    Write-Host "Identity Provider: $($authResponse.identity_provider)"
    Write-Host "Name: $($authResponse.name)"
    Write-Host "Family Name: $($authResponse.family_name)"
    Write-Host "Given Name: $($authResponse.given_name)"
    Write-Host "Email: $($authResponse.email)"
    Write-Host "Email Verified: $($authResponse.email_verified)"
    Write-Host "Phone Number: $($authResponse.phone_number)"
    Write-Host "Phone Number Verified: $($authResponse.phone_number_verified)"
    Write-Host "Profile: $($authResponse.profile)"
    Write-Host "Picture: $($authResponse.picture)"
    Write-Host "Web Profile: $($authResponse.web_profile)"
    Write-Host "Zone Info: $($authResponse.zone_info)"
    Write-Host "Locale: $($authResponse.locale)"
    Write-Host "Nickname: $($authResponse.nickname)"
    Write-Host "Preferred Username: $($authResponse.preferred_username)"
    Write-Host "Address: $($authResponse.address)"
    Write-Host "Birthdate: $($authResponse.birthdate)"
    Write-Host "Gender: $($authResponse.gender)"
    Write-Host "Updated At: $($authResponse.updated_at)"
    Write-Host "Registered At: $($authResponse.registered_at)"
    Write-Host "Nbf: $($authResponse.nbf)"
    Write-Host "Exp: $($authResponse.exp)"
    Write-Host "Iat: $($authResponse.iat)"
    Write-Host "Jti: $($authResponse.jti)"
    Write-Host "Auth Time: $($authResponse.auth_time)"
    Write-Host "Session State: $($authResponse.session_state)"
    Write-Host "Acr: $($authResponse.acr)"
    Write-Host "Auth Scheme: $($authResponse.auth_scheme)"
    Write-Host "Error: $($authResponse.error)"
    Write-Host "Error Description: $($authResponse.error_description)"
    Write-Host "Error Uri: $($authResponse.error_uri)"
    Write-Host "Claims: $($authResponse.claims)"
    Write-Host "Identities: $($authResponse.identities)"
    Write-Host "Claims Identity: $($authResponse.claims_identity)"
    Write-Host "Properties: $($authResponse.properties)"
    Write-Host "Device Code: $($authResponse.device_code)"
    Write-Host "User Code: $($authResponse.user_code)"
    Write-Host "Verification Uri Complete: $($authResponse.verification_uri_complete)"
    Write-Host "Verification Uri: $($authResponse.verification_uri)"
    Write-Host "User Code Expires In: $($authResponse.user_code_expires_in)"
    Write-Host "Interval: $($authResponse.interval)"
    Write-Host "Request Object: $($authResponse.request_object)"
    Write-Host "Scope Requested: $($authResponse.scope_requested)"
    Write-Host "Subject Type: $($authResponse.subject_type)"
    Write-Host "Authentication Context Class Reference: $($authResponse.authentication_context_class_reference)"
    Write-Host "Authorization Grant Type: $($authResponse.authorization_grant_type)"
    Write-Host "Authorization Grant Type: $($authResponse.authorization_grant_type)"

    # Refresh the access token if it expires
    if ($authResponse.expires_in -lt 3600) {
        $refreshToken = $authResponse.refresh_token
        $refreshResponse = Invoke-RestMethod -Method Post -Uri $tokenEndpoint -Body @{
            client_id     = $clientId
            client_secret = $clientSecret
            grant_type    ='refresh_token'
            refresh_token = $refreshToken
            scope         = $scope
            } -Headers $headers
        }
        if ($refreshResponse.access_token) {
            $headers['Authorization'] = "Bearer $($refreshResponse.access_token)"
            Write-Host "Access Token Refreshed: $($refreshResponse.access_token)"
        }
        else {
            Write-Host "Failed to refresh access token"
        }
    }
    else {
        Write-Host "Access token is still valid"
    }

else {
    Write-Host "Authentication failed"
}

