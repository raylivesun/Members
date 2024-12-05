#!/home/admin/app/PowerShell/Members

# Alians Customization (start)

# Alians Customization (end)

# Read Alians from Alians.txt
$alians = Get-Content Alians.txt | Select-Object -First 1000

# Initialize variables
$totalAlians = $alians.Count
$totalProcessedAlians = 0
$failedAlians = @()

# Loop through Alians
foreach ($alien in $alians) {
    try {
        # Extract Alian data
        $alienId = $alien.Split(',')[0]
        $alienName = $alien.Split(',')[1]
        $alienEmail = $alien.Split(',')[2]

  
        # Check if Alian already exists in the database
        $alienExists = Test-Path "C:\alians\alians.csv" | Select-Object -ExpandProperty Content | Where-Object { $_ -like "*$alienId*" }
        if ($alienExists) {
            Write-Host "Alian '$alienName' ($alienId) already exists in the database."
            continue
        }

        # Send email to Alian
        $subject = "Welcome to Alians!"
        $body = "Dear $alienName,
        Thank you for joining Alians. We are excited to have you on board!
        Please find your login credentials below:
        Alian ID: $alienId
        Password: [Secure Password]
        Please visit our website at https://alians.com for more information.
        Regards,
        Alians Team"
        Send-MailMessage -SmtpServer "smtp.example.com" -From "Alians Support <noreply@example.com>" -To $alienEmail -Subject $subject
        -Body $body

        # Update Alians.csv
        Add-Content Alians.csv -Value "$alienId,$alienName,$alienEmail"
        Write-Host "Alian '$alienName' ($alienId) sent welcome email and added to Alians.csv."

        # Increment processed Alians counter
        $totalProcessedAlians++

    } catch {
        # Log failed Alian
        Write-Host "Failed to process Alian '$alienName' ($alienId): $_"
        $failedAlians += $alien
    }
    finally {
        # Wait for 5 seconds before processing the next Alian
        Start-Sleep -Seconds 5
    }
}

# Print summary
Write-Host "Total Alians: $totalAlians"
Write-Host "Processed Alians: $totalProcessedAlians"
Write-Host "Failed Alians: $($failedAlians.Count)"

if ($failedAlians.Count -gt 0) {
    Write-Host "Failed Alians:"
    foreach ($alien in $failedAlians) {
        Write-Host "- $alien"
    }
    Write-Host "Please check Alians.csv for more information."
}
