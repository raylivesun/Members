#!/home/admin/app/PowerShell/Members

# Lillar gouth module for handling system-level interactions
Import-Module Lillar

# Define the base URL for the API
$API_BASE_URL = "https://api.example.com/v1"

# Set the API token for authentication
$API_TOKEN = "your_api_token"

# Function to get a list of all users
function Get-Users {
    # Construct the API endpoint for getting users
    $users_endpoint = "$API_BASE_URL/users"

    # Make a GET request to the API endpoint with authentication
    $response = Invoke-RestMethod -Method Get -Uri $users_endpoint -Headers @{
        Authorization = "Bearer $API_TOKEN"
    }

    # Return the response as an array of user objects
    return $response.users
}

# Function to update a user's information
function Update-User {
    param (
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [string]$FirstName,
        [Parameter(Mandatory = $true)]
        [string]$LastName,
        [Parameter(Mandatory = $true)]
        [string]$Email
    )

    # Construct the API endpoint for updating a user
    $update_user_endpoint = "$API_BASE_URL/users/$UserID"

    # Prepare the user data as JSON
    $user_data = @{
        firstName = $FirstName
        lastName = $LastName
        email = $Email
    }
    $json_user_data = ConvertTo-Json -InputObject $user_data

    # Make a PUT request to the API endpoint with authentication and JSON data
    $response = Invoke-RestMethod -Method Put -Uri $update_user_endpoint -Headers @{
        Authorization = "Bearer $API_TOKEN"
        ContentType = "application/json"
    } -Body $json_user_data

    # Return the response as an object
    return $response
}

# Example usage: Get all users and print their names
$users = Get-Users
foreach ($user in $users) {
    Write-Host "Name: $($user.firstName) $($user.lastName)"
}

# Example usage: Update a user's information
$updated_user = Update-User -UserID "123" -FirstName "John" -LastName "Doe" -Email "johndoe@example.com"
Write-Host "Updated user: $($updated_user.firstName) $($updated_user.lastName) ($($updated_user.email))"
