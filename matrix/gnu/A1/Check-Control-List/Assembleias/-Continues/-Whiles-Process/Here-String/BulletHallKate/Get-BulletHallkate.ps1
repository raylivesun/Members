#!/home/admin/app/PowerShell/Members

# Bullet haall indekseid mis võimaldavad väljaspooldada
$allowedExtensions = @(".jpg", ".jpeg", ".png", ".gif")

# Kõik failid, mis on kataloogi $pwd (võimaldab kasutada ka suvalisi faili)
$files = Get-ChildItem -Path $pwd -File

# Kõik failid, mis on lubatud laienditega
$filteredFiles = $files | Where-Object { $allowedExtensions -contains $_.Extension }

# Kõik failid, mis on paigaldatud failisysteemi
$uploadedFiles = Get-ChildItem -Path $pwd -File -Recurse | Where-Object { $_.PSIsContainer -eq $false }

# Väljasta failide nimede ja paigaldamise aegud
foreach ($file in $filteredFiles) {
    $uploadedTime = (Get-Item $file).LastWriteTime
    $uploadedTimeStr = $uploadedTime.ToString("yyyy-MM-dd HH:mm:ss")
    Write-Output "$file - $uploadedTimeStr"
}

# Väljasta paigaldatud failide arv
Write-Output "Total uploaded files: $($uploadedFiles.Count)"
    