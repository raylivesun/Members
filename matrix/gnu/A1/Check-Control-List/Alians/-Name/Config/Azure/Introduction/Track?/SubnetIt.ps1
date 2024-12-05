#!/home/admin/app/PowerShell/Members

# Alians Tracking and Reporting System (ATRS)
#
# This script retrieves and processes data from Alians Tracking and Reporting System (ATRS) API endpoints.
#
# Environment Variables:
# - ATRS_API_URL: The base URL of the ATRS API, e.g., https://api.atrs.com
# - ATRS_API_KEY: Your ATRS API key
# - ATRS_API_SECRET: Your ATRS API secret
# - ATRS_MEMBER_ID: Your ATRS member ID
# - ATRS_OUTPUT_DIR: The directory where the output files will be saved, e.g., /var/www/html/atrs/output
#
# Usage:
# 1. Set the environment variables in your bash profile or shell script.
# 2. Run this script: ./atrs.sh

# Check if environment variables are set
if (-z "$ATRS_API_URL" ||  -z "$ATRS_API_KEY" || -z "$ATRS_API_SECRET" || -z "$ATRS_MEMBER_ID" || -z $ATRS) {
    Write-Output "Error: Environment variables ATRS_API_URL, ATRS_API_KEY, ATRS_API_SECRET, ATRS_MEMBER_ID, and ATRS_OUTPUT_DIR are required."
    exit 1
}


# Function to make API requests
function MakeApiRequest {
    param (
        [string]$Method,
        [string]$Url,
        [string]$Body = ""
    )
    $headers = @{
        "Authorization" = "Bearer $($env:ATRS_API_KEY)"
        "Content-Type" = "application/json"
    }
    $response = Invoke-RestMethod -Method $Method -Uri $Url -Body $Body -Headers $headers -ContentType "application/json" -MaximumRetryCount 3 -RetryInterval
    if ($response.StatusCode -ne 200) {
        Write-Output "Error making API request to $Url $($response.StatusCode) - $($response.Content)"
        exit 1
    }
    return $response.Content | ConvertFrom-Json
}


# Function to retrieve and process ATRS data
function ProcessAtrsData {
    param (
        [string]$Type,
        [string]$Start,
        [string]
        [switch]$Download
    )
    $url = "$($env:ATRS_API_URL)/$Type/members/$($env:ATRS_MEMBER_ID)?start=$Start&end=$End"
    $data = MakeApiRequest Get $url
    if ($data.data) {
        if ($download) {
            $outputDir = $env:ATRS_OUTPUT_DIR
            if (-not (Test-Path $outputDir)) {
                New-Item -ItemType Directory -Path $outputDir | Out-Null
            }
            $outputPath = Join-Path $outputDir "$Type-$Start-$End.json"
            Write-Output "Downloading $Type data from $Start to $End to $outputPath"
            $data.data | Out-File -FilePath $outputPath
        }
        else {
            Write-Output "Processing $Type data from $Start to $End"
            # Process the ATRS data as needed
            foreach ($item in $data.data) {
                # Example: Print the first 5 items
                Write-Host $item | Select-Object -First 5
            }
        }
        return $data.pagination
    }
    else {
        Write-Output "No $Type data found for $Start to $End"
        return $null
    }
}


# Retrieve and process ATRS data for each type
$start = Get-Date -Format yyyy-MM-dd
$end = Get-Date -Format yyyy-MM-dd
$pagination = $start
while ($pagination) {
    $pagination = ProcessAtrsData "alians" $pagination
    $pagination = ProcessAtrsData "alians-in-house" $pagination
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-family" $pagination
    $pagination = ProcessAtrsData "alians-without-family" $pagination
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination
    $pagination = ProcessAtrsData "alians-with-children" $pagination
    $pagination = ProcessAtrsData "alians-without-children" $pagination
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination
    $pagination = ProcessAtrsData "alians-with-parents" $pagination
    $pagination = ProcessAtrsData "alians-without-parents" $pagination
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination
    $pagination = ProcessAtrsData "alians-without-grandparents" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-parents-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-parents-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-parents-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-parents-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-grandparents-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-grandparents-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-grandparents-out-of-house" $pagination
}


