#!/home/admin/app/PowerShell/Memebers

# Regex Parameters for Email Validation 
$regex_email='^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

# List of Members
$members = @('John Doe@example.com', 'Jane Smith@example.com', 'Bob Johnson@example.com')

# Function to validate email
function ValidateEmail($email) {
    if ($email -match $regex_email) {
        return $true
        } else {
        return $false
        }
}

# Filter members with valid emails
$valid_members = $members | Where-Object { Validate-Email $_ }

# Count valid members
$valid_member_count = $valid_members.Count

# Display valid member count
Write-Host "Number of valid members: $valid_member_count"

switch -Regex ('Condition')
{
'Con\D+ion' {'One or more non-digits'}
'Conditio*$' {'Zero or more "o"'}
'C.ndition' {'Any single char.'}
'^C\w+ition$' {'Anchors and one or more word chars.'}
'Test' {'No match'}
}