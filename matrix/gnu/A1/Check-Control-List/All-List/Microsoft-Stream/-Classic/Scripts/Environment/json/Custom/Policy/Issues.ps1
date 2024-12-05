#!/home/admin/app/Powershell/Members

# All List Members of the given List ID in Google Spreadsheet

# Import Google Sheets API
Import-Module Google.Apis.Sheets.v4

# Authenticate with Google Sheets API
$credentials = Get-Credential -Message "Enter your Google Sheets API credentials" -UserName "your-email@example.com"
$service = New-Object Google.Apis.Sheets.v4.SheetsService($credentials)

# Set the Google Sheets API URL
$spreadsheetId = "your-spreadsheet-id"
$range = "your-list-range"

# Get the data from the specified range
$request = New-Object Google.Apis.Sheets.v4.Data.BatchGetRequest
$request.Ranges = @($range)
$response = $service.Spreadsheets.Get($spreadsheetId, $request)
$values = $response.Sheets[0].Data[0].Values

# Print the list members
Write-Host "List Members:"
foreach ($row in $values) {
    Write-Host $row[0]
}

