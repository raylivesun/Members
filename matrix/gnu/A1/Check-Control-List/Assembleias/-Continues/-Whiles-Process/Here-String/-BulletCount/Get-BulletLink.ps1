#!/home/admin/app/PowerShell/Members

# Get Bullet Link details from the request headers
$bulletLink = $Request.Headers['X-Bullet-Link']

# Check if the Bullet Link header is present
if ($bulletLink) {
    # Parse the Bullet Link header value to extract the link and parameters
    $linkParts = $bulletLink.Split(',')
    $link = $linkParts[0].Trim()
    $parameters = $linkParts[1].Trim().Split(';')

    # Extract the link and parameters
    $linkUrl = $link.Substring(1) # Remove the leading "Link: "
    $linkUrl = [System.Uri]::UnescapeDataString($linkUrl)
    $linkParams = @{}
    foreach ($param in $parameters) {
        $paramParts = $param.Split('=')
        $linkParams[$paramParts[0]] = $paramParts[1]
    }

    # Check if the required parameters are present
    if ($linkParams.ContainsKey('rel') -and $linkParams.ContainsKey('uri')) {
        # Retrieve the URI from the parameters
        $uri = $linkParams['uri']

        # Perform additional operations based on the retrieved URI
        # For example, retrieve data from the URI and update the response
        $data = Get-Content -Path $uri
        $response.Content = $data
    }
    else {
        # Handle missing or invalid parameters
        $response.StatusCode = 400
        $response.Content = "Missing or invalid parameters in the Bullet Link header."
    }

    # Add additional headers to the response
    $response.Headers.Add('X-Custom-Header', 'Custom Value')
    $response.Headers.Add('X-Link-Type', 'application/json')
    
    # Set the response content type
    $response.ContentType = "application/json"
    
    $linkResponse.StatusCode = 200
    $linkResponse.Content = $response.Content
    $linkResponse.ContentType = "application/json"
}
else {
    # Handle missing Bullet Link header
    $response.StatusCode = 400
    $response.Content = "Missing Bullet Link header."
}
