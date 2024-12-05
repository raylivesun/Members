#!/home/admin/app/PowerShell/Members

# Alians App Settings 
$aliansApp = @{
    AliansAppUrl = "https://aliansapp.com"
    AliansAppUsername = "username"
    AliansAppPassword = "password"
}

# Alians App API Endpoints
$aliansAppApiEndpoints = @{
    GetUsers = "/api/users"
    GetUser = "/api/users/{id}"
    CreateUser = "/api/users"
    UpdateUser = "/api/users/{id}"
    DeleteUser = "/api/users/{id}"
}

# Function to make HTTP requests to Alians App API
function MakeAliansAppApiRequest {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Method,
        [Parameter(Mandatory=$true)]
        [string]$Endpoint,
        [Parameter(Mandatory=$false)]
        [object]$Payload
    )

    $headers = @{
        'Authorization' = "Bearer $(Get-AliansAppAccessToken)"
        'Content-Type'  = 'application/json'
    }

    $response = Invoke-RestMethod -Method $Method -Uri "$($aliansApp.AliansAppUrl)$Endpoint" -Headers $headers -Body ($Payload | ConvertTo-Json)
    -Compress

    return $response
}

# Function to get Alians App access token
function Get-AliansAppAccessToken {
    $response = Invoke-RestMethod -Method POST -Uri "$($aliansApp.AliansAppUrl)/token" -Body @{
        grant_type = 'password'
        username  = $aliansApp.AliansAppUsername
        password = $aliansApp.AliansAppPassword
    }

    return $response.access_token
}

# Function to get users from Alians App
function Get-AliansAppUsers {
    $response = MakeAliansAppApiRequest -Method GET -Endpoint $aliansAppApiEndpoints.GetUsers

    return $response.users
}

# Function to get a specific user from Alians App
function Get-AliansAppUser {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        [Parameter(Mandatory=$false)]
        [string]$Email
    )

    if ($Id) {
        $endpoint = "$aliansAppApiEndpoints.GetUser/$Id"
    } elseif ($Email) {
        $endpoint = "$aliansAppApiEndpoints.GetUser?email=$Email"
        $response = MakeAliansAppApiRequest -Method GET -Endpoint $endpoint
        return $response.users[0]

    } else {
        throw "Either UserId or Email must be provided."
    }

    $response = MakeAliansAppApiRequest -Method GET -Endpoint $endpoint

    return $response.user
}

# Function to create a new user in Alians App
function New-AliansAppUser {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FirstName,
        [Parameter(Mandatory=$true)]
        [string]$LastName,
        [Parameter(Mandatory=$true)]
        [string]$Email,
        [Parameter(Mandatory=$false)]
        [string]$Phone,
        [Parameter(Mandatory=$false)]
        [string]$Address
    )

    $payload = @{
        firstName = $FirstName
        lastName  = $LastName
        email     = $Email
        phone     = $Phone
        address   = $Address
    }

    $response = MakeAliansAppApiRequest -Method POST -Endpoint $aliansAppApiEndpoints.CreateUser -Payload $payload

    return $response.user
}

# Function to update a user in Alians App
function Update-AliansAppUser {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Id,
        [Parameter(Mandatory=$false)]
        [string]$FirstName,
        [Parameter(Mandatory=$false)]
        [string]$LastName,
        [Parameter(Mandatory=$false)]
        [string]$Email,
        [Parameter(Mandatory=$false)]
        [string]$Phone,
        [Parameter(Mandatory=$false)]
        [string]$Address
    )

    $payload = @{
        firstName = $FirstName
        lastName  = $LastName
        email     = $Email
        phone     = $Phone
        address   = $Address
    }

    $response = MakeAliansAppApiRequest -Method PUT -Endpoint "$aliansAppApiEndpoints.UpdateUser/$Id" -Payload $payload

    return $response.user
}

# Function to delete a user from Alians App
function Remove-AliansAppUser {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Id
    )
    
    $response = MakeAliansAppApiRequest -Method DELETE -Endpoint "$aliansAppApiEndpoints.DeleteUser/$Id"

    return $response.success
}

# Example usage
$users = Get-AliansAppUsers
Write-Host "Total users: $($users.Count)"

$user = Get-AliansAppUser -Id 123
Write-Host "User details:"
Write-Host "ID: $($user.id)"
Write-Host "Name: $($user.firstName) $($user.lastName)"
Write-Host "Email: $($user.email)"
Write-Host "Phone: $($user.phone)"
Write-Host "Address: $($user.address)"
