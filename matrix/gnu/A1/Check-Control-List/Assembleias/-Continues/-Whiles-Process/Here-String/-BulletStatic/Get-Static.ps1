#!/home/admin/app/PowerShell/Members

# Get Static IP address of the server (replace 'eth0' with your network interface)
$static_ip=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)


function Get-ADComputer {
  # Get Active Directory computers
  $computers = Get-ADComputer -Filter {Enabled -eq $true -and ObjectClass -eq 'computer' } | Select-Object Name, OperatingSystem, OperatingSystemVersion, LastLogon, LastLogoff, AccountExpirationDate
  return $computers

}

function Get-ADUser {
  # Get Active Directory users
  $users = Get-ADUser -Filter {Enabled -eq $true -and ObjectClass -eq 'user' } | Select-Object Name, AccountType, LastLogon, LastLogoff, AccountExpirationDate
  return $users
}

function Get-ADGroup {
  # Get Active Directory groups
  $groups = Get-ADGroup -Filter {Enabled -eq $true } | Select-Object Name, Description, Members
  return $groups
}

function Get-ADComputerInfo {
  param (
    [Parameter(Mandatory=$true)]
    [string]$ComputerName
  )

  # Get Active Directory computer information
  $computer = Get-ADComputer -Identity $ComputerName -Properties OperatingSystem, OperatingSystemVersion, LastLogon, LastLogoff, AccountExpirationDate
  return $computer
}

function Get-ADUserInfo {
  param (
    [Parameter(Mandatory=$true)]
    [string]$UserName
  )

  # Get Active Directory user information
  $user = Get-ADUser -Identity $UserName -Properties AccountType, LastLogon, LastLogoff, AccountExpirationDate
  return $user
}

function Get-ADGroupInfo {
  param (
    [Parameter(Mandatory=$true)]
    [string]$GroupName
  )

  # Get Active Directory group information
  $group = Get-ADGroup -Identity $GroupName -Properties Description, Members
  return $group
}

function Get-ADComputerLogins {
  param (
    [Parameter(Mandatory=$true)]
    [string]$ComputerName
  )

  # Get Active Directory computer logins
  $logins = Get-ADComputer -Identity $ComputerName -Properties LogonCount, LastLogon, LastLogonTime, LogonType, AccountLockoutTime
  return $logins
}

function Get-ADUserLogins {
  param (
    [Parameter(Mandatory=$true)]
    [string]$UserName
  )

  # Get Active Directory user logins
  $logins = Get-ADUser -Identity $UserName -Properties LogonCount, LastLogon, LastLogonTime, LogonType, AccountLockoutTime
  return $logins
}

function Set-ADUserPassword {
  # Set Active Directory user password
  Set-ADUser -Identity $UserName -ChangePasswordAtLogon:$ChangePasswordAtLogon -Password (ConvertTo-SecureString -AsPlainText $Password -Force)
}

function Set-ADComputerPassword {
  # Set Active Directory computer password
  Set-ADComputer -Identity $ComputerName -ChangePasswordAtLogon:$ChangePasswordAtLogon -Password (ConvertTo-SecureString -AsPlainText $Password -Force)
}


# Example usage
$computer = Get-ADComputerInfo -ComputerName "your-computer-name"
Write-Host "Operating System: $($computer.OperatingSystem)"
Write-Host "Operating System Version: $($computer.OperatingSystemVersion)"
Write-Host "Last Logon: $($computer.LastLogon)"
Write-Host "Last Logoff: $($computer.LastLogoff)"
Write-Host "Account Expiration Date: $($computer.AccountExpirationDate)"

$user = Get-ADUserInfo -UserName "your-user-name"
Write-Host "Account Type: $($user.AccountType)"
Write-Host "Last Logon: $($user.LastLogon)"
Write-Host "Last Logoff: $($user.LastLogoff)"
Write-Host "Account Expiration Date: $($user.AccountExpirationDate)"

$group = Get-ADGroupInfo -GroupName "your-group-name"
Write-Host "Description: $($group.Description)"
Write-Host "Members: $($group.Members.Count)"

$logins = Get-ADComputerLogins -ComputerName "your-computer-name"
Write-Host "Logon Count: $($logins.LogonCount)"
Write-Host "Last Logon: $($logins.LastLogon)"
Write-Host "Last Logon Time: $($logins.LastLogonTime)"
Write-Host "Logon Type: $($logins.LogonType)"
Write-Host "Account Lockout Time: $($logins.AccountLockoutTime)"

$logins = Get-ADUserLogins -UserName "your-user-name"
Write-Host "Logon Count: $($logins.LogonCount)"

Write-Host $static_ip
