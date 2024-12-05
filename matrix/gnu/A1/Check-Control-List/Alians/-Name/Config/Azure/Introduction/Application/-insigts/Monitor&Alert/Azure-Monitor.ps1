#!/home/admin/PowerShell/Members

# Alians Aplication Name and Version
$appName = "Alians"
$appVersion = "1.0.0"

# Get the current date and time
$currentTime = Get-Date -Format yyyy-MM-dd_HH-mm-ss

# Log file path
$logFilePath = "C:\Alians\logs\Alians_{0}.log" -f $currentTime

# Log file header
$logFileHeader = "Alians {0} - Log File" -f $appVersion

# Get the names of the active members
$activeMembers = Get-ADUser -Filter "Enabled -eq $true" -Properties Name

# Loop through the active members
foreach ($member in $activeMembers) {
    try {
        # Get the last logon date and time
        $lastLogon = Get-ADUser $member.SamAccountName -Properties LastLogon | Select-Object -ExpandProperty LastLogon
        $lastLogonDate = [datetime]::FromFileTime($lastLogon)
        $lastLogonDateTime = $lastLogonDate.ToString("yyyy-MM-dd HH:mm:ss")

        # Check if the member's last logon was within the last 24 hours
        if ((Get-Date) -gt $lastLogonDate.AddHours(24)) {
            # Log the member's name and last logon date/time
            Add-Content -Path $logFilePath -Value ("{0} - Last Logon: {1}" -f $member.Name, $lastLogonDateTime)
        }
        else {
            Write-Host ("{0} - Last Logon: {1}" -f $member.Name, $lastLogonDateTime)
        }
    }
    catch {
        # Log any errors encountered while processing the member
        Add-Content -Path $logFilePath -Value ("Error processing member {0}: {1}" -f $member.Name, $_.Exception.Message)
    }
    finally {
        # Clear the screen after processing each member
        Clear-Host
    }
}

# Display a success message
Write-Host "Log file created at: $logFilePath"
Write-Host './-Authoring' ./Config ./packages.ps1 $appName
Write-Host './-Authoring' ./Config ./packages.ps1 $logFileHeader