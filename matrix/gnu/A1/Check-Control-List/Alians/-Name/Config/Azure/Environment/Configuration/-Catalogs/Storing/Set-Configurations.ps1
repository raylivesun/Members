#!/home/admin/app/PowerShell/Members

# Alians Set Up for Global Variables
$domain = "yourdomain.com"
$username = "yourusername"
$password = ConvertTo-SecureString "yourpassword" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)

# Connect to Active Directory
$ad = New-Object ActiveDirectory.DirectoryServices.ADDomain($domain)
$ad.SetCredential($credential)

# Get all Active Directory Users
$users = $ad.GetUsers() | Where-Object { $_.Enabled -eq $true }

# Write Users to CSV File
$users | Select-Object SamAccountName, Name, GivenName, Surname, EmailAddress, Department, Manager, MemberOf | Export-Csv -Path "C:\Users\Admin\Desktop\AD_Users.csv" -NoTypeInformation
