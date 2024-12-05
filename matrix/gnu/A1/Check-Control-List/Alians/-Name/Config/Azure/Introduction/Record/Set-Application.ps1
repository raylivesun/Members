#!/home/admin/app/PowerShell/Members

# Alians Record (AR) File Path and Name (Replace with your AR file path)
$arFilePath = "/path/to/your/ar.txt"

# Read Alians Record File
$arFileContent = Get-Content $arFilePath

# Define Alians Record Fields
$arFields = @("Name", "Email", "Phone")

# Initialize an empty array to store Alians Record data
$aliansRecords = @()

# Loop through each line in the Alians Record file
foreach ($line in $arFileContent) {
    # Split the line into fields using the defined Alians Record fields
    $fieldsValues = $line -split "\t" | Select-Object -First $arFields.Count

    # Check if the line has the correct number of fields
    if ($fieldsValues.Count -eq $arFields.Count) {
        # Create a new hashtable for each Alians Record
        $aliansRecord = New-Object System.Collections.Hashtable

        # Loop through each Alians Record field and add the value to the hashtable
        foreach ($field in $arFields) {
            $aliansRecord[$field] = $fieldsValues[$arFields.IndexOf($field)]
        }

        # Add the Alians Record hashtable to the array
        $aliansRecords += $aliansRecord
    }
    else {
        Write-Host "Warning: Skipping line '$line' as it has an incorrect number of fields."
    }
}

# Define the output file path and name (Replace with your desired output file path and name)
$outputFile = "/path/to/your/output.csv"

# Create the output CSV file with the Alians Record data
$aliansRecords | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "Alians Record data exported to '$outputFile'"
