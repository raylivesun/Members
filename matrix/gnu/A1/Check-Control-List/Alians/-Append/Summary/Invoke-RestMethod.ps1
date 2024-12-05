#!/home/admmin/app/PowerShell/Members

# Alians Summary Report for PowerShell Core Team Members

# Get the current date and time
$currentDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Set the output file path and name
$outputFilePath = "alians_summary_$currentDate.csv"

# Create a new CSV file with the specified header
New-Item -ItemType File -Path $outputFilePath -Value (Get-Alias).Name,Member,GitHub,Slack,Email,Status

# Get the PowerShell Core team members from the GitHub repository
$members = (
    git log --pretty=format:"%an,%ae,%s" --no-merges |
    Where-Object { $_ -match '^PowerShell Core Team Membership,' } |
    ForEach-Object {
        $parts = $_ -split ','
        $name = $parts[0].Trim()
        $email = $parts[1].Trim()
        $status = $parts[2].Trim()
        $github = "https://github.com/$name"
        $slack = "https://slack.com/app_redirect?channel=PowerShell-Core-Team&path=%2Fmessages%2Fpowershell-core-team%2F"
        $alias = (Get-Alias -Name $name).Name

        # Write the member information to the CSV file
        Add-Content -Path $outputFilePath -Value "$alias,$name,$github,$slack,$email,$status"
    }
    | Sort-Object Name
)

# Print the number of PowerShell Core team members
Write-Host "Number of PowerShell Core team members: $members.Count"

# Send an email notification with the summary report attachment
$smtpServer = "smtp.example.com"
$fromAddress = "report@example.com"
$toAddresses = "report@example.com"
$subject = "PowerShell Core Team Membership Summary Report - $currentDate"
$body = "Please find the attached summary report of PowerShell Core Team members."

Send-MailMessage -SmtpServer $smtpServer -From $fromAddress -To $toAddresses -Subject $subject -Body $body -Attachments $outputFilePath

Param(
  [String] $URL,
  [String] $Report = "report.htm"
)
Invoke-RestMethod -URI $URL |
  ConvertTo-Html -CssUri report.css -Title "Web report" -Property name, height, homeworld |
    Out-File $Report

    # Send an email notification with the web report attachment
    $smtpServer = "smtp.example.com"
    $fromAddress = "report@example.com"
    $toAddresses = "report@example.com"
    $subject = "PowerShell Core Team Membership Web Report - $currentDate"
    $body = "Please find the attached web report of PowerShell Core Team members."
    Send-MailMessage -SmtpServer $smtpServer -From $fromAddress -To $toAddresses -Subject $subject -Body $body -Attachments $Report
    Remove-Item $Report

    Write-Host "Web report has been sent to the specified recipients."
    Write-Host "Summary report has been saved as $outputFilePath."
    Write-Host "Web report has been saved as $Report."
    Write-Host "Email notifications have been sent to the specified recipients."
    Write-Host "The PowerShell Core team members have been processed and the necessary files have been created."
    Write-Host "Please review the reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    Write-Host "Please review the attached reports and take any necessary action as needed."
    Write-Host "Thank you for using the PowerShell Core Team Membership tool."
    Write-Host "For any questions or concerns, please contact the administrators."
    Write-Host ""
    Write-Host "Admins: [Admin1, Admin2, Admin3]"
    Write-Host "Report: $currentDate"
    Write-Host ""
    Write-Host "Note: This report and any attachments are provided for informational purposes only and do not constitute official company policies or membership documents."
    Write-Host ""
    