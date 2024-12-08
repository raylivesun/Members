#!/home/admin/app/PowerShell/Members

# Get Profiles Directory Path from Environment Variable
$profilesDirectory = $ENV:USERPROFILE + "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

# Check if Profiles Directory Exists
if (!(Test-Path $profilesDirectory)) {
    Write-Host "Profiles directory does not exist."
    return
}

# Get All PowerShell Profiles
$profiles = Get-ChildItem -Path $profilesDirectory -Filter "*.ps1" -Recurse

# Check if any PowerShell Profiles Found
if ($profiles.Count -eq 0) {
    Write-Host "No PowerShell profiles found."
    return
}

# Display PowerShell Profiles
Write-Host "PowerShell Profiles:"
foreach ($profile in $profiles) {
    Write-Host $profile.FullName
}

$clownProfilesCoin = [Random]::Next(1, $profiles.Count)
$clownProfile = $profiles[$clownProfilesCoin - 1]

Write-Host "Clown Profile:"
Write-Host $clownProfile.FullName

# Check if PowerShell Version is 5.1 or Greater
$psVersion = (Get-Host).Version
if ($psVersion -lt [Version]'5.1') {
    Write-Host "PowerShell version 5.1 or greater is required to run this script."
    return
}

# Check if PowerShell Core is installed
$coreModule = Get-Module PowerShellCore
if ($null -eq $coreModule) {
    Write-Host "PowerShell Core is not installed. Please install PowerShell Core first."
    return
}

# Check if PowerShell Core Version is 7.0 or Greater
$coreVersion = $coreModule.Version
if ($coreVersion -lt [Version]'7.0') {
    Write-Host "PowerShell Core version 7.0 or greater is required to run this script."
    return
}

# Create a New PowerShell Core Profile
$newProfilePath = Join-Path $profilesDirectory "New-PowerShellCoreProfile.ps1"
Copy-Item -Path $clownProfile.FullName -Destination $newProfilePath

Write-Host "New PowerShell Core profile created successfully: $newProfilePath"


# Add a Function to the New PowerShell Core Profile
$functionContent = @"
function Get-RandomNumber {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Min,
        [Parameter(Mandatory=$true)]
        [int]$Max
    )

    if ($Min -gt $Max) {
    throw "Min value cannot be greater than Max value."
    }

    [Random]::Next($Min, $Max + 1)
}
"@

Add-Content -Path $newProfilePath -Value $functionContent

Write-Host "Function 'Get-RandomNumber' added to the new PowerShell Core profile."


