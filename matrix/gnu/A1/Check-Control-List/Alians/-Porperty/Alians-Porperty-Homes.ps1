#!/home/admin/app/PowerShell/Members

# Alians Porperty Group Name (APG) and APG Member Name (AM)
$apgName = "MyAPG"
$amName = "MyAM"

# Get the ID of the Alians Porperty Group
$apgId = Get-ADGroup -Filter "Name -eq '$apgName'" -Properties Id | Select-Object Id

# Check if the APG exists
if ($null -eq $apgId) {
    Write-Host "Alians Porperty Group '$apgName' not found."
    exit 1
}

# Get the ID of the Alians Porperty Group Member
$amId = Get-ADUser -Filter "Name -eq '$amName'" -Properties Id | Select-Object Id

# Check if the Alians Porperty Group Member exists
if ($null -eq $amId) {
    Write-Host "Alians Porperty Group Member '$amName' not found."
    exit 1
}

# Add the Alians Porperty Group Member to the Alians Porperty Group
try {
    Add-ADGroupMember -Identity $apgId -Members $amId
    Write-Host "Alians Porperty Group Member '$amName' added to '$apgName'."
    exit 0
}
catch {
    Write-Host "Error adding Alians Porperty Group Member '$amName' to '$apgName': $_"
    exit 1
}

