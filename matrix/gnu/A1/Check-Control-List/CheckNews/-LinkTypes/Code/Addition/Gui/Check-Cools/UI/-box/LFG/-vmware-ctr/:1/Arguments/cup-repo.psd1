#!/home/admin/app/PowerShell/Members

# Cup Repo the URL of the cup repo Next instance
$CupRepo = "https://example.com/next/apps/com.github.nextcloud.cup/"

# Get the latest cup version
$CupVersion = (Invoke-RestMethod -Uri $CupRepo).releases[0].tag_name

# Create a directory for the cup version
$CupDir = Join-Path -Path (Get-Location) -ChildPath "cup-$CupVersion"

# Download the cup installer
$CupInstaller = Join-Path -Path $CupDir -ChildPath "nextcloud-cup-$CupVersion.exe"
Invoke-WebRequest -Uri "$CupRepo/releases/download/$CupVersion/nextcloud-cup-$CupVersion.exe" -OutFile $CupInstaller

# Install cup
Start-Process -FilePath $CupInstaller -Wait -NoNewWindow


