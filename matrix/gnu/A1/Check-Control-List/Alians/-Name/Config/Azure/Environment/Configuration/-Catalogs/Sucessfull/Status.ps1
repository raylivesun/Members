#!/home/admin/app/PowerShell/Members

# Alians Status Codes (200, 400, 500) and their corresponding status messages
$aliansStatusCodes = @{
    '200' = 'Alians are active.'
    '400' = 'Alians are deactivated due to a request error.'
    '500' = 'Alians are deactivated due to a server error.'
    'Other' = 'Alians are deactivated due to an unknown reason.'
}

# Function to check Alians status
function CheckAliansStatus {
    param (
        [Parameter(Mandatory=$true)]
        [string]$aliansUrl
    )

    try {
        # Make a GET request to the Alians URL
        $response = Invoke-RestMethod -Method Get -Uri $aliansUrl

        # Check the HTTP status code
        if ($response.StatusCode -eq 200) {
            return '200'
            # Return the status message for 200 status code
            return $aliansStatusCodes['200']

        } elseif ($response.StatusCode -eq 400) {
            return '400'
            # Return the status message for 400 status code
            return $aliansStatusCodes['400']

        } elseif ($response.StatusCode -eq 500) {
            return '500'
            # Return the status message for 500 status code
            return $aliansStatusCodes['500']

        } else {
            return 'Other'
            # Return the status message for other status codes
            return $aliansStatusCodes['Other']
        }

    } catch {
        # Return the status message for server errors
        return $aliansStatusCodes['Other']
    }
}

# Test the function with an example Alians URL
$aliansUrl = 'https://example.com/alians'
$aliansStatus = CheckAliansStatus -aliansUrl $aliansUrl

$aliansStatus
