#!/home/addmin/app/PowerShell/Members

# Multilines comments start with a '#' and continue until the end of the line.
# Here, we are importing the required modules.
# 'System.Management.Automation' module provides the necessary functions for interacting with PowerShell.
# 'System.Net.Http' module is used for making HTTP requests.

Import-Module System.Management.Automation
Import-Module System.Net.Http

# Define the URL of the API endpoint.
# Replace 'your-api-endpoint' with the actual URL of your API endpoint.
$apiUrl = 'https://your-api-endpoint/members'

# Define the headers for the HTTP request.
# 'Authorization' header is required for making authenticated requests.
# Replace 'Bearer your-api-token' with the actual token for authentication.
$headers = @{
    'Authorization' = 'Bearer your-api-token'
}

try {
    # Send a GET request to the API endpoint using the defined headers.
    $response = Invoke-RestMethod -Method Get -Uri $apiUrl -Headers $headers

    # Check if the HTTP status code is 200 (OK).
    if ($response.StatusCode -eq 200) {
        # Parse the JSON response into an object.
        $members = ConvertFrom-Json -InputObject $response.Content

        # Loop through each member object in the response.
        foreach ($member in $members) {
            # Print the member's name and email.
            Write-Host "Name: $($member.name), Email: $($member.email)"
        }

        # Print the total number of members.
        Write-Host "Total members: $($members.Count)"
    }
    else {
        # If the HTTP status code is not 200, print an error message.
        Write-Host "Error: Failed to retrieve members. HTTP status code: $($response.StatusCode)"
    }

} catch {
    # If an error occurs during the request, print the error message.
    Write-Host "Error: $($_.Exception.Message)"
}

