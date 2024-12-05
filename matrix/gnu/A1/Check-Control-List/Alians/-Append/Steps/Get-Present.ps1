#!/home/admin/app/PowerShell/Members

# Alians Get Member Information script for PowerShell 7.x and later versions
# Author:  AliansReborn
# Version: 1.0.0
# Date:    2023-07-26

# Import the required module
Import-Module ActiveDirectory

# Function to get the member's group memberships
function Get-GroupMemberships {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $MemberDN | Select-Object Name, MemberType

    return $groupMemberships
}

# Function to get the member's account information
function Get-AccountInformation {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's account information
    $accountInfo = Get-ADUser -Identity $MemberDN | Select-Object Name, SamAccountName, EmailAddress, MemberOf
    $accountInfo.MemberOf = $accountInfo.MemberOf.Select

    return $accountInfo
}

# Function to get the member's security descriptor
function Get-SecurityDescriptor {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's security descriptor
    $securityDescriptor = Get-ADUser -Identity $MemberDN | Select-Object SecurityDescriptor

    return $securityDescriptor
}

# Function to get the member's object class
function Get-ObjectClass {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's object class
    $objectClass = Get-ADUser -Identity $MemberDN | Select-Object ObjectClass

    return $objectClass
}

# Function to get the member's last logon information
function Get-LastLogonInfo {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's last logon information
    $lastLogonInfo = Get-ADUser -Identity $MemberDN | Select-Object LastLogonDate, LastLogonTime

    return $lastLogonInfo
}

# Function to get the member's password last set date
function Get-PasswordLastSetDate {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's password last set date
    $passwordLastSetDate = Get-ADUser -Identity $MemberDN | Select-Object PasswordLastSet
    $passwordLastSetDate = $passwordLastSetDate.PasswordLastSet.ToString('yyyy-MM-dd')

    return $passwordLastSetDate
}

# Function to get the member's password expiration date
function Get-PasswordExpirationDate {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's password expiration date
    $passwordExpirationDate = Get-ADUser -Identity $MemberDN | Select-Object ExpiresOn
    $passwordExpirationDate = $passwordExpirationDate.ExpiresOn.ToString('yyyy-MM-dd')

    return $passwordExpirationDate
}

# Function to check if the member is a member of a specific group
function IsMemberOfGroup {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN,
        [Parameter(Mandatory)]
        [string]$GroupName
    )

    # Check if the member is a member of the specified group
    $isMemberOfGroup = Test-ADUser -Identity $MemberDN -MemberOf $GroupName
    return $isMemberOfGroup
}

# Function to get the member's lockout information
function Get-LockoutInfo {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's lockout information
    $lockoutInfo = Get-ADUser -Identity $MemberDN | Select-Object LockedOut, LockedOutTime, LockoutDuration
    $lockoutInfo.LockedOutTime = $lockoutInfo.LockedOutTime.ToString('yyyy-MM-dd HH:mm:ss')

    return $lockoutInfo
}

# Function to get the member's last name
function Get-LastName {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's last name
    $lastName = Get-ADUser -Identity $MemberDN | Select-Object Name | Select-Object -ExpandProperty Name
    $lastName = $lastName.Split(' ')[-1]

    return $lastName
}

# Function to get the member's first name
function Get-FirstName {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's first name
    $firstName = Get-ADUser -Identity $MemberDN | Select-Object Name | Select-Object -ExpandProperty Name
    $firstName = $firstName.Split(' ')[0]

    return $firstName
}

# Function to get the member's full name
function Get-FullName {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's full name
    $fullName = Get-ADUser -Identity $MemberDN | Select-Object Name | Select-Object -ExpandProperty Name
    return $fullName
}

# Function to get the member's primary email address
function Get-PrimaryEmailAddress {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's primary email address
    $primaryEmailAddress = Get-ADUser -Identity $MemberDN | Select-Object EmailAddress | Select-Object -ExpandProperty EmailAddress
    return $primaryEmailAddress
}

# Function to get the member's phone number
function Get-PhoneNumber {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's phone number
    $phoneNumber = Get-ADUser -Identity $MemberDN | Select-Object PhoneNumber | Select-Object -ExpandProperty PhoneNumber
    return $phoneNumber
}

