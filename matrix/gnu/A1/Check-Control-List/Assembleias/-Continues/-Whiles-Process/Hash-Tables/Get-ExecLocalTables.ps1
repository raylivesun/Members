#!/home/admin/app/PowerShell/Members

# Get Exec Local Groups (ELGs)
$execElgs = Get-ADGroup -Filter 'GroupType -eq "Security"' -Properties Member
Write-Debug "Found $execElgs.Count Executable Local Groups"

# Get Non-Exec Local Groups (NELGs)
$nelgFilter = 'GroupType -eq "Security" -and (Member -notlike "*\*$")'
$nelgs = Get-ADGroup -Filter $nelgFilter -Properties Member
Write-Debug "Found $nelgs.Count Non-Executable Local Groups"

# Get Executable Local Group Members
$execMembers = @()
foreach ($elg in $execElgs) {
    $members = $elg.Members | Select-Object -First 1000
    $execMembers += $members
}
$execMembers = $execMembers | Sort-Object -Property Name
Write-Debug "Found $execMembers.Count Executable Local Group Members"

# Get Non-Executable Local Group Members
$nelgMembers = @()
foreach ($nelg in $nelgs) {
    $members = $nelg.Members | Select-Object -First 1000
    $nelgMembers += $members
}
$nelgMembers = $nelgMembers | Sort-Object -Property Name
Write-Debug "Found $nelgMembers.Count Non-Executable Local Group Members"

# Get Common Executable Local Group Members
$commonMembers = $execMembers | Where-Object { $nelgMembers -contains $_.Name }
Write-Debug "Found $commonMembers.Count Common Executable Local Group Members"

# Get Unique Executable Local Group Members
$uniqueExecMembers = $execMembers | Where-Object { -not ($commonMembers -contains $_.Name) }
Write-Debug "Found $uniqueExecMembers.Count Unique Executable Local Group Members"

