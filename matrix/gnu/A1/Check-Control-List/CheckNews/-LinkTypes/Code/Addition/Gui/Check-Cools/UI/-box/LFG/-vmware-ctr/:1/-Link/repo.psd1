#!/home/admin/app/PowerShell/Members

# Get Link the URL of the user's profile page from the command line argument
userProfileUrl=$args[0]

# Use Invoke-RestMethod to make an HTTP GET request to the profile page URL
$profileHtml = Invoke-RestMethod -Uri $userProfileUrl -Method Get

# Use regex to extract the user's name from the HTML content
$userName = $profileHtml -match '<span class="username">([^<]+)</span>' -replace '<[^<]+>', ''

# Output the extracted user's name
Write-Host "User Name: $userName"
