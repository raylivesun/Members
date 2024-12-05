#!/home/admin/app/PowerShell/Members

# Alians Troubleshooting Script - version 1.0 

# Define the aliases and functions 

# Function to get the aliases 
function Get-Aliases {
    Get-Alias | Format-Table Name, Value
}

# Function to get the functions 
function Get-Functions {
    Get-Command | Where-Object {$_.CommandType -eq "Function"} | Format-Table Name, Definition
}

# Function to get the aliases and functions 
function Get-AliasesAndFunctions {
    Get-Aliases | Join-Object -InputObject (Get-Functions) -JoinType Inner -Property Name, Value, Definition
}

# Function to check if a command exists 
function CheckCommand {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Command
    )

    if (Get-Command -Name $Command) {
        return $true
    } else {
        return $false
    }
}

# Function to get the command history 
function Get-CommandHistory {
    Get-History
}

# Function to clear the command history 
function Clear-CommandHistory {
    Clear-History
}

# Function to search for a command in the history 
function Search-CommandHistory {
    param (
        [Parameter(Mandatory=$true)]
        [string]$SearchTerm
    )

    Get-History | Where-Object {$_.CommandLine -like "*$SearchTerm*"} | Format-Table TimeStamp, CommandLine
}

# Function to get the current working directory 
function Get-CurrentWorkingDirectory {
    Get-Location
}

# Function to change the current working directory 
function ChangeCurrentWorkingDirectory {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    Set-Location -Path $Path
}

# Function to list all files and directories in the current working directory 
function ListFilesAndDirectories {
    Get-ChildItem
}

# Function to create a new directory 
function New-Directory {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    New-Item -ItemType Directory -Path $Path
}

# Function to delete a directory 
function Remove-Directory {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    Remove-Item -ItemType Directory -Path $Path -Force -Confirm:$false
}

# Function to move a file or directory 
function Move-Item {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        [Parameter(Mandatory=$true)]
        [string]$Destination
    )

    Move-Item -Path $Source -Destination $Destination
}

# Function to copy a file or directory 
function Copy-Item {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        [Parameter(Mandatory=$true)]
        [string]$Destination
    )

    Copy-Item -Path $Source -Destination $Destination -Force
}

# Function to delete a file 
function Remove-File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    Remove-Item -Path $Path -Force -Confirm:$false
}

# Function to compress a file or directory 
function Compress-Archive {
    
    Compress-Archive -Path $Path -DestinationPath $Destination -Force -CompressionLevel Optimal -Format $Format
}

# Function to decompress a file 
function Expand-Archive {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        [Parameter(Mandatory=$true)]
        [string]$Destination
    )

    Expand-Archive -Path $Path -DestinationPath $Destination -Force
}

# Function to list all installed applications 
function Get-InstalledApplications {
    Get-WmiObject -Class Win32_Product | Format-Table Name, Version, InstallLocation
}

# Function to check if an application is installed 
function CheckApplication {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ApplicationName
    )

    if (Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $ApplicationName}) {
        return $true
    } else {
        return $false
    }

    # Function to install an application 
    function Install-Application {
        param (
            [Parameter(Mandatory=$true)]
            [string]
            [Parameter(Mandatory=$true)]
            [string]
            [Parameter(Mandatory=$true)]
            [string]$InstallLocation
        )

        # Download the application
        (New-Object System.Net.WebClient).DownloadFile($DownloadUrl, "$InstallLocation\$ApplicationName.msi")

        # Install the application
        Start-Process msiexec.exe /i "$InstallLocation\$ApplicationName.msi" /quiet /norestart
    }

    # Function to uninstall an application 
    function Uninstall-Application {
        param (
            [Parameter(Mandatory=$true)]
            [string]$ApplicationName
        )

        Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $ApplicationName} | Remove-Item
    }

    # Function to start an application 
    function Start-Application {
        param (
            [Parameter(Mandatory=$true)]
            [string]$ApplicationName
        )

        Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $ApplicationName} | ForEach-Object { Start-Process -FilePath $_.Install
            Get-Location -Verb Run }
    }

    # Function to stop an application 
    function Stop-Application {
        param (
            [Parameter(Mandatory=$true)]
            [string]$ApplicationName
        )

        Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $ApplicationName} | ForEach-Object { Stop-Process -Id $_.Process
            ID -Force }
    }
    # ...
}


# Example usage

# Get aliases and functions
Get-AliasesAndFunctions | Format-Table Name, @{Name="Value (alias)";Expression={$_.Value}}, @{Name="Definition (function)";Expression={$_.Definition}}

# Check if a command exists
Check-Command Get-Aliases

# Get the command history
Get-CommandHistory | Format-Table TimeStamp, CommandLine

# Search for a command in the history
Search-CommandHistory "Get-Alias" | Format-Table TimeStamp, CommandLine

# Get the current working directory
Get-CurrentWorkingDirectory

# Change the current working directory
Change-CurrentWorkingDirectory "/home/admin/documents"

# List all files and directories in the current working directory
List-FilesAndDirectories

# Create a new directory
New-Directory "/home/admin/documents/new_directory"

# Delete a directory
Remove-Directory "/home/admin/documents/new_directory"

# Move a file or directory
Move-Item "/home/admin/documents/old_file.txt" "/home/admin/documents/new_file.txt"

# Copy a file or directory
Copy-Item "/home/admin/documents/old_file.txt" "/home/admin/documents/new_file_copy.txt"

# Delete a file
Remove-File "/home/admin/documents/new_file_copy.txt"

# Compress a file or directory
Compress-Archive "/home/admin/documents/compressed_directory" "/home/admin/documents/compressed_directory.zip"

# Decompress a file
Expand-Archive "/home/admin/documents/compressed_directory.zip" "/home/admin/documents/decompressed_directory"

# List all installed applications
Get-InstalledApplications | Format-Table Name, Version, InstallLocation

# Check if an application is installed
Check-Application "Notepad++"

# Install an application
Install-Application "Notepad++" "https://notepad-plus-plus.org/download/v8.4.2/notepadpp_8.4.2_Installer.exe" "/home/admin/apps"

# Uninstall an application
Uninstall-Application "Notepad++"

# Start an application
Start-Application "Notepad++"

# Stop an application
Stop-Application "Notepad++"


