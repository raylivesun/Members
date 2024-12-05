#!/home/admin/app/PowerShell/Members

# Alians Property Name Portion of Aliases List (AEPN) to be replaced with 'New Property Name' (NPN) in Aliases 
$AEPN = 'old-alias'
$NPN = 'new-alias'

# The PowerShell script reads the aliases file and replaces the specified AEPN with NPN
Get-Content -Path 'C:\path\to\aliases.ps1' | ForEach-Object {
    $_ -replace $AEPN, $NPN
} | Set-Content -Path 'C:\path\to\aliases.ps1'

# If you want to check if the replacement was successful, you can uncomment the following lines
# Get-Content -Path 'C:\path\to\aliases.ps1' | Where-Object { $_ -like "*$NPN*" }

# You can also use the following command to execute the PowerShell script
# powershell -ExecutionPolicy Unrestricted -File 'C:\path\to\script.ps1'
