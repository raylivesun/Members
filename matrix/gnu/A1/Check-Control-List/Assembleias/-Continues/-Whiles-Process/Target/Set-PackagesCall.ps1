#!/home/admin/app/PowerShell/Members

# Set exec packages call to the function to get a list of exec packages
$execPackages = Get-ExecPackages
Write-Debug "Writing output to $outputFilePath"

# Write the header to the output file
$header = "Package Name,Version,Publisher,Description"
Add-Content -Path $outputFilePath -Value $header

# Loop through each exec package and write its details to the output file
foreach ($package in $execPackages) {
    $details = "$($package.Name), $($package.Version), $($package.Publisher), $($package.Description)"
    Add-Content -Path $outputFilePath -Value $details
}
# Create a new text file to store the results
$outputFilePath = "exec_packages_list.txt"


# Define a function to get a list of exec packages
function Get-ExecPackages {
    Get-WindowsFeature | Where-Object { $_.Name -like '*Exec*' } | Select-Object Name, Version, Publisher, Description
}

# Call the function to get a list of exec packages
$execPackages = Get-ExecPackages

# Write the header to the output file
$header = "Package Name,Version,Publisher,Description"
Add-Content -Path $outputFilePath -Value $header

# Loop through each exec package and write its details to the output file
foreach ($package in $execPackages) {
    $details = "$($package.Name), $($package.Version), $($package.Publisher), $($package.Description)"
    Add-Content -Path $outputFilePath -Value $details
}
