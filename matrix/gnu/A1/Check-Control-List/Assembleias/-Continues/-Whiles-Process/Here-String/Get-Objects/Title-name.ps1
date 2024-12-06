#!/home/admin/app/PowerShell/Members

# Title name for the script output file (without extension)
$title_name="PowerShell_Members"

# Get the current date and time
$current_datetime=$(Get-Date -Format "yyyy-MM-dd_HH-mm-ss")

# Create a new text file with the current date and time as the filename
New-Item -ItemType File -Path "$title_name_$current_datetime.txt" -Force

# Get the current user's name
$current_user=$(whoami)

# Write the current user's name to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "Current user: $current_user"

# Get the current directory path
$current_directory=$(Get-Location)

# Write the current directory path to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "Current directory: $current_directory"

# Get the list of all users on the system
$all_users = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount='True'" | Select-Object Name

# Write the list of all users to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "All users on the system:"
foreach ($user in $all_users) {
    Add-Content -Path "$title_name_$current_datetime.txt" -Value $user.Name
}


# Get the list of all running processes
$all_processes = Get-Process

# Write the list of all running processes to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "All running processes:"
foreach ($process in $all_processes) {
    Add-Content -Path "$title_name_$current_datetime.txt" -Value "$($process.Id): $($process.ProcessName) - $($process.Path)"
}

# Get the list of all network connections
$all_connections = Get-NetConnection

# Write the list of all network connections to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "All network connections:"
foreach ($connection in $all_connections) {
    Add-Content -Path "$title_name_$current_datetime.txt" -Value "$($connection.RemoteAddress): $($connection.RemotePort) - $($connection.LocalAddress): $($connection.LocalPort) - $($connection.State)"
}

# Get the list of all installed applications
$all_applications = Get-WmiObject -Class Win32_Product

# Write the list of all installed applications to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "All installed applications:"
foreach ($application in $all_applications) {
    Add-Content -Path "$title_name_$current_datetime.txt" -Value "$($application.Name): $($application.InstallLocation)"
}

# Get the list of all scheduled tasks
$all_scheduled_tasks = Get-ScheduledTask

# Write the list of all scheduled tasks to the output file
Add-Content -Path "$title_name_$current_datetime.txt" -Value "All scheduled tasks:"
foreach ($task in $all_scheduled_tasks) {
    Add-Content -Path "$title_name_$current_datetime.txt" -Value "$($task.TaskName): $($task.NextRunTime)"
}

# Print success message
Write-Host "Script completed successfully. Output file saved as '$title_name_$current_datetime.txt'"
Write-Output $title_name
