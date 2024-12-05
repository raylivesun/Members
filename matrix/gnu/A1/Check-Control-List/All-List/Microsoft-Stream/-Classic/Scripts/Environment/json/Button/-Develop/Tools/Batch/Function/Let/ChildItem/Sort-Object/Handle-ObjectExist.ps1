#!/home/admin/app/PowerShell/Members

# Sort object properties by name in ascending order
$sortedProperties = $_.PSObject.Properties | Sort-Object Name

# Initialize an empty string to hold the formatted JSON
$json = @{}

# Iterate through the sorted properties
foreach ($property in $sortedProperties) {
    # Exclude the "Type" property, as it contains the type of the object
    if ($property.Name -ne "Type") {
        # If the property value is a collection, convert it to a string
        if ($property.Value -is [System.Collections.ICollection]) {
            $property.Value = ($property.Value | ForEach-Object { $_ }) -join ', '
        }
        # Add the property to the JSON object
        $json[$property.Name] = $property.Value
    }
    # Add the object properties to the JSON array
    $json | Add-Member -Type NoteProperty -Name "Properties" -Value $json.Properties -PassThru
}

# Convert the JSON object to a JSON string
$jsonString = $json | ConvertTo-Json -Depth 10

# Print the JSON string
$jsonString
