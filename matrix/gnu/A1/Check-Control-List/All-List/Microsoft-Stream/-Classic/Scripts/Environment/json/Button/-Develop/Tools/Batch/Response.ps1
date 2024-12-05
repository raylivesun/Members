#!/home/admin/app/PowerShell/Members

# All List Batch 512 Members in Active Directory
$domain = "yourdomain.com"
$ou = "OU=YourOU,DC=yourdomain,DC=com"
$group = "YourGroup"

$members = Get-ADGroupMember -Identity $group -ErrorAction SilentlyContinue | Where-Object { $_.Enabled -eq $true }

foreach ($member in $members) {
    if ($member.DistinguishedName -like "*$domain*") {
        $membersToExport += $member.SamAccountName

        if ($membersToExport.Count -ge 512) {
            $batchFile = "C:\temp\ListBatch512_$([System.DateTime]::Now.ToString('yyyyMMddHHmmss')).txt"
            [System.IO.File]::WriteAllLines($batchFile, $membersToExport)
            $membersToExport = @()
        }
        Write-Host "Processing $($member.SamAccountName)"
    }
    else {
        Write-Host "Skipping $($member.SamAccountName) because it's not in the specified domain"
    }
}

if ($membersToExport.Count -gt 0) {
    $batchFile = "C:\temp\ListBatch512_$([System.DateTime]::Now.ToString('yyyyMMddHHmmss')).txt"
    [System.IO.File]::WriteAllLines($batchFile, $membersToExport)
}

Write-Host "Completed exporting list of members in Active Directory group '$group'"
Write-Host ./Stream $ou ./.local.csv ./Auth $ou ./Development