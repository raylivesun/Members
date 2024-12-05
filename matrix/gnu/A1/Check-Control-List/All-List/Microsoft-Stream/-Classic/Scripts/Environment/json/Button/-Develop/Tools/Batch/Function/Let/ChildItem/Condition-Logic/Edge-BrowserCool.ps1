#!/home/admin/app/PowerShell/Members

# Edge Browser Aliases typically exist in the C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Alias folder
# Replace "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Alias" with your actual Edge alias folder path
$alias_folder_path="C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Alias"

# Get the list of Edge browser aliases
$aliases = Get-ChildItem -Path $alias_folder_path -Filter "*.url" -Recurse | Select-Object -ExpandProperty Name | ForEach-Object { $_ -replace '\.url$' }

# Print the aliases
$aliases

# Example usage:

$test = "test"
if ($test -eq "test"){
Write-Host "if condition met"
}


