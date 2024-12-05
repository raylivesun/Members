#!/home/admin/app/PowerShell/Members

# Alians Update script for Windows Server 2012 and 2016 (PowerShell 5.1)

# Importing required modules
Import-Module ActiveDirectory
Import-Module WebAdministration

# Define the domain and OU where the aliases will be created
$domain = 'example.com'
$ouPath = 'OU=Aliases,DC=example,DC=com'

# Define the aliases to be created
$aliases = @()
$aliases += @{ Name = 'alias1'; Target = 'www.example1.com' }
$aliases += @{ Name = 'alias2'; Target = 'www.example2.com' }
$aliases += @{ Name = 'alias3'; Target = 'www.example3.com' }

# Connect to the domain
Connect-ADDomain -DomainName $domain -Credential (Get-Credential)

# Check if the OU exists, if not, create it
if (!(Test-ADObject -Path $ouPath -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Path $ouPath -Name Aliases
}

# Create the aliases in the specified OU
foreach ($alias in $aliases) {
    $adAlias = New-ADAlias -Name $alias.Name -Target $alias.Target -Path $ouPath
    Write-Host "Created alias $($adAlias.Name) pointing to $($adAlias.Target)"
}

# Enable the DNS update service on the domain controller
Set-ADDomainController -Identity (Get-ADDomainController -DomainName $domain) -EnableDNSUpdateService $true

# Restart the DNS service
Restart-Service DNS

Write-Host "Aliases update completed successfully."
