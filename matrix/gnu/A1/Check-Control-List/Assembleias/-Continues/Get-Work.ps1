#!/home/admin/app/PowerShell/Members

# Get Works With (WW) contacts
$wwContacts = Get-ADUser -Filter {Enabled -eq $true -and (ADObjectClass -eq 'contact' -and (ADAttribute9 -like '%WW%' -or ADAttribute9 -like '%Work%'))} | Select-Object Name, SamAccountName,
        @{Name='Work Phone';Expression={$_.ADAttribute8}},
        @{Name='Mobile Phone';Expression={$_.ADAttribute10}},
        @{Name='Email';Expression={$_.EmailAddress}},
        @{Name='Department';Expression={$_.Department}},
        @{Name='Job Title';Expression={$_.JobTitle}}

# Get Colleagues (C) contacts
$cContacts = Get-ADUser -Filter {Enabled -eq $true -and (ADObjectClass -eq 'contact' -and ADAttribute9 -notlike '%WW%' -and ADAttribute9 -notlike '%Work%')} | Select-Object Name, SamAccountName,
        @{Name='Work Phone';Expression={$_.ADAttribute8}},
        @{Name='Mobile Phone';Expression={$_.ADAttribute10}},
        @{Name='Email';Expression={$_.EmailAddress}},
        @{Name='Department';Expression={$_.Department}},
        @{Name='Job Title';Expression={$_.JobTitle}}

# Merge WW and C contacts
$mergedContacts = $wwContacts + $cContacts

# Sort merged contacts by Department and Job Title
$sortedContacts = $mergedContacts | Sort-Object Department, JobTitle

# Export sorted contacts to CSV file
$sortedContacts | Export-Csv -Path 'C:\Users\admin\Documents\contacts.csv' -NoTypeInformation

$i =0
while ($i -lt 20) {
     $i++
if ($i -eq 7) { continue }
     Write-Host $I
}