# Function to get the member's job title
function Get-JobTitle {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's job title
    $jobTitle = Get-ADUser -Identity $MemberDN | Select-Object JobTitle | Select-Object -ExpandProperty JobTitle
    return $jobTitle
}

# Function to get the member's department
function Get-Department {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's department
    $department = Get-ADUser -Identity $MemberDN | Select-Object Department | Select-Object -ExpandProperty Department
    return $department
}

# Function to get the member's manager's DN
function Get-ManagerDN {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's manager's DN
    $managerDN = Get-ADUser -Identity $MemberDN | Select-Object Manager | Select-Object -ExpandProperty Manager
    return $managerDN
}

# Function to get the member's manager's name
function Get-ManagerName {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's manager's name
    $managerName = Get-ADUser -Identity (Get-ManagerDN $MemberDN) | Select-Object Name | Select-Object -ExpandProperty Name
    return $managerName
}

# Function to get the member's manager's email address
function Get-ManagerEmailAddress {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's manager's email address
    $managerEmailAddress = Get-ADUser -Identity (Get-ManagerDN $MemberDN) | Select-Object EmailAddress | Select-Object -ExpandProperty EmailAddress
    return $managerEmailAddress
}

# Function to get the member's manager's phone number
function Get-ManagerPhoneNumber {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's manager's phone number
    $managerPhoneNumber = Get-ADUser -Identity (Get-ManagerDN $MemberDN) | Select-Object PhoneNumber | Select-Object -ExpandProperty PhoneNumber
    return $managerPhoneNumber
}

# Function to get the member's manager's job title
function Get-ManagerJobTitle {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's manager's job title
    $managerJobTitle = Get-ADUser -Identity (Get-ManagerDN $MemberDN) | Select-Object JobTitle | Select-Object -ExpandProperty JobTitle
    return $managerJobTitle
}

# Function to get the member's manager's department
function Get-ManagerDepartment {
    param (
        [Parameter(Mandatory)]
        [string]$MemberDN
    )

    # Get the member's manager's department
    $managerDepartment = Get-ADUser -Identity (Get-ManagerDN $MemberDN) | Select-Object Department | Select-Object -ExpandProperty Department
    return $managerDepartment
}

# Function to get the member's manager's manager's DN
function Get-ManagerManagerDN {
    param (
        [Parameter(Mandatory)]
        [string]
        [Parameter(Mandatory)]
        [string]$ManagerManagerDN
    )

    # Get the member's manager's manager's DN
    $managerManagerDN = Get-ADUser -Identity $ManagerManagerDN | Select-Object Manager | Select-Object -ExpandProperty Manager
    return $managerManagerDN
}


# Function to get the member's manager's manager's name
function Get-ManagerManagerName {
    param (
        [Parameter(Mandatory)]
        [string]
        [Parameter(Mandatory)]
        [string]$ManagerManagerDN
    )

    # Get the member's manager's manager's name
    $managerManagerName = Get-ADUser -Identity (Get-ManagerManagerDN $ManagerManagerDN) | Select-Object Name | Select-Object -ExpandProperty Name
    return $managerManagerName
}

# Function to get the member's manager's manager's email address
function Get-ManagerManagerEmailAddress {
    param (
        [Parameter(Mandatory)]
        [string]
        [Parameter(Mandatory)]
        [string]$ManagerManagerDN
    )

    # Get the member's manager's manager's email address
    $managerManagerEmailAddress = Get-ADUser -Identity (Get-ManagerManagerDN $ManagerManagerDN) | Select-Object EmailAddress | Select-Object -ExpandProperty EmailAddress
    return $managerManagerEmailAddress
}

# Function to get the member's manager's manager's phone number
function Get-ManagerManagerPhoneNumber {
    param (
        [Parameter(Mandatory)]
        [string]
        [Parameter(Mandatory)]
        [string]$ManagerManagerDN
    )

    # Get the member's manager's manager's phone number
    $managerManagerPhoneNumber = Get-ADUser -Identity (Get-ManagerManagerDN $ManagerManagerDN) | Select-Object PhoneNumber | Select-Object -ExpandProperty PhoneNumber
    return $managerManagerPhoneNumber
}

