#!/home/admin/app/PowerShell/Members

# Alians System PowerShell Module Import Path (replace with your actual module path)
Import-Module '/home/admin/app/PowerShell/Alians.System'

# Get the current date and time
$dateTime = Get-Date

# Define the Alians System configuration settings
$aliansSystemConfig = @{
    AliansSystemUrl = 'https://aliansystem.com'
    AliansSystemUsername = 'your_username'
    AliansSystemPassword = 'your_password'
    AliansSystemApiToken = 'your_api_token'
    AliansSystemApiKeySecret = 'your_api_secret'
}

# Create an Alians System client
$aliansSystemClient = New-AliansSystemClient -Config $aliansSystemConfig

# Define the Alians System member data
$memberData = @{
    FirstName = 'John'
    LastName = 'Doe'
    Email = 'john.doe@example.com'
    PhoneNumber = '123-456-7890'
    Address = @{
        Street = '123 Main St'
        City = 'Anytown'
        State = 'CA'
        ZipCode = '12345'
    }
    DateOfBirth = (Get-Date).AddYears(-25)
}

# Create a new Alians System member
$newMember = New-AliansSystemMember -Client $aliansSystemClient -Data $memberData

# Get the newly created Alians System member ID
$newMemberId = $newMember.Id

# Update the Alians System member's email address
$updatedMember = Update-AliansSystemMember -Client $aliansSystemClient -Id $newMemberId -Data @{ Email = 'john.doe@updated.example.com' }

# Delete the Alians System member
Remove-AliansSystemMember -Client $aliansSystemClient -Id $newMemberId

# Log the current date and time
Write-Host "Log: $($dateTime) - Member data updated and deleted"
Write-Host ./Web-Report.ps1 $updatedMember

