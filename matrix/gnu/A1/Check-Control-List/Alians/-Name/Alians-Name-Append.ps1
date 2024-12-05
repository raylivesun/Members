#!/home/admin/app/PowerShell/Members

# Alians Name to be used in the command
$aliansName = "Alians"

# Path to Alians Directory
$aliansDirectory = "/home/admin/app/PowerShell/Members"

# Get all Alians from the directory
$alians = Get-ChildItem $aliansDirectory -Filter "*.txt" -Recurse

# Check if Alians Directory exists
if (!(Test-Path $aliansDirectory)) {
    Write-Host "The Alians directory does not exist."
    exit 1

    # Create Alians Directory if it doesn't exist
    New-Item -ItemType Directory -Path $aliansDirectory -Force | Out-Null
}

# Process each Alian
foreach ($alian in $alians) {
    # Read Alian Name from the file
    $name = Get-Content $alian.FullName | Select-Object -First 1

    # Check if Alian Name is empty
    if ($name.Trim() -eq "") {
        Write-Host "The Alian '$alian.Name' is missing a name."
        continue
        # Remove Alian file if Alian Name is empty
        Remove-Item $alian.FullName -Force | Out-Null
    }

    # Check if Alian Name contains the Alians Name
    if ($name.Contains($aliansName)) {
        Write-Host "The Alian '$alian.Name' contains the Alians Name."
        continue
        # Rename Alian file if Alian Name contains the Alians Name
        $newName = $name.Replace($aliansName, "Alien")
        Rename-Item $alian.FullName -NewName $newName
    }
    # Move Alian file to a separate directory
    Move-Item $alian.FullName -Destination "/home/admin/app/PowerShell/Moved" -Force | Out-Null
}

