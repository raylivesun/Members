#!/home/admin/app/PowerShell/Members

# Get Exec script path and directory name for log file
$script_path = (Get-Item -Path $MyInvocation.MyCommand.Definition).FullName
$script_dir = Split-Path -Parent $script_path

# Set log file path and name
$log_file = Join-Path -Path $script_dir "PowerShell_Members.log"

# Get current date and time
$current_time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Log start of the script
Write-Host "$current_time PowerShell Members script started" -BackgroundColor Green -ForegroundColor White
Write-Host "Log file: $log_file" -BackgroundColor Green -ForegroundColor White

# Get list of all PowerShell Member accounts
$members = Get-ADUser -Filter {Enabled -eq $true -and AccountNotMatchPattern "NT\system" -and AccountNotMatchPattern "NT\domain admins"} -Properties Name, Description, MemberOf

# Check if there are any members
if ($members) {
    # Log the number of members
    Write-Host "Number of PowerShell Member accounts: $($members.Count)" -BackgroundColor Green -ForegroundColor White

    # Loop through each member and log their details
    foreach ($member in $members) {
        $member_description = $member.Description
        $member_memberof = $member.MemberOf.Count

        # Log the member's details
        Write-Host "Name: $($member.Name)" -BackgroundColor Green -ForegroundColor White
        Write-Host "Description: $member_description" -BackgroundColor Green -ForegroundColor White
        Write-Host "Number of groups: $member_memberof" -BackgroundColor Green -ForegroundColor White
        Write-Host "" -BackgroundColor Green -ForegroundColor White
    }
    # Log the end of the script
    Write-Host "$current_time PowerShell Members script finished" -BackgroundColor Green -ForegroundColor White
    Write-Host "Log saved to $log_file" -BackgroundColor Green -ForegroundColor White
    Write-Host "" -BackgroundColor Green -ForegroundColor White
    Write-Host "Press any key to continue..." -BackgroundColor Green -ForegroundColor White
    Read-Key
    Write-Host "" -BackgroundColor Green -ForegroundColor White
    Write-Host "Exiting PowerShell Members script..." -BackgroundColor Green -ForegroundColor White
    exit 0
    } else {
    # Log that there are no members
    Write-Host "No PowerShell Member accounts found" -BackgroundColor Green -ForegroundColor White
}


