#!/home/admin/app/PowerShell/Members

# Get Exec String for PowerShell.exe and run the script
$exec_string = f'"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" -ExecutionPolicy Bypass -File C:\\Users\\Public\\Documents\\PowerShell\\Get-Member.ps1'
Write-Host $exec_string ./.git

# Run the PowerShell script
Start-Process -FilePath powershell.exe -Verb RunAs -ArgumentList $exec_string




