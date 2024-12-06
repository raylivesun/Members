#!/home/admin/app/PowerShell/Members

# Get Avatar URLs from GitHub API for all members
$members = (Invoke-RestMethod -Uri "https://api.github.com/orgs/PowerShell/members" -Headers @{Accept = "application/vnd.github.v3+json"})
$avatarUrls = $members | ForEach-Object { $_.avatar_url }

# Create a directory for the avatars
New-Item -ItemType Directory -Path./avatars

# Download avatars to the directory
$avatarUrls | ForEach-Object {
    $avatarBytes = (Invoke-RestMethod -Uri $_ -Method Get -Headers @{Accept = "application/vnd.github.v3+json"}).content
    [System.IO.File]::WriteAllBytes("./avatars/$($_.Split('/')[-1])", $avatarBytes)
}


# Create a markdown table with member information
$table = @"
| Member Name | Avatar URL |
|------------|------------|
"@

$members | ForEach-Object {
    $table += "| $($_.login) | [![](avatars/$($_.login).png)]($_.html_url) |"
}

$table



# Create a text file with member information
$table | Out-File -FilePath members.txt -Encoding utf8


# Create a PDF report with member information
$table | Out-Pdf -FilePath members.pdf


# Send an email with the report
$emailParams = @{
    From        = "sender@example.com"
    To          = "recipient@example.com"
    Subject     = "PowerShell Members Report"
    Body        = "Please find the attached PDF report with PowerShell members information."
    Attachments = @{
        Path      = "members.pdf"
        ContentType = [System.Net.Mime.MediaTypeNames]::ApplicationPdf
    }
}

Send-MailMessage @emailParams
