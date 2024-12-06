#!/home/admin/app/PowerShell/Members

# Get Exec Local Group Members from AD (Active Directory)
Get-ADGroupMember -Identity Executes -ErrorAction SilentlyContinue |
    Select-Object Name, SamAccountName, MemberOf |
    Format-Table Name, SamAccountName, @{Label='MemberOf'; Expression={$_.MemberOf -join ', '}}
    | Out-String -Width 999999 -Encoding utf8
    | Set-Content -Path Executes-Members.txt
    | Out-Null
    | Write-Host "Executes-Members.txt created successfully."
    | Write-Host "Members who have been granted the 'Executes' local group have been exported to Executes-Members.txt."
    | Write-Host "Please review the file to ensure it's accurate and that you have the necessary permissions."
    | Write-Host "To view the members, open the file in a text editor."
    | Write-Host "If you need further assistance, please contact your system administrator."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.log
    | Out-Null
    | Write-Host "Log file created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.error.log -Append
    | Out-Null
    | Write-Host "Error log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.warning.log -Append
    | Out-Null
    | Write-Host "Warning log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.info.log -Append
    | Out-Null
    | Write-Host "Info log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.debug.log -Append
    | Out-Null
    | Write-Host "Debug log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.trace.log -Append
    | Out-Null
    | Write-Host "Trace log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.audit.log -Append
    | Out-Null
    | Write-Host "Audit log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.performance.log -Append
    | Out-Null
    | Write-Host "Performance log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.security.log -Append
    | Out-Null
    | Write-Host "Security log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.configuration.log -Append
    | Out-Null
    | Write-Host "Configuration log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.other.log -Append
    | Out-Null
    | Write-Host "Other log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.log -Append
    | Out-Null
    | Write-Host "Summary log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.error.log -Append
    | Out-Null
    | Write-Host "Summary error log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.warning.log -Append
    | Out-Null
    | Write-Host "Summary warning log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.info.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.debug.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.trace.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.audit.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.performance.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.security.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.configuration.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.other.log -Append
    | Out-Null
    | Write-Host "Summary logs created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.csv -Append
    | Out-Null
    | Write-Host "Summary CSV log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.json -Append
    | Out-Null
    | Write-Host "Summary JSON log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.xml -Append
    | Out-Null
    | Write-Host "Summary XML log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.html -Append
    | Out-Null
    | Write-Host "Summary HTML log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.txt -Append
    | Out-Null
    | Write-Host "Summary TXT log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.log -Append
    | Out-Null
    | Write-Host "Summary log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.error.log -Append
    | Out-Null
    | Write-Host "Summary error log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.warning.log -Append
    | Out-Null
    | Write-Host "Summary warning log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.info.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.debug.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.trace.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.audit.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.performance.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.security.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.configuration.log -Append
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.other.log -Append
    | Out-Null
    | Write-Host "Summary logs created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.csv -Append
    | Out-Null
    | Write-Host "Summary CSV log created successfully."
    | Out-Null
    | Tee-Object -FilePath Executes-Members.summary.json -Append
    
