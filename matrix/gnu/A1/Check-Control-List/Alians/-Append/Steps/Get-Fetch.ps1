#!/home/admin/app/PowerShell/Members

# Alians Appends PowerShell 7.2 to the PATH Steps 1-3
export PATH="/home/admin/app/PowerShell/7.2:$PATH"

# Aliases Appends the aliases.ps1 file to the aliases Steps 4-6
source /home/admin/app/PowerShell/aliases.ps1

# Variables Appends the variables.ps1 file to the environment Variables Steps 7-9
source /home/admin/app/PowerShell/variables.ps1

# Execution Appends the execution.ps1 file to the execution Steps 10-12
source /home/admin/app/PowerShell/execution.ps1


# PowerShell commands to be executed
# Example:
# Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
# Get-Service | Where-Object Status -EQ 'Running' | Select-Object -Property Name, Status
# Get-EventLog -LogName Application | Where-Object { $_.TimeGenerated -gt (Get-Date).AddDays(-1) } | Format-Table TimeGenerated, Source, Message
