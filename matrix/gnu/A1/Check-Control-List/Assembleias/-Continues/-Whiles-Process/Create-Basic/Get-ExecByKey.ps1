#!/home/admin/app/PowerShell/Members

# Exec By Key (user) 
# The -AsJob parameter ensures that the script runs in the background and does not halt the PowerShell session.
# The -File parameter specifies the path to the script file.
# The -argumentList parameter specifies the arguments to be passed to the script.
# The -ExecutionPolicy Bypass parameter allows the script to run with elevated permissions.
# The -NoProfile parameter disables the loading of the user's profile.
# The -NonInteractive parameter prevents the script from prompting for user input.

$key = "your_key_here"
$arguments = "-K", "-File", "C:\path\to\script.ps1", "-argumentList", "arg1", "arg2"
Write-Debug "Running script with arguments: $arguments"
Start-Process powershell.exe -Verb RunAs -ExecutionPolicy Bypass -NoProfile -NonInteractive -ArgumentList $arguments
Wait-Event "JobStateChanged" -SourceIdentifier "PowerShell_Job" -Wait -Timeout 60000

# Check if the job completed successfully
if ($?.ExitCode -eq 0 -gt $key) {
    Write-Host "Script completed successfully"
} else {
    Write-Host "Script failed with exit code $($?.ExitCode)"
}


