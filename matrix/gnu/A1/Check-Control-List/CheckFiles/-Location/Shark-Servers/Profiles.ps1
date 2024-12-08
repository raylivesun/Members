#!/home/admin/app/PowerShell/Members

# Get Profiles from AD and remove any duplicates
$profiles = Get-ADUser -Filter * -Properties * | Select-Object Name, GivenName, Surname, SamAccountName, Email, Department, Manager, LastLogonDate, LastLogoffDate, MemberOf
$uniqueProfiles = $profiles | Group-Object SamAccountName | Where-Object { $_.Count -eq 1 } | Select-Object -First 1000

# Get Groups and their members
$groups = Get-ADGroupMember -Members * -Server $env:COMPUTERNAME

# Initialize variables
$output = @"
Name,GivenName,Surname,SamAccountName,Email,Department,Manager,LastLogonDate,LastLogoffDate,MemberOf
"@

# Loop through unique profiles and add their information to the output
foreach ($profile in $uniqueProfiles) {
    $name = $profile.Name
    $givenName = $profile.GivenName
    $surname = $profile.Surname
    $samAccountName = $profile.SamAccountName
    $email = $profile.Email
    $department = $profile.Department
    $manager = $profile.Manager.Name
    $lastLogonDate = $profile.LastLogonDate.ToString("yyyy-MM-dd HH:mm:ss")
    $lastLogoffDate = $profile.LastLogoffDate.ToString("yyyy-MM-dd HH:mm:ss")

    # Find the groups the user is a member of
    $memberOfGroups = $groups | Where-Object { $_.Members -contains $profile.SamAccountName }
    $memberOf = $memberOfGroups.Name -join ', '

    # Add user information to the output
    $output += "$name,$givenName,$surname,$samAccountName,$email,$department,$manager,$lastLogonDate,$lastLogoffDate,$memberOf"
    $output += "`n"
}
