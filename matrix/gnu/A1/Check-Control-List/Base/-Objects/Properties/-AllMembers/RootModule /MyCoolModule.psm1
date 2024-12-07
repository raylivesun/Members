#!/home/admin/app/PowerShell/Members

# My cool module function to get all users with an email ending in "@example.com"
function Get-UsersWithExampleEmail {
    param (
        # The domain to filter by
        [Parameter(Mandatory)]
        [string]$Domain
    )

    # Use the Active Directory module to query the Active Directory for users
    Get-ADUser -Filter { Email -like "*$Domain" } -Properties * | Select-Object Name, Email
}

# Call the function with the domain "example.com"
Get-UsersWithExampleEmail -Domain example.com
