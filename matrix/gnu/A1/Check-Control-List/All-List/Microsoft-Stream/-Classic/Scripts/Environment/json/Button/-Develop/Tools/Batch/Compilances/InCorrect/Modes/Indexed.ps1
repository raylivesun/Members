#/home/admin/app/PowerShell/Members

# Modes Indexed by File Extension
$modeMap = @{
    ".ps1" = "PowerShell Script";
    ".psm1" = "PowerShell Module";
    ".psd1" = "PowerShell DSC Resource";
    ".ps1xml" = "PowerShell XML";
    ".ps1m1" = "PowerShell Manifest";
    ".psrc" = "PowerShell Source Control";
    ".pssc" = "PowerShell Script Checker";
    ".pscd" = "PowerShell Script Development Kit";
    ".psm1xml" = "PowerShell Module XML";
    ".psd1xml" = "PowerShell DSC Resource XML";
    ".psscxml" = "PowerShell Script Checker XML";
    ".pscdxml" = "PowerShell Script Development Kit XML";
    ".pssclog" = "PowerShell Script Checker Log";
    ".pscdlog" = "PowerShell Script Development Kit Log";
    ".psscprofile" = "PowerShell Script Checker Profile";
    ".pscdprofile" = "PowerShell Script Development Kit Profile";
    ".psscpreview" = "PowerShell Script Checker Preview";
    ".pscdpreview" = "PowerShell Script Development Kit Preview";
    ".psscpreviewlog" = "PowerShell Script Checker Preview Log";
    ".pscdpreviewlog" = "PowerShell Script Development Kit Preview Log";
    ".psscpreviewprofile" = "PowerShell Script Checker Preview Profile";
    ".pscdpreviewprofile" = "PowerShell Script Development Kit Preview Profile";
}

# Function to Get File Mode
function Get-FileMode {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $extension = [System.IO.Path]::GetExtension($FilePath)
    if ($modeMap.ContainsKey($extension)) {
        return $modeMap[$extension]
    } else {
        return "Unknown"
    }

    # Example usage
    # Get-FileMode "/home/admin/app/PowerShell/Members/Get-Member.ps1"
}

# Function to List Members
function ListMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    Get-ChildItem -Path $Path -Recurse -File | ForEach-Object {
        $mode = Get-FileMode $_.FullName
        Write-Output "$($_.FullName) - Mode: $mode"
    }
    # Example usage
    # List-Members "/home/admin/app/PowerShell/Members"
}

# Example usage
List-Members "/home/admin/app/PowerShell/Members"
