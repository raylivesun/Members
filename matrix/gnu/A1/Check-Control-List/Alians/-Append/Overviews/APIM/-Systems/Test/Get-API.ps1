#!/home/admin/app/PowerShell/Members

# Alians Test Environment Membership List Generator Script
# Author: 
# Date: 
# Description: This script generates a list of members for Alians Test Environment.

# Define the required variables
$domain = 'alians.com'
$adminUsername = 'admin'
$adminPassword = 'YourAdminPasswordHere'
$groupName = 'AliansTestEnvironment'
$csvFilePath = 'members.csv'

# Connect to the Active Directory server
$ad = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext("AD", $domain)

# Get all members of the specified group
$group = Get-ADGroup -Identity $groupName -Context $ad
$members = Get-ADGroupMember -Identity $group -Recursive | Where-Object {$_.objectClass -eq 'user'}

# Export the members to a CSV file
$members | Select-Object Name, SamAccountName, EmailAddress | Export-Csv -Path $csvFilePath -NoTypeInformation

Write-Host "Members exported to '$csvFilePath'"
Write-Host ./Web-Report.ps1 $adminUsername $adminPassword $csvFilePath
