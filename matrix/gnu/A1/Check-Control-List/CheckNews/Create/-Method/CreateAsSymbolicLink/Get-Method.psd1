#!/home/admin/app/PowerShell/Members

# Get Method Parameters from the request headers and body (if any)
$methodParams = @{}
$methodParams.method = $Request.Method
$methodParams.headers = $Request.Headers.AllKeys | ForEach-Object { [PSCustomObject]@{ Key = $_; Value = $Request.Headers[$_] } }

# Check if the request body is present and parse it as JSON
if ($Request.ContentLength -gt 0) {
    $body = $null
    try {
        $body = $Request.Content | ConvertFrom-Json
    } catch {
        Write-Error "Error parsing JSON request body: $_"
    }
    $methodParams.body = $body
}

# Process the request and return the response
$response = @{
    StatusCode = 200
    Headers = @{
        'Content-Type' = 'application/json'
        'X-Powered-By' = 'PowerShell'
    }
    Body = @{
        message = 'Hello, world!'
        method = $methodParams.method
        headers = $methodParams.headers
        body = $methodParams.body
    }
    IsSuccessStatusCode = $true
}

$response | ConvertTo-Json -Depth 10
