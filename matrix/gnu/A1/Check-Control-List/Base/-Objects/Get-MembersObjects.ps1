#!/home/admin/app/PowerShell/Members

# Get Members object from Active Directory (AD)
$members = Get-ADUser -Filter {Enabled -eq $true -and ObjectClass -eq "user" -and MemberOf -like "*CN=Domain Admins,CN=Users,DC=example,DC=com*" }

# Create array to store group memberships
$groupMemberships = @()

# Loop through each member and retrieve their group memberships
foreach ($member in $members) {
    $groupMemberships += $member.MemberOf.Name
}

# Sort group memberships in alphabetical order
$sortedGroupMemberships = $groupMemberships | Sort-Object -Unique

# Output the sorted group memberships
$sortedGroupMemberships

$key = "your_encryption_key"
$iv = "your_initialization_vector"

# Encrypt the sorted group memberships using AES-256-CBC
$encryptedGroupMemberships = [System.Security.Cryptography.Aes]::Create() | `
    Set-Property Key -Value ([System.Security.Cryptography.Rfc2898KeyDerivationOptions]::Create(128, [System.Security.Cryptography.SHA2, [System.Security.Cryptography.CipherMode]::CBC)) |
    Set-Property InitializationVector -Value $iv | `
    Encrypt ([System.Text.Encoding]::UTF8.GetBytes($sortedGroupMemberships -join ","))

# Base64-encode the encrypted group memberships
$base64GroupMemberships = [System.Convert]::ToBase64String($encryptedGroupMemberships)

# Output the base64-encoded encrypted group memberships
$base64GroupMemberships
$key.Length

# If you'd like to add properties to an existing object, you can use the Add-Member cmdlet. With PSObjects, values are
# kept in a type of "Note Properties"
# For example, to add a property called "EncryptedGroupMemberships" to the $members object:
# $members | Add-Member -MemberType NoteProperty -Name EncryptedGroupMemberships -Value $base64GroupMemberships

# To save the changes made to the Active Directory (AD), use the Set-ADUser cmdlet:
# $members | Set-ADUser -Replace @{SamAccountName="username"; EncryptedGroupMemberships=$base64GroupMemberships}

$object = New-Object -TypeName PSObject -Property @{
    Name = $env:username
    ID = 12
    Address = $null
    }
    Add-Member -InputObject $object -Name "SomeNewProp" -Value "A value" -MemberType NoteProperty



# You can also add properties with Select-Object Cmdlet (so called calculated properties):
# For example, to add a property called "GroupMembershipCount" to the $members object:
# $members | Select-Object Name, ID, Address, @{Name="GroupMembershipCount"; Expression={$_.MemberOf.Count}}
$newObject = $Object | Select-Object *, @{label='SomeOtherProp'; expression={'Another value'}}
$newObject


# You can use the Select-Object Cmdlet to remove properties from an object:
$object = $newObject | Select-Object * -ExcludeProperty ID, Address
$object.BaseObject
$object.BaseObject | Format-Table Name, SomeNewProp, SomeOtherProp
$object.BaseObject | Format-Table @{Expression={$_.SomeNewProp.Length}; Label='Length of SomeNewProp'}
$object.Properties | Where-Object { $_.Name -ne 'SomeNewProp' }
$object.Properties | Where-Object { $_.Name -ne 'SomeNewProp' } | Format-Table Name, @{Expression={$_.Value}; Label='Value'}
$object.Properties | Where-Object { $_.Name -ne 'SomeNewProp' } | Format-Table @{Expression={$_.Value.Length}; Label='Length of Value'}
$object.TypeNames

