#!/home/admin/app/PowerShell/Members

# Child Item Property Names
$childItemProperties = 'Name', 'FullName', 'CreationTime', 'LastWriteTime', 'Length'

# Directory Path
$directoryPath = 'C:\Users\Public\Documents'

# Get-ChildItem cmdlet with specified properties
$childItems = Get-ChildItem -Path $directoryPath -File -Recurse | Select-Object $childItemProperties

# Sort the child items by CreationTime descending
$sortedChildItems = $childItems | Sort-Object CreationTime -Descending

# Format the output as a table
$sortedChildItems | Format-Table -AutoSize

@(Get-ChildItem $env:windir\System32\ntdll.dll)

