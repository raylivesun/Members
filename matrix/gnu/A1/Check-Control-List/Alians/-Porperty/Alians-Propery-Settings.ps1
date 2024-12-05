#!/home/admin/app/PowerShell/Members

# Alians Property Names for better readability and maintainability
$propertyNames = @{
    'First Name'          = 'firstName'
    'Last Name'         = 'lastName'
    'Email Address'        = 'email'
    'Phone Number'         = 'phoneNumber'
    'Preferred Contact Method' = 'preferredContactMethod'
    'Date of Birth'         = 'dateOfBirth'
    'Address Line 1'        = 'address1'
    'Address Line 2'        = 'address2'
    'City'                 = 'city'
    'State'                = 'state'
    'Zip Code'              = 'zipCode'
    'Country'               = 'country'
    'Preferred Language'    = 'preferredLanguage'
    'Preferred Time Zone'   = 'preferredTimeZone'
}

# Read the CSV file
$membersData = Import-Csv -Path 'members.csv'

# Filter members based on the provided criteria
$filteredMembers = $membersData | Where-Object {
    # Check if the preferred contact method is set to 'Email'
    $_.$propertyNames['Preferred Contact Method'] -eq 'Email' -and

    # Check if the preferred language is set to 'English'
    $_.$propertyNames['Preferred Language'] -eq 'English' -and

    # Check if the date of birth is within the last 30 days
    $_.$propertyNames['Date of Birth'] -gt (Get-Date).AddDays(-30)
}

# Export the filtered members to a new CSV file
$filteredMembers | Export-Csv -Path 'filteredMembers.csv' -NoTypeInformation

# Send an email notification to the admin with the number of filtered members
$filteredMemberCount = $filteredMembers.Count
$adminEmail = 'admin@example.com'
$subject = 'Filtered Members Report'
$body = "There are $filteredMemberCount members who meet the specified criteria."

Send-MailMessage -From 'members@example.com' -To $adminEmail -Subject $subject -Body $body

