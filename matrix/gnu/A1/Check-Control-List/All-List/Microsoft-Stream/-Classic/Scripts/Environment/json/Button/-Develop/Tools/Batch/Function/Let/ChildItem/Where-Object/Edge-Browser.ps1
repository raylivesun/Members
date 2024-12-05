#!/home/admin/app/PowerShell/Members

# edge browser version and minimum required edge version
$edgeVersion = '91.0.864.37'
$minEdgeVersion = '91.0.864.37'

# get the edge version from the user agent string
$edgeUserAgent = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe' -Name 'URL Protocol').URL
$edgeVersionMatch = $edgeUserAgent -match 'Edge\/(\d+\.\d+\.\d+)'
if ($edgeVersionMatch) {
    $edgeVersion = $Matches[1]
}

# check if edge is installed and version is greater than or equal to the minimum required version
if (Get-Command -Name msedge -ErrorAction SilentlyContinue) {
    if ($edgeVersion -ge $minEdgeVersion) {
        Write-Host "Edge is installed and version $edgeVersion is supported."
    } else {
        Write-Host "Edge is installed but version $edgeVersion is not supported. Minimum required version is $minEdgeVersion."
    }
    exit 0
}

# edge is not installed, prompt the user to install it
Write-Host "Edge is not installed. Please download and install Edge from https://www.microsoft.com/en-us/edge/download."
exit 1
