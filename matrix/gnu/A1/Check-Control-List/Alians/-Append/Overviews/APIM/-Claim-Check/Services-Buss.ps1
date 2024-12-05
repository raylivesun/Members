#!/home/admin/app/PowerShell/Members

# Alians the Get-ADUser cmdlet to the Get-ADObject cmdlet for the purpose of this script
# This allows us to use the same syntax and parameters for both cmdlets
using namespace System.DirectoryServices.AccountManagement

# Define the domain and username for the script to connect to
$domain = 'domain.com'
$username = 'scriptuser@domain.com'

# Define the path to the CSV file containing the list of users to be exported
$csvFilePath = 'C:\path\to\users.csv'

# Read the CSV file and store the user information in an array
$users = Import-Csv -Path $csvFilePath

# Connect to Active Directory using the specified credentials
$credential = Get-Credential -UserName $username -Message 'Enter your Active Directory credentials'
$domainContext = New-Object DirectoryServices.AccountManagement.PrincipalContext($domain, '', $credential)

# Loop through each user in the array and export their information to a new CSV file
foreach ($user in $users) {
    try {
        # Get the user object using the username
        $adUser = Get-ADUser -Identity $user.Username -SearchBase 'OU=Users,DC=domain,DC=com'

        # Check if the user object exists and is enabled
        if ($adUser -and $adUser.Enabled -eq $true) {
            # Export the user's information to a new CSV file
            $exportPath = "C:\path\to\exported_users\exported_$($user.Username).csv"
            Export-Csv -Path $exportPath -InputObject $adUser -NoTypeInformation

            # Log the successful export to a separate log file
            Add-Content -Path "C:\path\to\exported_users\exported_users.log" -Value "$(Get-Date) - Exported user: $($user.Username)"
        }
        else {
            # Log the failed export to a separate log file
            Add-Content -Path "C:\path\to\exported_users\failed_exports.log" -Value "$(Get-Date) - Failed to export user: $($user.Username)"
        }

        # Wait for 1 second before processing the next user
        Start-Sleep -Seconds 1
    }
    catch {
        # Log the error to a separate log file
        Add-Content -Path "C:\path\to\exported_users\errors.log" -Value "$(Get-Date) - Error exporting user: $($user.Username) - $_"
    }
    finally {
        # Disconnect from Active Directory after processing each user
        $domainContext.Dispose()
    }
}

