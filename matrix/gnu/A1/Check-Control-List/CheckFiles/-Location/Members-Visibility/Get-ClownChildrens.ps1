#!/home/admin/app/PowerShell/Members

# Get Clown Children's names from ClownDB (replace with your own API endpoint)
$clownChildren = Invoke-RestMethod -Method Get -Uri 'https://api.example.com/clowns' | ConvertFrom-Json

# Create a new list to store the filtered names
$filteredNames = @()

# Loop through each Clown Child and check if their name starts with 'C'
foreach ($clownChild in $clownChildren) {
    if ($clownChild.name -like 'C*') {
        $filteredNames += $clownChild.name
    }
}

# Sort the filtered names in descending order
$sortedNames = $filteredNames | Sort-Object -Descending

# Print the sorted names
Write-Host "Clown Children whose names start with 'C':"
foreach ($name in $sortedNames) {
    Write-Host $name
}

# Get the total number of Clown Children whose names start with 'C'
$totalClowns = $filteredNames.Count
Write-Host "Total Clown Children whose names start with 'C': $totalClowns"


# Get the average age of Clown Children whose names start with 'C'
$averageAge = $filteredNames | ForEach-Object { (Get-Date -Format yyyy).Year - $_.Substring(1, 4) } | Measure-Object -Average
Write-Host "Average Age of Clown Children whose names start with 'C': {0:N2} years", $averageAge.Average


# Get the oldest Clown Child whose name starts with 'C'
$oldestClown = $filteredNames | Sort-Object -Property { (Get-Date -Format yyyy).Year - $_.Substring(1, 4) } -Descending | Select-Object -First 1
Write-Host "Oldest Clown Child whose names start with 'C': $oldestClown"


# Get the youngest Clown Child whose name starts with 'C'
$youngestClown = $filteredNames | Sort-Object -Property { (Get-Date -Format yyyy).Year - $_.Substring(1, 4) } | Select-Object -Last 1
Write-Host "Youngest Clown Child whose names start with 'C': $youngestClown"


# Get the total number of unique Clown Genders among Clown Children whose names start with 'C'
$uniqueGenders = $filteredNames | ForEach-Object { $_.gender } | Sort-Object -Unique
Write-Host "Unique Clown Genders among Clown Children whose names start with 'C':"
foreach ($gender in $uniqueGenders) {
    Write-Host $gender
}

# Get the percentage of Clown Children whose names start with 'C' that are Male
$malePercentage = ($filteredNames | Where-Object { $_.gender -eq 'Male' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Male: {0:N2}%", $malePercentage


# Get the percentage of Clown Children whose names start with 'C' that are Female
$femalePercentage = ($filteredNames | Where-Object { $_.gender -eq 'Female' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Female: {0:N2}%", $femalePercentage


# Get the percentage of Clown Children whose names start with 'C' that are Transgender
$transgenderPercentage = ($filteredNames | Where-Object { $_.gender -eq 'Transgender' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Transgender: {0:N2}%", $transgenderPercentage


# Get the percentage of Clown Children whose names start with 'C' that are Non-Binary
$nonBinaryPercentage = ($filteredNames | Where-Object { $_.gender -eq 'Non-Binary' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Non-Binary: {0:N2}%", $nonBinaryPercentage


# Get the percentage of Clown Children whose names start with 'C' that are Pregnant
$pregnantPercentage = ($filteredNames | Where-Object { $_.pregnancy -eq $true }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Pregnant: {0:N2}%", $pregnantPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Not Pregnant
$notPregnantPercentage = ($filteredNames | Where-Object { $_.pregnancy -eq $false }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Not Pregnant: {0:N2}%", $notPregnantPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Veteran
$veteranPercentage = ($filteredNames | Where-Object { $_.veteran -eq $true }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Veteran: {0:N2}%", $veteranPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Not Veteran
$notVeteranPercentage = ($filteredNames | Where-Object { $_.veteran -eq $false }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Not Veteran: {0:N2}%", $notVeteranPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Caucasian
$caucasianPercentage = ($filteredNames | Where-Object { $_.ethnicity -eq 'Caucasian' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Caucasian: {0:N2}%", $caucasianPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Asian
$asianPercentage = ($filteredNames | Where-Object { $_.ethnicity -eq 'Asian' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Asian: {0:N2}%", $asianPercentage

# Get the percentage of Clown Children whose names start with 'C' that are African American
$clownCoin = ($filteredNames | Where-Object { $_.ethnicity -eq 'African American' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are African American: {0:N2}%", $clownCoin

# Get the percentage of Clown Children whose names start with 'C' that are Native American
$nativeAmericanPercentage = ($filteredNames | Where-Object { $_.ethnicity -eq 'Native American' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Native American: {0:N2}%", $nativeAmericanPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Pacific Islander
$pacificIslanderPercentage = ($filteredNames | Where-Object { $_.ethnicity -eq 'Pacific Islander' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Pacific Islander: {0:N2}%", $pacificIslanderPercentage

# Get the percentage of Clown Children whose names start with 'C' that are Hispanic or Latino
$thisWayPercentage = ($filteredNames | Where-Object { $_.ethnicity -eq 'Hispanic or Latino' }).Count / $totalClowns * 100
Write-Host "Percentage of Clown Children whose names start with 'C' that are Hispanic or Latino: {0:N2}%", $thisWayPercentage

