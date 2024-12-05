#!/home/admin/app/PowerShell/Members

# Alians Add-Type cmdlet to import the necessary assemblies
Add-Type -Path '/home/admin/app/PowerShell/Members/Microsoft.Exchange.WebServices.dll'

# Import the Exchange Web Services namespace
Import-Alias Microsoft.Exchange.WebServices.Data


# Function to retrieve the members of a specific group
function Get-ExchangeGroupMembers {
    param (
        [Parameter(Mandatory = $true)]
        [string]$groupName,
        [Parameter(Mandatory = $true)]
        [string]$domainController
    )

    # Initialize the Exchange Web Services client
    $ews = New-Object ExchangeService(ExchangeVersion2013)
    
    # Set the credentials for the domain controller
    $ews.Credentials = New-Object System.Net.NetworkCredential('domain\admin', 'password')
    
    try {
        # Connect to the domain controller
        $ews.Connect($domainController)
        
        # Get the group by its name
        $group = Get-DistributionGroup -Identity $groupName -ResultSize Unlimited
        
        # Retrieve the group members
        $members = $group.Members
        
        # Return the group members as an array
        return $members.ToArray()
    }
    catch {
        # Handle any exceptions that occur during the operation
        Write-Error -Message "An error occurred: $_"
        return $null
    }
}

# Example usage
$groupName = 'Exchange Administrators'
$domainController = 'dc01.example.com'

$members = Get-ExchangeGroupMembers -groupName $groupName -domainController $domainController

if ($members) {
    foreach ($member in $members) {
        Write-Output "Member: $($member.DisplayName)"
    }

    # Export the group members to a CSV file
    $members | Export-Csv -Path 'exchange_group_members.csv' -NoTypeInformation
}
