#!/home/admin/app/PowerShell/Members

# Get Exec String for PowerShell on Debian 10
$exec_string="/usr/bin/pwsh -File"
Write-Output $exec_string 

# Get the current directory
$current_dir = Get-Location
Write-Debug "Current Directory: $current_dir"

# Define the PowerShell script to be executed
$script_path = "$current_dir/Get-Users.ps1"
Write-Debug "Script Path: $script_path"

# Execute the PowerShell script
& $exec_string $script_path

