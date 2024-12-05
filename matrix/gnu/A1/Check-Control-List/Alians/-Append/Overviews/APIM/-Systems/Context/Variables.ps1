#!/home/admin/app/PowerShell/Members

# Alians Context Menu for Active Directory Users and Groups
# Version 1.0.0

# Import required modules
Import-Module ActiveDirectory

# Function to retrieve user or group details
function Get-ADObjectDetails {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectPath,
        [Parameter(Mandatory=$true)]
        [string]$PropertyList
    )
    try {
        $object = Get-ADObject -Identity $ObjectPath -Properties $PropertyList
        return $object
    }
    catch {
        Write-Error "Error retrieving object details: $_"
        return $null
    }
    finally {
        Clear-Variable -Name objectPath -Scope 0
    }
}

# Function to retrieve user or group memberships
function Get-ADGroupMemberships {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectPath
    )
    try {
        $members = Get-ADGroupMember -Identity $ObjectPath -MembersType Member -Properties SamAccountName, GivenName, Surname, EmailAddress, MemberOf
        return $members
    }
    catch {
        Write-Error "Error retrieving group memberships: $_"
        return $null
    }
    finally {
        Clear-Variable -Name objectPath -Scope 0
    }

    # Function to format and export the retrieved information
    function Export-ADObjectDetails {
        param (
            [Parameter(Mandatory=$true)]
            [object]$Object,

            [Parameter(Mandatory=$true)]
            [string]$OutputPath
        )
        try {
            $csvData = @()
            foreach ($member in $Object.Members) {
                $csvData += [PSCustomObject]@{
                    SamAccountName = $member.SamAccountName
                    GivenName = $member.GivenName
                    Surname = $member.Surname
                    EmailAddress = $member.EmailAddress
                    GroupMembership = $member.MemberOf.Name
                }
                $csvData | Export-Csv -Path $OutputPath -NoTypeInformation
            }
            Write-Host "Group memberships exported to '$OutputPath'"
        }
        catch {
            Write-Error "Error exporting group memberships: $_"
        }
    }
    Export-ADObjectDetails -Object $members -OutputPath "$($Object.Name)_memberships.csv"
}

# Read command-line arguments
$objectPath = $args[0]
$propertyList = "SamAccountName,GivenName,Surname,EmailAddress,MemberOf"

# Check if the object path is provided
if (-not $objectPath) {
    Write-Host "Usage: $0 <objectPath>"
    exit 1
}

# Check if the object path is valid
$object = Get-ADObjectDetails -ObjectPath $objectPath -PropertyList $propertyList
if (-not $object) {
    exit 1
}

# Check if the object is a user or a group
if ($object.objectClass -contains "user") {
    Write-Host "User details for '$($object.SamAccountName)'"
    Write-Host "Given Name: $($object.GivenName)"
    Write-Host "Surname: $($object.Surname)"
    Write-Host "Email Address: $($object.EmailAddress)"
}
else {
    Write-Host "Group details for '$($object.Name)'"
    Write-Host "Members:"
    Get-ADGroupMemberships -ObjectPath $objectPath
    exit 0
}

