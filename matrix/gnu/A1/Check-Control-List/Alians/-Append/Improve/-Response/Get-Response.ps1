#!/home/admin/app/PowerShell/Members

# Alians Improve the command-line experience
Set-Alias ls 'Get-ChildItem'
Set-Alias ll 'Get-ChildItem -File -Force | Format-Table -AutoSize'
Set-Alias la 'Get-ChildItem -File -Force | Where-Object { !$_.PSIsContainer } | Format-Table -AutoSize'
Set-Alias lsd 'Get-ChildItem -Directory -Force | Format-Table -AutoSize'
Set-Alias lsg 'Get-ChildItem -File -Force | Where-Object { $_.PSIsContainer } | Format-Table -AutoSize'
Set-Alias lsl 'Get-ChildItem -File -Force | Sort-Object LastWriteTime -Descending | Format-Table -AutoSize'
Set-Alias lsa 'Get-ChildItem -File -Force | Where-Object { !$_.PSIsContainer } | Sort-Object LastWriteTime -Descending | Format-Table'

# Custom functions for listing files and directories
function ListFiles {
    param (
        [Parameter(Mandatory=$true)]
        [string]$path,
        [Parameter(Mandatory=$false)]
        [string]$filter = '*',
        [Parameter(Mandatory=$false)]
        [string]$sort = 'LastWriteTime'
    )
    Get-ChildItem -Path $path -Filter $filter -File | Sort-Object $sort -Descending | Format-Table -AutoSize
}

function ListDirectories {
    param (
        [Parameter(Mandatory=$true)]
        [string]$path,
        [Parameter(Mandatory=$false)]
        [string]$filter = '*',
        [Parameter(Mandatory=$false)]
        [string]$sort = 'LastWriteTime'
    )
    Get-ChildItem -Path $path -Filter $filter -Directory | Sort-Object $sort -Descending | Format-Table -AutoSize
}

# List files and directories in the current directory
ListFiles
ListDirectories


# Get information about a specific person from the Star Wars API
# Replace the URL with the desired person's ID
# Save the output to a report.htm file
# You can customize the properties shown in the report by modifying the ConvertTo-Html cmdlet
# For example, to include the person's birth year, add "-Property birth_year" to the command
Invoke-RestMethod -URI $URL |
  ConvertTo-Html -Property name, height, homeworld |
    Out-File $Report
    Start-Process $Report
    # Open the report in a web browser
    Start-Process -FilePath $Report
    # Uncomment the following line to open the report in Notepad
    # Start-Process notepad $Report
    # Close the PowerShell session
    exit
    # Uncomment the following line to keep the PowerShell session open
    # Read-Host -Prompt "Press any key to close the PowerShell session..."
    # Exit
    # Keep the PowerShell session open
    # Read-Host -Prompt "Press any key to close the PowerShell session..."
    # Exit


