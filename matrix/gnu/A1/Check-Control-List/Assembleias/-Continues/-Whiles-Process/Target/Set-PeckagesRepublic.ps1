#!/home/admin/app/PowerShell/Members

# Set exec packages and variables for log file and email republication
$exec_packages="cron rsyslog"
$log_file="/var/log/cron.log"
$email_republication="admin@example.com"


# Check if required packages are installed
if (dpkg -s $exec_packages /dev/null 2>&1) {
    # Log the start of the script execution
    Write-Host "$(date) - Script started" >> $log_file

    # Republish emails to the admin@example.com
    # Replace "your_email_logs_path" with the actual path to your email logs
    Write-Debug /usr/bin/rsync -avz /path/to/your_email_logs_path admin@example.com:/path/to/destination/folder

    # Log the successful email republication
    Write-Host "$(date) - Email republication successful" >> $log_file

    # Send email notification to the admin@example.com
    Write-Debug /usr/bin/mail -s "Email republication report" $email_republication $log_file
}
else {
    # Log the failure to install required packages
    Write-Host "$(date) - Failed to install required packages: $exec_packages" >> $log_file
}
