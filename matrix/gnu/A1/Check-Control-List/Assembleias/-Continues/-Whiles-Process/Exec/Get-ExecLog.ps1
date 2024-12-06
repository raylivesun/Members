#!/home/admin/app/PowerShell/Members

# Get Exec Log Path from environment variable
$exec_log_path="/var/log/exec.log"

# Get current date and time
$current_date_time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Get the number of arguments passed to the script
$argument_count = $args.Count

# Get the script name
$script_name = $MyInvocation.MyCommand.Name

# Get the script full path
$script_full_path = $MyInvocation.MyCommand.Path

# Get the script arguments
$script_arguments = $args

# Log the script execution details to the exec log file
Add-Content -Path $exec_log_path -Value "$(Write-Output "$current_date_time - Script Name: $script_name - Script Path: $script_full_path - Argument Count: $argument_count - Arguments: $($script_arguments -join ', ')")"

# Exit the script with a success status code
exit 0