# Example usage: Download the ATRS data for the last 30 days
$start = (Get-Date).AddDays(-30)
$end = Get-Date
ProcessAtrsData "alians" $start -Download
ProcessAtrsData "alians-in-house" $start -Download
ProcessAtrsData "alians-out-of-house" $start -Download
ProcessAtrsData "alians-with-family" $start -Download
ProcessAtrsData "alians-without-family" $start -Download
ProcessAtrsData "alians-with-spouse" $start -Download
ProcessAtrsData "alians-without-spouse" $start -Download
ProcessAtrsData "alians-with-children" $start -Download
ProcessAtrsData "alians-without-children" $start -Download
ProcessAtrsData "alians-with-grandchildren" $start -Download
ProcessAtrsData "alians-without-grandchildren" $start -Download
ProcessAtrsData "alians-with-siblings" $start -Download
ProcessAtrsData "alians-without-siblings" $start -Download
ProcessAtrsData "alians-with-brothers" $start -Download
ProcessAtrsData "alians-without-brothers" $start -Download
ProcessAtrsData "alians-with-sisters" $start -Download
ProcessAtrsData "alians-without-sisters" $start -Download
ProcessAtrsData "alians-with-parents" $start -Download
ProcessAtrsData "alians-without-parents" $start -Download
ProcessAtrsData "alians-with-grandparents" $start -Download
ProcessAtrsData "alians-without-grandparents" $start -Download
ProcessAtrsData "alians-with-siblings-in-house" $start -Download
ProcessAtrsData "alians-without-siblings-in-house" $start -Download
ProcessAtrsData "alians-with-siblings-out-of-house" $start -Download
ProcessAtrsData "alians-without-siblings-out-of-house" $start -Download
ProcessAtrsData "alians-with-brothers-in-house" $start -Download
ProcessAtrsData "alians-without-brothers-in-house" $start -Download
ProcessAtrsData "alians-with-brothers-out-of-house" $start -Download
ProcessAtrsData "alians-without-brothers-out-of-house" $start -Download
ProcessAtrsData "alians-with-sisters-in-house" $start -Download
ProcessAtrsData "alians-without-sisters-in-house" $start -Download
ProcessAtrsData "alians-with-sisters-out-of-house" $start -Download
ProcessAtrsData "alians-without-sisters-out-of-house" $start -Download
ProcessAtrsData "alians-with-parents-in-house" $start -Download
ProcessAtrsData "alians-without-parents-in-house" $start -Download
ProcessAtrsData "alians-with-parents-out-of-house" $start -Download
ProcessAtrsData "alians-without-parents-out-of-house" $start -Download
ProcessAtrsData "alians-with-grandparents-in-house" $start -Download
ProcessAtrsData "alians-without-grandparents-in-house" $start -Download
ProcessAtrsData "alians-with-grandparents-out-of-house" $start -Download


# Example usage: Process the ATRS data for the last 30 days
$start = (Get-Date).AddDays(-30)
$end = Get-Date
$pagination = $start
while ($pagination) {
    $pagination = ProcessAtrsData "alians" $pagination
    $pagination = ProcessAtrsData "alians-in-house" $pagination
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-family" $pagination
    $pagination = ProcessAtrsData "alians-without-family" $pagination
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination
    $pagination = ProcessAtrsData "alians-with-children" $pagination
    $pagination = ProcessAtrsData "alians-without-children" $pagination
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination
    $pagination = ProcessAtrsData "alians-with-parents" $pagination
    $pagination = ProcessAtrsData "alians-without-parents" $pagination
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination
    $pagination = ProcessAtrsData "alians-without-grandparents" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-parents-in-house" $pagination
    $pagination = ProcessAtrsData "alians-without-parents-in-house" $pagination
    $pagination = ProcessAtrsData "alians-with-parents-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-without-parents-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-grandparents-in-house" $pagination

    # Wait for 1 minute before processing the next set of data
    Start-Sleep -Seconds 60
}


