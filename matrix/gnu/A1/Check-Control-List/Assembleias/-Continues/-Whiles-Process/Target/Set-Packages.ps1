#!/home/admin/app/PowerShell/Members

# Set packages to be installed and their versions
$packages = @{
    'Microsoft.PowerShell.7.0-rc' = '7.0.0-rc.1'
    'Microsoft.PowerShell.7.0' = '7.0.0'
}

# Get the current version of PowerShell
$currentVersion = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PowerShell\7.0' -Name 'Version').Version

# Iterate through the packages and check if they are installed
foreach ($package in $packages.Keys) {
    $installedVersion = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PowerShell\7.0' -Name "$package").Version
    if ($installedVersion -ne $packages[$package]) {
        Write-Host "Installing $package version $packages[$package]..."
        $null = Install-Module -Name $package -RequiredVersion $packages[$package] -Force
        if ($?) {
            Write-Host "Installation of $package version $packages[$package] completed successfully."
        } else {
            Write-Host "Failed to install $package version $packages[$package]."
        }
        Write-Host ""
        Write-Host "Current version of PowerShell: $currentVersion"
        Write-Host ""
        Write-Host "Installed versions of PowerShell modules:"
        Get-Module -ListAvailable | Format-Table Name, Version
    }
    else {
        Write-Host "$package version $packages[$package] is already installed."
    }
}

# Set PowerShell as the default shell for non-administrative users
$defaultShell = Get-ItemProperty -Path 'HKCU:\Environment' -Name 'SHELL'
if ($defaultShell.Value -ne 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe') {
    Write-Host "Setting PowerShell as the default shell for non-administrative users..."
} else {
    Write-Host "PowerShell is already set as the default shell for non-administrative users."
}


# Set PowerShell as the default shell for administrative users
$adminShell = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shells\Admin'
if ($adminShell.Value -ne 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe') {
    Write-Host "Setting PowerShell as the default shell for administrative users..."
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shells\Admin' -Name 'Shell' -Value 'C:\WINDOWS\System3'
} else {
    Write-Host "PowerShell is already set as the default shell for administrative users."
}


# Set PowerShell as the default shell for all users
$allUsersShell = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell'
if ($allUsersShell.Value -ne 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe') {
    Write-Host "Setting PowerShell as the default shell for all users..."
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell' -Name 'Shell' -Value 'C:\WINDOWS\System32'
} else {
    Write-Host "PowerShell is already set as the default shell for all users."
}


# Set PowerShell as the default shell for local users
$localUsersShell = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\S-1-5-18\DefaultUserProfile\Environment' -Name 'SHELL'
if ($localUsersShell.Value -ne 'C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe') {
    Write-Host "Setting PowerShell as the default shell for local users..."
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\S-1-5-18\DefaultUserProfile\Environment'
} else {
    Write-Host "PowerShell is already set as the default shell for local users."
}