# Function to get the member's manager's manager's job title
function Get-ManagerManagerJobTitle {
    param (
        [Parameter(Mandatory)]
        [string]
        [Parameter(Mandatory)]
        [string]$ManagerManagerDN
    )
    # Get the member's manager's manager's job title
    $managerManagerJobTitle = Get-ADUser -Identity (Get-ManagerManagerDN $ManagerManagerDN) | Select-Object JobTitle | Select-Object -ExpandProperty JobTitle
    return $managerManagerJobTitle
}

# Function to get the member's manager's manager's department
function Get-ManagerManagerDepartment {
    param (
        [Parameter(Mandatory)]
        [string]
        [Parameter(Mandatory)]
        [string]$ManagerManagerDN
    )
    # Get the member's manager's manager's department
    $managerManagerDepartment = Get-ADUser -Identity (Get-ManagerManagerDN $ManagerManagerDN) | Select-Object Department | Select-Object -ExpandProperty Department
    return $managerManagerDepartment
}

# Example usage
$memberDN = "CN=John Doe,OU=Users,DC=example,DC=com"

$isMemberOfGroup = Is-MemberOfGroup -MemberDN $memberDN -GroupName "Admins"
$lockoutInfo = Get-LockoutInfo -MemberDN $memberDN
$lastName = Get-LastName -MemberDN $memberDN
$firstName = Get-FirstName -MemberDN $memberDN
$fullName = Get-FullName -MemberDN $memberDN
$primaryEmailAddress = Get-PrimaryEmailAddress -MemberDN $memberDN
$phoneNumber = Get-PhoneNumber -MemberDN $memberDN
$jobTitle = Get-JobTitle -MemberDN $memberDN
$department = Get-Department -MemberDN $memberDN
$managerDN = Get-ManagerDN -MemberDN $memberDN
$managerName = Get-ManagerName -MemberDN $memberDN
$managerEmailAddress = Get-ManagerEmailAddress -MemberDN $memberDN
$managerPhoneNumber = Get-ManagerPhoneNumber -MemberDN $memberDN
$managerJobTitle = Get-ManagerJobTitle -MemberDN $memberDN
$managerDepartment = Get-ManagerDepartment -MemberDN $memberDN
$managerManagerDN = Get-ManagerManagerDN -ManagerManagerDN $managerDN
$managerManagerName = Get-ManagerManagerName -ManagerManagerDN $managerDN
$managerManagerEmailAddress = Get-ManagerManagerEmailAddress -ManagerManagerDN $managerDN
$managerManagerPhoneNumber = Get-ManagerManagerPhoneNumber -ManagerManagerDN $managerDN
$managerManagerJobTitle = Get-ManagerManagerJobTitle -ManagerManagerDN $managerDN
$managerManagerDepartment = Get-ManagerManagerDepartment -ManagerManagerDN $managerDN

Write-Host "Is member of group: $isMemberOfGroup"
Write-Host "Lockout info: $lockoutInfo"
Write-Host "Last name: $lastName"
Write-Host "First name: $firstName"
Write-Host "Full name: $fullName"
Write-Host "Primary email address: $primaryEmailAddress"
Write-Host "Phone number: $phoneNumber"
Write-Host "Job title: $jobTitle"
Write-Host "Department: $department"
Write-Host "Manager DN: $managerDN"
Write-Host "Manager name: $managerName"
Write-Host "Manager email address: $managerEmailAddress"
Write-Host "Manager phone number: $managerPhoneNumber"
Write-Host "Manager job title: $managerJobTitle"
Write-Host "Manager department: $managerDepartment"
Write-Host "Manager's manager DN: $managerManagerDN"
Write-Host "Manager's manager name: $managerManagerName"
Write-Host "Manager's manager email address: $managerManagerEmailAddress"
Write-Host "Manager's manager phone number: $managerManagerPhoneNumber"
Write-Host "Manager's manager job title: $managerManagerJobTitle"
Write-Host "Manager's manager department: $managerManagerDepartment"