# Example usage: Process the ATRS data for a specific date range
$startDate = Get-Date -Year 2022 -Month 1 -Day 1
$endDate = Get-Date -Year 2022 -Month 12 -Day 31
$pagination = $startDate
while ($pagination -le $endDate) {
    $pagination = ProcessAtrsData "alians" $pagination
    $pagination = ProcessAtrsData "alians-in-house" $pagination
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination
    $pagination = ProcessAtrsData "alians-with-family" $pagination
    $pagination = ProcessAtrsData "alians-without-family" $pagination
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination
    $pagination = ProcessAtrsData "alians-with-children" $pagination
    $pagination = ProcessAtrsData "alians-without-children" $pagination
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination
    $pagination = ProcessAtrsData "alians-with-parents" $pagination
    $pagination = ProcessAtrsData "alians-without-parents" $pagination
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination
    
    # Wait for 1 minute before processing the next set of data
    Start-Sleep -Seconds 60

    # Increment the pagination date by 7 days
    $pagination = $pagination.AddDays(7)
}


# Example usage: Process the ATRS data for a specific city
$city = "New York"
$pagination = $startDate
while ($pagination -le $endDate) {
    $pagination = ProcessAtrsData "alians" $pagination -City $city
    $pagination = ProcessAtrsData "alians-in-house" $pagination -City $city
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-family" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-family" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-children" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-children" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-parents" $pagination -City $city
    $pagination = ProcessAtrsData "alians-without-parents" $pagination -City $city
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination -City $city
    
    # Wait for 1 minute before processing the next set of data
    Start-Sleep -Seconds 60

    # Increment the pagination date by 7 days
    $pagination = $pagination.AddDays(7)
}


# Example usage: Process the ATRS data for a specific ethnicity
$ethnicity = "Asian"
$pagination = $startDate
while ($pagination -le $endDate) {
    $pagination = ProcessAtrsData "alians" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-in-house" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-family" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-family" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-children" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-children" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-parents" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-without-parents" $pagination -Ethnicity $ethnicity
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination -Ethnicity $ethnicity

    # Wait for 1 minute before processing the next set of data
    Start-Sleep -Seconds 60

    # Increment the pagination date by 7 days
    $pagination = $pagination.AddDays(7)
}


# Example usage: Process the ATRS data for a specific gender
$gender = "Male"
$pagination = $startDate
while ($pagination -le $endDate) {
    $pagination = ProcessAtrsData "alians" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-in-house" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-family" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-family" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-children" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-children" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-parents" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-without-parents" $pagination -Gender $gender
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination -Gender $gender

    # Wait for 1 minute before processing the next set of data
    Start-Sleep -Seconds 60

    # Increment the pagination date by 7 days
    $pagination = $pagination.AddDays(7)
}


# Example usage: Process the ATRS data for a specific age range
$minAge = 30
$maxAge = 40
$pagination = $startDate
while ($pagination -le $endDate) {
    $pagination = ProcessAtrsData "alians" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-in-house" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-out-of-house" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-family" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-family" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-spouse" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-spouse" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-children" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-children" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-grandchildren" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-grandchildren" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-siblings" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-siblings" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-brothers" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-brothers" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-sisters" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-sisters" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-parents" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-without-parents" $pagination -MinAge $minAge -MaxAge $maxAge
    $pagination = ProcessAtrsData "alians-with-grandparents" $pagination -MinAge $minAge -MaxAge $maxAge

    # Wait for 1 minute before processing the next set of data
    Start-Sleep -Seconds 60

    # Increment the pagination date by 7 days
    $pagination = $pagination.AddDays(7)
}


