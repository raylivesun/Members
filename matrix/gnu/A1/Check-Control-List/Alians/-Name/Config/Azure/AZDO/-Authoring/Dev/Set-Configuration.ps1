#!/home/admin/app/PowerShell/Members

# Alians Authoring Key (AK) and Secret Key (SK)
$AK = "your-access-key"
$SK = "your-secret-key"

# AWS Region
$REGION = "us-west-2"


# Function to get list of AWS Lambda functions
function Get-LambdaFunctions {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Region
    )

    $uri = "https://$($REGION).lambda.amazonaws.com/2015-03-31/functions"

    $headers = @{
        "Authorization" = "AWS $AK$($SK)"
        "X-Amz-Date" = (Get-Date).ToString("yyyyMMddTHHmmss'Z'")
        "X-Amz-Target" = "AWSLambda.ListFunctions"
    }

    $payload = @{
        Marker = ""
        MaxItems = 1000
    }

    $request = [Net.HttpWebRequest]::Create($uri)
    $request.Method = "POST"
    $request.Headers.Add($headers.GetEnumerator()) | Out-Null
    $request.ContentType = "application/json"
    $request.ContentLength = [System.Text.Encoding]::UTF8.GetByteCount($payload) | ConvertTo-Json
    $requestStream = $request.GetRequestStream()
    [System.Text.Encoding]::UTF8.GetBytes($payload) | ConvertTo-Json | Write-Stream -Stream $requestStream
    $requestStream.Close()
    $response = $request.GetResponse()
    $responseStream = $response.GetResponseStream()
    $responseBody = [System.Text.Encoding]::UTF8.GetString($responseStream.ToArray())
    $responseStream.Close()
    $response.Close()

    $functions = ConvertFrom-Json $responseBody
    return $functions.Functions
}


# Get list of Lambda functions
$lambdaFunctions = Get-LambdaFunctions -Region $REGION

# Export Lambda functions to CSV
$lambdaFunctions | Export-Csv -Path "lambda_functions.csv" -NoTypeInformation
