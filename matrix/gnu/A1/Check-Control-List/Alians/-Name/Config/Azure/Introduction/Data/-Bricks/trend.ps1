#!/home/admin/app/PowerShell/Members

# Alians Data Import Script for PowerShell Members Management

# Import required modules
Import-Module ActiveDirectory

# Variables
$domain = "yourdomain.com"
$username = "yourusername"
$password = ConvertTo-SecureString "yourpassword" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($username, $password)
$OUPath = "OU=YourOU,DC=yourdomain,DC=com"

# Connect to Active Directory
Connect-ADDomain -DomainName $domain -Credential $cred

# Function to retrieve member data from CSV file
function Get-MemberData {
    param (
        [Parameter(Mandatory=$true)]
        [string]$CSVFilePath
    )

    # Read CSV file and return member data as objects
    $members = Import-Csv -Path $CSVFilePath | ForEach-Object {
        [PSCustomObject]@{
            Name = $_.Name
            Email = $_.Email
            PhoneNumber = $_.PhoneNumber
            Department = $_.Department
        }
    }

    return $members
}

# Function to create new Active Directory accounts
function CreateADAccount {
    param (
        [Parameter(Mandatory=$true)]
        [PSCustomObject]$Member
    )

    # Create new Active Directory account
    New-ADUser -Name $Member.Name -SamAccountName $Member.Name -Enabled $true -UserPrincipalName "$($Member.Name)@$domain" -ChangePasswordAtLogon $false -PassThru |
    Add-ADGroupMember -Members "YourGroup" -Confirm:$false

    # Set account password
    Set-ADUser -Identity $Member.Name -ChangePasswordAtLogon $false -PasswordNeverExpires $true -PassThru |
    Set-ADAccountPassword -NewPassword (ConvertTo-SecureString "yourpassword" -AsPlainText -Force) -Confirm:$false

    # Set account properties
    Set-ADUser -Identity $Member.Name -Description $Member.Department -Department $Member.Department -Confirm:$false
}

# Retrieve member data from CSV file
$members = Get-MemberData -CSVFilePath "members.csv"

# Create new Active Directory accounts
foreach ($member in $members) {
    Create-ADAccount -Member $member
}

Write-Progress './-Authoring' ./Config $OUPath ./packages.ps1
Write-Host 'Alians data import completed successfully.'

