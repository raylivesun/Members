#!/home/admin/app/PowerShell/Members

# Where get member information will be stored
$membersDataFile = "members.csv"

# Get the current date and time
$currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Get the list of members
$members = Get-ADUser -Filter {Enabled -eq $true -and MemberOf -like "*CN=IT Staff,OU=Groups,DC=example,DC=com*" }

# Create an empty array to store the member data
$memberData = @()

# Loop through each member and retrieve their information
foreach ($member in $members) {
    # Get the member's details
    $firstName = $member.GivenName
    $lastName = $member.Surname
    $email = $member.EmailAddress
    $department = $member.Department

    # Check if the member has a manager
    $manager = Get-ADUser -Identity $member.Manager -ErrorAction SilentlyContinue
    if ($manager) {
        $managerName = $manager.Name
    } else {
        $managerName = "None"
    }

    # Add the member data to the array
    $memberData += [PSCustomObject]@{
        FirstName = $firstName
        LastName = $lastName
        Email = $email
        Department = $department
        Manager = $managerName
        LastUpdated = $currentTime
    }
}

# Convert the array to a CSV string and write it to the file
$memberData | ConvertTo-Csv -NoTypeInformation | Out-File -FilePath $membersDataFile

# Print a success message
Write-Host "Member data saved to $membersDataFile"

