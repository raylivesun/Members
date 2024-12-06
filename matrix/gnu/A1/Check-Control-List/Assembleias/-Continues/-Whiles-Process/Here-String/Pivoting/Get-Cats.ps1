#!/home/admin/app/PowerShell/Members

# Get Cats links from the provided CSV file
$csvFile = "cats.csv"
$catsLinks = Import-Csv $csvFile | Select-Object -ExpandProperty Link

# Function to download images from a given URL
function DownloadImage($url, $outputPath) {
    try {
        $response = Invoke-WebRequest -Uri $url
        $response.Content | Out-File -FilePath $outputPath
    }
    catch {
        Write-Host "Failed to download image from URL: $url"
    }
}

# Download images from the cats links
$downloadPath = "images"
if (!(Test-Path $downloadPath)) {
    New-Item -ItemType Directory $downloadPath
    Write-Host "Created directory: $downloadPath"
}

$imageCount = 0
foreach ($link in $catsLinks) {
    $imageName = [System.IO.Path]::GetFileName($link)
    $outputPath = Join-Path $downloadPath $imageName

    Download-Image -Url $link -OutputPath $outputPath

    if ($?) {
        $imageCount++
    }
    else {
        Write-Host "Skipped downloading image: $imageName"
    }
}

Write-Host "Downloaded $imageCount images"
Write-Host "Images saved to: $downloadPath"
Write-Host "Finished script execution at $(Get-Date)"
Write-Host "Press any key to exit..."
Write-Host "Download completed $Download"