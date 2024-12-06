#!/home/admin/app/PowerShell/Members

# File Parameters (adjust as needed)
$log_file = "/var/log/apache2/error.log"
$error_threshold = 1000


# Read the log file and count occurrences of error messages
$error_count = Get-Content $log_file | Where-Object { $_ -like "*error*" } | Measure-Object | Select-Object Count

# Check if the error count exceeds the threshold
if ($error_count.Count -gt $error_threshold) {
    # Send an email alert
    $subject = "Error Alert: Apache Error Log Exceeds Threshold"
    $body = "The error count in the Apache error log has exceeded the threshold of $error_threshold."
    $recipient = "admin@example.com"
    Send-MailMessage -From "error@example.com" -To $recipient -Subject $subject -Body $body
}


# Optionally, save the error count to a file for future reference
$error_count | Out-File -FilePath "/var/log/apache2/error_count.txt" -Append


# Optionally, monitor the error count in real-time using a monitoring tool like Prometheus or Grafana
# Example: Using Prometheus
# Create a new metric called "apache_error_count"
#   TYPE gauge
#   HELP The number of error messages in the Apache error log
#   LABELS {
#       instance="example.com",
#       severity="error"
#   }
#
#   gauge apache_error_count{instance="example.com", severity="error"} $error_count.Count


