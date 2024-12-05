#!/home/admin/app/PowerShell/Members

# Alians Summary Report Generator for Active Directory

# Import Active Directory module
Import-Module ActiveDirectory

# Set the Active Directory domain
$domain = 'your-domain.com'

# Set the Active Directory forest
$forest = 'your-forest.com'

# Set the Active Directory username and password
$username = 'your-username@your-domain.com'
$password = ConvertTo-SecureString -AsPlainText -Force 'your-password'

# Connect to the Active Directory domain
try {
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)
    Connect-ADDomain -Credential $credential -DomainName $domain - forestName $forest
    Write-Host "Connected to Active Directory domain '$domain' successfully."
    $connected = $true
    $domainController = Get-ADDomainController -DomainName $domain
    Write-Host "Connected to Active Directory forest '$forest' successfully."
    $forestController = Get-ADForestController -DomainName $domain
    Write-Host "Connected to Active Directory forest controller '$forestController' successfully."
    $forestName = $forestController.Name
    Write-Host "Connected to Active Directory forest '$forestName' successfully."
    $domainName = $domainController.Name
    Write-Host "Connected to Active Directory domain '$domainName' successfully."
    $domainController = Get-ADDomainController -DomainName $domain
    Write-Host "Connected to Active Directory domain controller '$domainController' successfully."
    $domainController = Get-ADDomainController -DomainName $domain
    Write-Host "Connected to Active Directory domain controller '$domainController' successfully."

}
catch {
    Write-Host "Failed to connect to Active Directory domain '$domain': $_"
    $connected = $false
}

if ($connected) {
    # Get the list of all users in the domain
    $users = Get-ADUser -Filter * -Properties * | Where-Object { $_.Enabled -eq $true }

    # Initialize an array to store the report data
    $reportData = @()

    foreach ($user in $users) {
        # Get the user's manager
        $manager = Get-ADUser -Identity $user.Manager -Properties Name, SamAccountName | Select-Object Name, SamAccountName

        # Get the user's last logon date
        $lastLogon = Get-ADUser -Identity $user.SamAccountName -Properties LastLogonDate | Select-Object LastLogonDate

        # Get the user's last password set date
        $lastPasswordSet = Get-ADUser -Identity $user.SamAccountName -Properties LastPasswordSet | Select-Object LastPasswordSet

        # Calculate the password age in days
        $passwordAge = (Get-Date) - $lastPasswordSet.LastPasswordSet | Format-Custom -CustomFormat 'dd'

        # Add the user data to the report data array
        $reportData += [PSCustomObject]@{
            Name            = $user.Name
            SamAccountName  = $user.SamAccountName
            ManagerName     = $manager.Name
            ManagerSamAccountName = $manager.SamAccountName
            LastLogonDate    = $lastLogon.LastLogonDate
            PasswordAgeInDays = $passwordAge
        }
        # Write-Host "Processing user: $($user.Name)"
    }

    # Sort the report data by user name
    $sortedReportData = $reportData | Sort-Object Name
    Write-Host "Report data sorted by user name."
    Write-Host $sortedReportData

    # Generate the report header

    # Export the report data to a CSV file
    $reportData | Export-Csv -Path 'alians-summary-report.csv' -NoTypeInformation
}

# Disconnect from the Active Directory domain
if ($connected) {
    Disconnect-ADDomain
}

