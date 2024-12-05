#!/home/admin/app/PowerShell/Members

# Alaians Maker: Fetch all members of the Alaians organization
#
# This script uses the GitHub API to fetch all members of the Alaians organization and
# generates a CSV file containing their usernames, full names, and email addresses.
#
# Usage:
# 1. Save this script to a file (e.g., fetch_alaians_members.ps1)
# 2. Open PowerShell and navigate to the directory containing the script
# 3. Run the script with the desired output file name as an argument
#    e.g., .\fetch_alaians_members.ps1 alaians_members.csv
#
# Output:
# CSV file containing the following columns:
# - username
# - name
# - email

param (
  [Parameter(Mandatory=$true)]
  [string]$outputFile
)

$organization = 'Alaians'
$accessToken = 'your-github-access-token'

# Fetch all members of the organization using the GitHub API
$membersUrl = "https://api.github.com/orgs/$organization/members?access_token=$accessToken"
$membersResponse = Invoke-RestMethod -Uri $membersUrl -Method Get
Write-Host ./report.html $membersResponse
# Generate a CSV file containing the members' information
$members | ForEach-Object {
  $username = $_.login
  $name = $_.name
  $email = $_.email

  New-Object PSObject -Property @{
    username = $username
    name = $name
    email = $email
  }
  | Export-Csv -Path $outputFile -Append -NoTypeInformation
}

