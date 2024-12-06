#!/home/admin/app/PowerShell/Members

# Get Parameters from environment variables
$domain = $env:DOMAIN
$username = $env:USERNAME
$password = $env:PASSWORD
$ouPath = $env:OU_PATH
$csvPath = $env:CSV_PATH

# Connect to Active Directory using the provided credentials
$ad = New-Object System.DirectoryServices.DirectoryEntry("LDAP://" + $domain, $username, $password)

# Get the OU object from the provided path
$ou = Get-ADOrganizationalUnit -Identity $ouPath -Server $ad.Server

# Read the CSV file containing user information
$users = Import-Csv -Path $csvPath

# Loop through each user in the CSV file
foreach ($user in $users) {
    # Get the user's full name and email address
    $fullName = $user.FullName
    $email = $user.Email

    # Check if the user already exists in the OU
    $userExists = Test-Path -Path ("$ou.Path\Users\$email")

    # If the user does not exist, add them
    if (-not $userExists) {
        # Create a new user object
        $newUser = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($ad)
        $newUser.SamAccountName = $email
        $newUser.UserPrincipalName = $email
        $newUser.DisplayName = $fullName
        $newUser.Description = "User created by PowerShell script"
        $newUser.Enabled = $true

        # Set the password policy to meet your requirements
        $passwordPolicy = New-Object System.DirectoryServices.AccountManagement.PasswordPolicy
        $passwordPolicy.MinLength = 8
        $passwordPolicy.RequireDigit = $true
        $passwordPolicy.RequireLowercase = $true
        $passwordPolicy.RequireNonAlphanumeric = $true
        $passwordPolicy.RequireUppercase = $true
        $passwordPolicy.HistoryLength = 10

        # Set the password
        $newUser.SetPassword($password, $passwordPolicy)

        # Save the new user to the OU
        $newUser.Save()

        # Add the user to the OU's group
        $ou.Members.Add($newUser)
        $ou.CommitChanges()

        # Print success message
        Write-Host "User '$fullName' created successfully"
        Write-Host "Password: $password"
    }
    else {
        # User already exists, print a warning message
        Write-Host "User '$fullName' already exists in the OU"
    }
}

