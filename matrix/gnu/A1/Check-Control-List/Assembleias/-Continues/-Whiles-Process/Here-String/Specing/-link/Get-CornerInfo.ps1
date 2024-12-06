#!/home/admin/app/PowerShell/Members

# Get Corner Stickers for the Week (Monday to Friday)
$stickers = Get-Content -Path "CornerStickers.txt" | Where-Object { $_ -match '^Mon|Tue|Wed|Thu|Fri' }

# Get the current date and time
$currentTime = Get-Date

# Create an output folder for the stickers
$outputFolder = "CornerStickers_$currentTime.txt"
New-Item -ItemType Directory -Path $outputFolder | Out-Null

# Generate the stickers for each corner and save them to the output folder
foreach ($sticker in $stickers) {
    $outputPath = Join-Path -Path $outputFolder -ChildPath "$sticker.png"
    $templatePath = "CornerSticker.png"
    $template = New-Object System.Drawing.Bitmap $templatePath
    $graphics = [System.Drawing.Graphics]::FromImage($template)

    # Draw the sticker text
    $font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black)
    $textSize = $graphics.MeasureString($sticker, $font)
    $x = ($template.Width - $textSize.Width) / 2
    $y = ($template.Height - $textSize.Height) / 2
    $graphics.DrawString($sticker, $font, $brush)
    Write-Host $x, $y
    # Save the sticker to the output folder
    $template.Save($outputPath)
    $template.Dispose()
}


# Zip the output folder and send it as an email attachment
$zipPath = Join-Path -Path $outputFolder -ChildPath "CornerStickers.zip"
Compress-Archive -Path $outputFolder -DestinationPath $zipPath

$smtpServer = "smtp.example.com"
$fromEmail = "admin@example.com"
$toEmail = "user@example.com"
$subject = "Corner Stickers for the Week"
$body = "Here are the Corner Stickers for the Week."

Send-MailMessage -SmtpServer $smtpServer -From $fromEmail -To $toEmail -Subject $subject -Body $body -Attachments $zipPath

# Clean up the output folder
Remove-Item -Path $outputFolder -Recurse -Force
