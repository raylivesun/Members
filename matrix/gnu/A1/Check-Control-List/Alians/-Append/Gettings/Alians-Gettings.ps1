#!/home/admin/app/PowerShell/Members

# Alians Getters and Setters (alias) for member properties
function Get-MemberProperty {
    param (
        [Parameter(Mandatory)]
        [Object]
        $Object,

        [Parameter(Mandatory)]
        [String]
        $PropertyName
    )

    $property = $Object.$propertyName
    if ($property) {
        $property.Value
    } else {
        Write-Host "Property '$propertyName' not found on object '$Object'"
        $null
    }
}

function Set-MemberProperty {
    param (
        [Parameter(Mandatory)]
        [Object]
        $Object,

        [Parameter(Mandatory)]
        [String]
        $PropertyName,

        [Parameter(Mandatory)]
        [Object]
        $Value
    )

    $property = $Object.$propertyName
    if ($property) {
        $property.Value = $Value
    } else {
        Write-Host "Property '$propertyName' not found on object '$Object'"
        $null
    }
    $Object
}

# Aliases for Get-MemberProperty and Set-MemberProperty
Set-Alias -Name Get-MemberProperty -Value Get-MemberProperty
Set-Alias -Name Set-MemberProperty -Value Set-MemberProperty

# Example usage
$user = Get-ADUser -Identity 'john.doe'
Set-MemberProperty -Object $user -PropertyName 'Department' -Value 'Marketing'
Write-Host "User '$user.Name' updated department to '$user.Department'"
