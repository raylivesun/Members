#!/home/admin/app/PowerShell/Members

# Get Literal Path to PowerShell Script Directory
$scriptDir = (Get-Item -Path $PSScriptRoot).Parent.FullName

# Get the list of all PowerShell files in the script directory
$psFiles = Get-ChildItem -Path $scriptDir -Filter *.ps1

# Initialize an empty array to store the script names
$scriptNames = @()

# Loop through each PowerShell file
foreach ($file in $psFiles) {
    # Extract the script name from the file path
    $scriptName = $file.BaseName

    # Add the script name to the array
    $scriptNames += $scriptName
}

# Sort the array in ascending order
$sortedScriptNames = $scriptNames | Sort-Object

# Print the sorted script names
Write-Host "Sorted PowerShell Script Names:"
Write-Host $sortedScriptNames

@'
The following line won't be expanded
$(Get-Date)
because this is a literal here-string
'@