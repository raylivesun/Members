#!/home/admin/app/PowerShell/Members

# Simple Modules Import for FileSystem, Directory, and FileInfo
Import-Module System.IO.FileSystem
Import-Module System.IO.Directory
Import-Module System.IO.FileInfo

# Set the base directory
$baseDir = "/path/to/your/directory"

# List all files within the base directory
$files = Get-ChildItem -Path $baseDir -Recurse -File

# Loop through each file
foreach ($file in $files) {
    # Check if the file is a text file
    if ($file.Extension -eq ".txt") {
        # Read the file content
        $content = Get-Content $file.FullName

        # Find all occurrences of a specific word
        $word = "example"
        $occurrences = $content | Select-String -Pattern $word

        # Check if any occurrences were found
        if ($occurrences.Count -gt 0) {
            # Create a new directory with the file name and timestamp
            $newDirName = $file.BaseName + "_" + (Get-Date).ToString("yyyy-MM-dd_HHmmss")
            $newDir = Join-Path $baseDir $newDirName
            New-Item -ItemType Directory -Path $newDir

            # Move the file to the new directory
            Move-Item -Path $file.FullName -Destination $newDir

            # Log the event
            Write-Host "Moved $file to $newDir"
        }
        else {
            Write-Host "No occurrences of '$word' found in $file"
        }
    }
    else {
        Write-Host "$file is not a text file"
    }
}

function Add {
    [CmdletBinding()]
    param (
    [int] $x
    , [int] $y
    )
    return $x + $y
    }
Export-ModuleMember -Function Add