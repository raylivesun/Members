#!/home/admin/app/PowerShell/Members

# Get Shark Info from Shark Intelligence
$sharkInfo = Invoke-RestMethod -Uri "https://sharkintelligence.com/api/v1/sharks"

# Check if Shark Intelligence API request was successful
if ($sharkInfo.StatusCode -eq 200) {
    # Parse Shark Intelligence data into a table format
    $sharkTable = $sharkInfo.Content | ConvertFrom-Json | Select-Object -Property Name, Location, Species, Size, Status, LastUpdated, -ExpandProperty ContactInfo

    # Create a new Excel file
    $excelFile = New-Object -TypeName Excel.Workbook
    $workSheet = $excelFile.Worksheets.Add("Shark Intelligence")

    # Add column headers to the Excel sheet
    $headers = $sharkTable.PSObject.Properties.Name
    $workSheet.Cells[1, 1] = $headers[0].Name
    $workSheet.Cells[1, 2] = $headers[1].Name
    $workSheet.Cells[1, 3] = $headers[2].Name
    $workSheet.Cells[1, 4] = $headers[3].Name
    $workSheet.Cells[1, 5] = $headers[4].Name
    $workSheet.Cells[1, 6] = $headers[5].Name
    $workSheet.Cells[1, 7] = $headers[6].Name

    # Add Shark Intelligence data to the Excel sheet
    $row = 2
    foreach ($shark in $sharkTable) {
        $workSheet.Cells[$row, 1] = $shark.Name
        $workSheet.Cells[$row, 2] = $shark.Location
        $workSheet.Cells[$row, 3] = $shark.Species
        $workSheet.Cells[$row, 4] = $shark.Size
        $workSheet.Cells[$row, 5] = $shark.Status
        $workSheet.Cells[$row, 6] = $shark.LastUpdated
        $workSheet.Cells[$row, 7] = $shark.ContactInfo.Email
        $row++
    }

    # Save the Excel file to a specified location
    $excelFile.SaveAs("C:\path\to\your\output\file.xlsx")

    # Display a success message
    Write-Host "Shark Intelligence data exported to Excel file successfully."
    Write-Host "File saved as: C:\path\to\your\output\file.xlsx"
    Write-Host "Please check the file for the updated information."
}
else {
    # Display an error message if the Shark Intelligence API request failed
    Write-Host "Error: Failed to retrieve Shark Intelligence data."
    Write-Host "Status Code: $($sharkInfo.StatusCode)"
}


# Get Marine Protected Areas (MPAs) from the Governments of Canada and Ontario
$mpaInfo = Invoke-RestMethod -Uri "https://www.canada.ca/en/environment-engagement/marine-protected-areas/map/mpa-list.json"

# Check if the Governments of Canada and Ontario API request was successful
if ($mpaInfo.StatusCode -eq 200) {
    # Parse the Governments of Canada and Ontario data into a table format
    $mpaTable = $mpaInfo.Content | ConvertFrom-Json | Select-Object -Property Name, Area, Status, Description, Contact, -ExpandProperty Address
    $mpaTable = $mpaTable | Where-Object { $_.Status -eq "Current" }

    # Create a new Excel file
    $excelFile = New-Object -TypeName Excel.Workbook
    $workSheet = $excelFile.Worksheets.Add("MPAs")

    # Add column headers to the Excel sheet
    $headers = $mpaTable.PSObject.Properties.Name
    $workSheet.Cells[1, 1] = $headers[0].Name
    $workSheet.Cells[1, 2] = $headers[1].Name
    $workSheet.Cells[1, 3] = $headers[2].Name
    $workSheet.Cells[1, 4] = $headers[3].Name
    $workSheet.Cells[1, 5] = $headers[4].Name
    $workSheet.Cells[1, 6] = $headers[5].Name
    $workSheet.Cells[1, 7] = $headers[6].Name

    # Add Governments of Canada and Ontario data to the Excel sheet
    $row = 2
    foreach ($mpa in $mpaTable) {
        $workSheet.Cells[$row, 1] = $mpa.Name
        $workSheet.Cells[$row, 2] = $mpa.Area
        $workSheet.Cells[$row, 3] = $mpa.Status
        $workSheet.Cells[$row, 4] = $mpa.Description
        $workSheet.Cells[$row, 5] = $mpa.Contact
        $workSheet.Cells[$row, 6] = $mpa.Address.Street
        $workSheet.Cells[$row, 7] = $mpa.Address.City
        $row++
    }

    # Save the Excel file to a specified location
    $excelFile.SaveAs("C:\path\to\your\output\file.xlsx")

    # Display a success message
    Write-Host "Governments of Canada and Ontario MPAs data exported to Excel file successfully."
    Write-Host "File saved as: C:\path\to\your\output\file.xlsx"
    Write-Host "Please check the file for the updated information."
}
else {
    # Display an error message if the Governments of Canada and Ontario API request failed
    Write-Host "Error: Failed to retrieve Governments of Canada and Ontario MPAs data."
    Write-Host "Status Code: $($mpaInfo.StatusCode)"
}
