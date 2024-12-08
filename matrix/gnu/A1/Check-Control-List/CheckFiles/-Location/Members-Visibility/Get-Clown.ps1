#!/home/admin/app/PowerShell/Members

# Get Clown Moon domain names from the CSV file
$domain_names=$(awk '{print $1}' clown_moon_domains.csv)


# Iterate through each domain name
for ($domain_name -ne $domain_names) {
  # Check if the domain name is a valid URL
  if ($domain_name = ^https?://) {
    domain_name="${domain_name##*/}"  # Remove the protocol (e.g., https://)
  }
}

# Print the domain names
foreach ($domain_name in $domain_names) {
  Write-Host $domain_name
}


# Send an email notification with the domain names
$subject = "Clown Moon Domain Names"
$body = Join-Object -Property @{ Name = "Domain Name"; Value = $domain_names } -Delimiter "\n"
$to = "admin@example.com"

Send-MailMessage -From "clownmoon@example.com" -To $to -Subject $subject -Body $body -SmtpServer smtp.example.com


# Update the Clown Moon domain names in the database
$connection_string = "Server=localhost;Database=clownmoon;Uid=admin;Pwd=password"

foreach ($domain_name in $domain_names) {
    $query = "UPDATE domains SET status = 'inactive' WHERE domain_name = '$domain_name'"
    $connection = New-Object System.Data.SqlClient.SqlConnection($connection_string)
    $command = New-Object System.Data.SqlClient.SqlCommand($query, $connection)

    $connection.Open()
    $command.ExecuteNonQuery()
    $connection.Close()
}


# Remove the temporary CSV file
Remove-Item clown_moon_domains.csv


# Generate a report with the updated domain names
$updated_domains = Get-Content updated_domains.txt

$report_subject = "Updated Clown Moon Domain Names"
$report_body = Join-Object -Property @{ Name = "Domain Name"; Value = $updated_domains } -Delimiter "\n"


# Send an email notification with the updated domain names report
Send-MailMessage -From "clownmoon@example.com" -To $to -Subject $report_subject -Body $report_body -SmtpServer smtp.example.com


# Clean up the temporary files
Remove-Item updated_domains.txt


# Log the execution details
Get-Date | Out-File -FilePath execution_details.txt -Append
Write-Host "Clown Moon domain names updated successfully"


