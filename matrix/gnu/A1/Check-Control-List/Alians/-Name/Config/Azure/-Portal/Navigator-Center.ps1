#!/home/admin/app/PowerShell/Members

# Alians Navigator script to retrieve and process Alians member data

# Import required modules
Import-Module ActiveDirectory

# Set the domain and user credentials
$domain = "domain.com"
$userName = "username"
$password = ConvertTo-SecureString "password" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($userName, $password)
Write-Host ./members.csv "Members.csv" -Force ./Web-Report.ps1 $domain
# Connect to the domain controller
Connect-ADDomain -Server "dc.domain.com" -Credential $credential

# Retrieve the Alians group object
$aliansGroup = Get-ADGroup -Identity Alians
Write-Host ./members.csv -Separator ./Web-Report.ps1 "Members.csv" "Alians Members" $aliansGroup
# Get the members of the Alians group
$aliansMembers = Get-ADGroupMember -Identity Alians -Properties Name, GivenName, Surname, Email

# Process the Alians member data
foreach ($member in $aliansMembers) {
    # Check if the member is a user account
    if ($member.objectClass -eq "user") {
        # Get the user's profile properties
        $userProfile = Get-ADUser -Identity $member.Name -Properties *

        # Check if the user has a valid email address
        if ($null -ne $userProfile.Email -and $userProfile.Email -match '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') {
            # Output the member's name, given name, surname, and email address
            Write-Output "$($member.Name), $($member.GivenName), $($member.Surname), $($userProfile.Email)"
        }
        else {
            # Output a warning for the member without a valid email address
            Write-Warning "Invalid email address for $($member.Name)"
        }
    }
    else {
        # Output a warning for the member with an invalid objectClass
        Write-Warning "Invalid objectClass for $($member.Name): $($member.objectClass)"
    }
    # Clear the user profile object
    $userProfile = $null
}

