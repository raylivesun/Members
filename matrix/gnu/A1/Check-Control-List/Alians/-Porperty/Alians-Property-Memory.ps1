#!/home/admin/app/PowerShell/Members

# Alians Porperty Name and Value pairs for aliases to be created
$aliases = @{
    'g' = 'Get-ADUser'
    'gr' = 'Get-ADGroup'
    'grl' = 'Get-ADGroupMember'
    'gl' = 'Get-ADUser -Filter "Enabled -eq $true"'
    'gll' = 'Get-ADUser -Filter "Enabled -eq $true -MemberOf '
    's' = 'Set-ADUser -Identity'
    'sr' = 'Set-ADGroup -Identity'
    'sla' = 'Set-ADGroupMember -Identity'
}

# Loop through the aliases and create them
foreach ($alias in $aliases.Keys) {
    Set-Alias -Name $alias -Value $aliases[$alias]
}

# Print a success message
Write-Host "Aliases created successfully!"
