#!/home/admin/app/PowerShell/Members

# Sonic series release date and title information films.csv
$seriesInfo = Import-Csv films.csv -Header 'Title', 'Release Date'

# Get the current date
$currentDate = Get-Date -Format yyyy-MM-dd

# Loop through each film release date
foreach ($film in $seriesInfo) {
    $releaseDate = $film.ReleaseDate
    $title = $film.Title

    # Check if the film's release date is in the future
    if ($releaseDate -gt $currentDate) {
        # Calculate the number of days until the film's release
        $daysUntilRelease = (New-TimeSpan -Start $currentDate -End $releaseDate).Days

        # Format the release date and days until release
        $formattedReleaseDate = $releaseDate.ToString('yyyy-MM-dd')
        $formattedDaysUntilRelease = "{0:N0} days" -f $daysUntilRelease

        # Print the film title and days until release
        Write-Host "Title: $title"
        Write-Host "Release Date: $formattedReleaseDate"
        Write-Host "Days Until Release: $formattedDaysUntilRelease"
        Write-Host ""
    }
    else {
        # Print the film title and release date if it has already been released
        Write-Host "Title: $title"
        Write-Host "Release Date: $releaseDate"
        Write-Host ""
    }
    # Add a line break after each film
    Write-Host "----------------------------------------"
}
