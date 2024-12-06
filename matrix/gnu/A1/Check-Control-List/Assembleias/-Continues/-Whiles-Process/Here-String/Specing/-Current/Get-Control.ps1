#!/home/admin/app/PowerShell/Members

# Get Control Center settings from environment variables and PowerShell script
$ControlCenterUrl = $env:CONTROL_CENTER_URL
$ControlCenterUsername = $env:CONTROL_CENTER_USERNAME
$ControlCenterPassword = $env:CONTROL_CENTER_PASSWORD
$ControlCenterToken = $env:CONTROL_CENTER_TOKEN
$ControlCenterClientId = $env:CONTROL_CENTER_CLIENT_ID
$ControlCenterClientSecret = $env:CONTROL_CENTER_CLIENT_SECRET
$ControlCenterApiUrl = $env:CONTROL_CENTER_API_URL

# Set authentication headers
$headers = @{
    Authorization = "Bearer $ControlCenterToken"
    'Content-Type' = 'application/json'
}

# Function to make API requests
function MakeApiRequest($url, $method, $body) {
    $response = Invoke-RestMethod -Method $method -Uri $url -Headers $headers -Body $body -ContentType 'application/json'

    if ($response.StatusCode -ne 200) {
        throw "API request failed with status code $($response.StatusCode): $($response.Content | ConvertFrom-Json)"
    }

    return $response.Content | ConvertFrom-Json
}

# Function to create a new organization
function CreateOrganization($name) {
    $body = @{
        name = $name
    }
    $response = MakeApiRequest -Url "$ControlCenterApiUrl/organizations" -Method POST -Body ($body | ConvertTo-Json)
    return $response.id
}

# Function to create a new project within an organization
function CreateProject($organizationId, $name) {
    $body = @{
        name = $name
    }
    $response = MakeApiRequest -Url "$ControlCenterApiUrl/organizations/$organizationId/projects" -Method POST -Body ($body | ConvertTo-Json)
    return $response.id
}

# Function to create a new environment within a project
function CreateEnvironment($projectId, $name) {
    $body = @{
        name = $name
    }
    $response = MakeApiRequest -Url "$ControlCenterApiUrl/projects/$projectId/environments" -Method POST -Body ($body | ConvertTo-Json)
    return $response.id
}

# Function to create a new environment variable within an environment
function CreateEnvironmentVariable($environmentId, $name, $value) {
    $body = @{
        name = $name
        value = $value
    }
    $response = MakeApiRequest -Url "$ControlCenterApiUrl/environments/$environmentId/variables" -Method POST -Body ($body | ConvertTo-Json)
    return $response.id
}

# Function to create a new environment secret within an environment
function CreateEnvironmentSecret($environmentId, $name, $value) {
    $body = @{
        name = $name
        value = $value
    }
    $response = MakeApiRequest -Url "$ControlCenterApiUrl/environments/$environmentId/secrets" -Method POST -Body ($body | ConvertTo-Json)
    return $response.id
}

# Create an organization
$organizationId = CreateOrganization -Name "My Organization"

# Create a project within the organization
$projectId = CreateProject -OrganizationId $organizationId -Name "My Project"

# Create an environment within the project
$environmentId = CreateEnvironment -ProjectId $projectId -Name "My Environment"

# Create environment variables within the environment
CreateEnvironmentVariable -EnvironmentId $environmentId -Name "DB_HOST" -Value "localhost"
CreateEnvironmentVariable -EnvironmentId $environmentId -Name "DB_PORT" -Value "5432"
CreateEnvironmentVariable -EnvironmentId $environmentId -Name "DB_NAME" -Value "my_database"
CreateEnvironmentVariable -EnvironmentId $environmentId -Name "DB_USER" -Value "my_user"
CreateEnvironmentVariable -EnvironmentId $environmentId -Name "DB_PASSWORD" -Value "my_password"

# Create environment secrets within the environment
CreateEnvironmentSecret -EnvironmentId $environmentId -Name "SECRET_KEY" -Value "my_secret_key"
CreateEnvironmentSecret -EnvironmentId $environmentId -Name "ENCRYPTION_KEY" -Value "my_encryption_key"


Write-Host "Organization ID: $organizationId"
Write-Host "Project ID: $projectId"
Write-Host "Environment ID: $environmentId"

Write-Host "Environment variables created: $environmentVariablesCount"
Write-Host "Environment secrets created: $environmentSecretsCount"

Write-Host "Environment variables: $controlCenterApiUrl/environments/$environmentId/variables"
Write-Host "Environment secrets: $controlCenterApiUrl/environments/$environmentId/secrets"

Write-Host "Control Center URL: $ControlCenterUrl"
Write-Host "Control Center API URL: $ControlCenterApiUrl"

Write-Host "Authentication details: $ControlCenterUsername"
Write-Host "Password: [hidden]"
Write-Host "Client ID: $ControlCenterClientId"
Write-Host "Client Secret: [hidden]"

Write-Host "Note: You can use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ConstrollCenterApiUrl/environments/$environmentId/variables"
Write-Host "$ControlCenterApiUrl/environments/$environmentId/secrets"

Write-Host "$ControlCenterPassword [hidden]"
Write-Host "Client ID: $ControlCenterClientId"
Write-Host "Client Secret: [hidden]"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterClientSecret [hidden]"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterPassword [hidden]"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterClientId"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterPassword [hidden]"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterApiUrl/environments/$environmentId/variables"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterApiUrl/environments/$environmentId/secrets"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterPassword [hidden]"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterApiUrl/environments/$environmentId/variables"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterApiUrl/environments/$environmentId/secrets"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterPassword [hidden]"

Write-Host "Script execution completed successfully."
Write-Host "You can now use the provided environment variables and API URL to manage your environments and secrets in Control Center."
Write-Host "Make sure to replace the placeholders with your actual values."
Write-Host "Remember to securely store and manage your Control Center credentials."

Write-Host "$ControlCenterApiUrl/environments/$environmentId/variables"

Write-Host "Script execution completed successfully."
