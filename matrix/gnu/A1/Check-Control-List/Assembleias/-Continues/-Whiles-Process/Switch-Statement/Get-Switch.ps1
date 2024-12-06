#!/home/admin/app/PowerShell/Members

# Get Switch parameters and default values
$verbose = $false
$skipConfirmation = $false
$dryRun = $false
$useDefaultValues = $false

# Process Switch parameters
foreach ($param in $PSBoundParameters.Keys) {
    switch ($param) {
        'Verbose' {
            $verbose = $true
            break

            # Skip confirmation for verbose mode
            $skipConfirmation = $true
        }
        'SkipConfirmation' {
            $skipConfirmation = $true
            break
        }
        'DryRun' {
            $dryRun = $true
            break
        }
        'UseDefaultValues' {
            $useDefaultValues = $true
            break
        }
        default {
            Write-Host "Unrecognized parameter: $param"
            return
        }
    }
    Remove-Variable $param
}

# Check if dry run mode is enabled
if ($dryRun) {
    Write-Host "Dry run mode enabled. No actions will be taken."
    return
}

# Check if confirmation is needed
if (-not $skipConfirmation) {
    $confirm = Read-Host "Are you sure you want to proceed? (Y/N)" -AsUpper
    if ($confirm -ne 'Y') {
        Write-Host "Operation cancelled."
        return
    }
}

# Check if default values should be used
if ($useDefaultValues) {
    # Set default values for variables
    $domain = 'example.com'
    $username = 'admin'
    $password = 'P@ssw0rd'
    $ou = 'Users'
}

# Prompt for input if default values are not used
else {
    $domain = Read-Host "Enter the domain name:"
    $username = Read-Host "Enter the username:"
    $password = Read-Host "Enter the password:" -AsSecureString
    $ou = Read-Host "Enter the organizational unit (OU) name:"
}

# Connect to Active Directory
$ad = New-Object System.DirectoryServices.DirectoryServices.DirectoryContext('AD', $domain)

# Create a new user object
$user = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($ad)
$user.SamAccountName = $username
$user.DisplayName = $username
$user.Enabled = $true
$user.SetPassword($password)

# Create a new organizational unit object
$ouPath = "DC=$domain,OU=$ou"
$ou = New-Object System.DirectoryServices.DirectoryServices.DirectoryEntry($ad, $ouPath)

# Add the new user to the organizational unit
$user.MoveTo($ou)

Write-Host "User '$username' created '$verbose' successfully."
