#!/home/admin/app/PowerShell/Members

# Get String of All Active Members in PowerShell
$members = Get-ADUser -Filter "Enabled -eq $true" -Properties MemberOf | Select-Object -ExpandProperty MemberOf

# Convert Array to a String with newline delimited values
$membersString = $members -join "`r`n"

# Write the String to a File
$membersString | Out-File -FilePath /path/to/members.txt -Force

$string1 = "Power"
$string2 = "Shell"
"Greetings from $string1$string2"
