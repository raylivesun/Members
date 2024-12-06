#!/home/admin/app/PowerShell/Members

# Set exec packages from the provided file
$exec_packages = Get-Content -Path "/home/admin/app/PowerShell/exec_packages.txt" | ForEach-Object { $_.Trim() }
Write-Information "Found $($exec_packages.Count) executable packages"

# Get the list of PowerShell scripts from the provided directory
$scripts_dir = "/home/admin/app/PowerShell/scripts"
$scripts = Get-ChildItem -Path $scripts_dir -Filter "*.ps1" -Recurse | ForEach-Object { $_.FullName }
Write-Debug "Found $($scripts.Count) PowerShell scripts"

# Set the default package manager
$package_manager = "choco"

# Iterate over the PowerShell scripts
foreach ($script in $scripts) {
    # Get the script name without the extension
    $script_name = $script.BaseName -replace '\.ps1', ''

    # Check if the script is in the exec_packages list
    if ($exec_packages -contains $script_name) {
        # Execute the script using the package manager
        switch ($package_manager) {
            "choco" {
                & choco install $script_name --no-progress --no-auto-update --force
            }
            "winget" {
                & winget install $script_name --no-update --force
                # Add your winget install command here
            }
            default {
                Write-Error "Unsupported package manager: $package_manager"
                exit 1
            }
        }
        Write-Information "Successfully executed $script_name using $package_manager"
        # Add your logging or auditing here
        # Example: Write-EventLog -LogName "PowerShellScripts" -Source "PowerShellScripts" -EventID 100 -Message "Executed $script_name using $package_manager"
        # Add your custom logic here
    }
    else {
        Write-Warning "Script $script_name is not in the exec_packages list"
        # Add your logging or auditing here
        # Example: Write-EventLog -LogName "PowerShellScripts" -Source "PowerShellScripts" -EventID 200 -Message "Script $script_name is not in the exec_packages list"
        # Add your custom logic here
    }
}

