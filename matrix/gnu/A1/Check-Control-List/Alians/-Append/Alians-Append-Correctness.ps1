#!/home/admin/app/PowerShell/Members

# Alians Appendices (1) - Aliases
$aliases = @{
    'g' = 'Get-ADUser'
    'gp' = 'Get-ADGroup'
    'ld' = 'Get-ADUser -Properties memberOf'
    'gr' = 'Get-ADGroupMember'
    'grl' = 'Get-ADGroupMember -Identity'
    'grv' = 'Get-ADGroup -Identity'
    'grv2' = 'Get-ADGroup -Filter { Name -eq "<GROUP NAME>" }'
    'grvl' = 'Get-ADGroupMember -Identity <GROUP NAME>'
    'gpv' = 'Get-ADGroup -Identity <GROUP NAME>'
    'gpv2' = 'Get-ADGroup -Filter { Name -eq "<GROUP NAME>" }'
    'gpvl' = 'Get-ADGroupMember -Identity <GROUP NAME>'
    'sp' = 'Set-ADUser -Identity'
    'spv' = 'Set-ADUser -Identity <USER NAME> -Enabled $false'
    'spv2' = 'Set-ADUser -Identity <USER NAME> -Enabled $true'
    'spw' = 'Set-ADUser -Identity'
    'spw2' = 'Set-ADUser -Identity <USER NAME> -ChangePasswordAtLogon $true'
    'spwl' = 'Set-ADUser -Identity <USER NAME> -ChangePasswordAtLogon $false'
    'spp' = 'Set-ADUser -Identity'
    'spp2' = 'Set-ADUser -Identity <USER NAME> -PasswordNeverExpires $true'
    'sppl' = 'Set-ADUser -Identity <USER NAME> -PasswordNeverExpires $false'
    'spg' = 'Set-ADUser -Identity'
    'spg2' = 'Set-ADUser -Identity <USER NAME> -ChangePasswordAtLogon $false'
    'spgl' = 'Set-ADUser -Identity <USER NAME> -ChangePasswordAtLogon $true'
}

# Alians Appendices (2) - Functions
function Get-ADGroupMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Identity
    )
    Get-ADGroupMember -Identity $Identity | Select-Object SamAccountName, @{ Name = 'MemberOf'; Expression = { $_.MemberOf -join ', ' } }
}

# Alians Appendices (3) - Aliases and Functions
foreach ($alias in $aliases.Keys) {
    Set-Alias -Name $alias -Value $aliases[$alias]
}

# Alians Appendices (4) - Aliases and Functions
Register-ObjectEvent -InputObject $aliases -EventName PropertyChanged -Action {
    param (
        [Parameter(Mandatory=$true)]
        [string]$PropertyName,
        [Parameter(Mandatory=$true)]
        [object]$Sender,
        [Parameter(Mandatory=$true)]
        [object]$Event
    )
    Write-Host "Property '$propertyName' changed for alias '$($sender.Name)'"
}


# Alians Appendices (5) - Aliases and Functions
$aliases.Keys | ForEach-Object {
    $alias = $_
    $function = $aliases[$alias]
    if ($function -is [ScriptBlock]) {
        $function.Invoke($alias)
    }
}


# Alians Appendices (6) - Aliases and Functions
Get-ADGroupMembers -Identity 'Domain Administrators'
