#!/home/admin/app/PowerShell/Members

# Alians Softworks PowerShell Core Version 1.0.0
# Author: Alians Softworks
# GitHub: https://github.com/alians-softworks/alians-powershell-core

# Import the Alians.PowerShell.Core module
Import-Module Alians.PowerShell.Core

# Get the current date and time
$dateTime = Get-Date

# Create a log file path
$logFilePath = Join-Path $PSScriptRoot "logs"
if (-not (Test-Path $logFilePath)) {
    New-Item -ItemType Directory -Path $logFilePath | Out-Null
}
$logFilePath = Join-Path $logFilePath "$(Get-Date -Format yyyy-MM-dd).log"

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "PowerShell Core Members script started"

# Get the list of members
$members = Get-ADUser -Filter "Enabled -eq $true" -Properties MemberOf

# Count the number of members
$memberCount = $members.Count

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "Found $memberCount active members"

# Get the list of administrators
$administrators = $members | Where-Object { $_.MemberOf -like "*Admin*" }

# Count the number of administrators
$administratorCount = $administrators.Count

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "Found $administratorCount administrators"

# Get the list of users with a specific group membership
$groupMembership = "CN=Users,DC=example,DC=com"
$specificGroupMembers = $members | Where-Object { $_.MemberOf -contains $groupMembership }

# Count the number of specific group members
$specificGroupMemberCount = $specificGroupMembers.Count

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "Found $specificGroupMemberCount users in the '$groupMembership' group"

# Get the list of users with a specific attribute value
$attributeName = "department"
$attributeValue = "Sales"
$specificAttributeMembers = $members | Where-Object { $_.$attributeName -eq $attributeValue }

# Count the number of specific attribute members
$specificAttributeMemberCount = $specificAttributeMembers.Count

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "Found $specificAttributeMemberCount users with the '$attributeName' attribute set to '$attributeValue'"

# Get the list of users with a specific last name
$lastName = "Smith"
$specificLastNameMembers = $members | Where-Object { $_.Surname -eq $lastName }

# Count the number of specific last name members
$specificLastNameMemberCount = $specificLastNameMembers.Count

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "Found $specificLastNameMemberCount users with the last name '$lastName'"

# Get the list of users with a specific email domain
$emailDomain = "@example.com"
$specificEmailDomainMembers = $members | Where-Object { $_.Email -like "*$emailDomain" }

# Count the number of specific email domain members
$specificEmailDomainMemberCount = $specificEmailDomainMembers.Count

# Write the log entry
Write-Log -FilePath $logFilePath -DateTime $dateTime -Message "Found $specificEmailDomainMemberCount users with the email domain '$emailDomain'"

# Get the list of users with a specific title
$title = "Senior Software Engineer"
Write-Host ./members.csv $title
