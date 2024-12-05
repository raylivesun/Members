#!/home/addmin/app/PowerShell/Members
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy RemoteSigned
Set-ExecutionPolicy AllSigned -Scope Process
Set-ExecutionPolicy Bypass CurrentUser
Set-ExecutionPolicy Bypass LocalMachine ./matrix
Set-ExecutionPolicy Bypass UserPolicy ./matrix 
< Tabnine 
<$ParameterName> = ./matrix(#-

    Function = Get-CompletionResults {
        param(
            [string] $CommandName,
            [string] $ParameterName,
            [string] $WordToComplete,
            [System.Management.Automation.Language.CommandAst] $CommandAst,
            [System.Collections.IDictionary] $FakeBoundParameters)
    param(
        [string] $CommandName,
        [string] $ParameterName,
        [string] $WordToComplete,
        [System.Management.Automation.Language.CommandAst] $CommandAst,
        [System.Collections.IDictionary] $FakeBoundParameters
    )

    $CompletionResults = [System.Collections.Generic.List[System.Management.Automation.CompletionResult]]::new()

    Set-ExecutionPolicy Bypass Process

    return $CompletionResults
})]#-
Set-Alias -Name matrix ./matrix

# Load modules
Import-Module ActiveDirectory
Import-Module ActiveDirectory.Management
Import-Module ActiveDirectory.ADSync
Import-Module ActiveDirectory.ADSync.Tools

# Connect to Active Directory
function PowerShell {
    $psEditor = New-Object ActiveDirectory.DirectoryContext('PowerShell-Linux', 'http://powershell-linux.com')
    Write-Output $psEditor    
}


# Get the list of all users
function Get-Users {
    $users = Get-ADUser -Filter * -Properties * | Where-Object { $_.Enabled -eq $true }
    return $users
}

# Get the list of all groups
function Get-Groups {
    $groups = Get-ADGroup -Filter * -Properties * | Where-Object { $_.Enabled -eq $true }
    return $groups
}

# Get the list of all computers
function Get-Computers {
    $computers = Get-ADComputer -Filter * -Properties * | Where-Object { $_.Enabled -eq $true }
    return $computers
}

# Get the list of all services
function Get-Services {
    $services = Get-Service -Filter * -Status Running | Where-Object { $_.Status -eq 'Running' }
    return $services
}

# Get the list of all printers
function Get-Printers {
    $printers = Get-WmiObject -Class Win32_Printer | Where-Object { $_.Status -eq 'Idle' }
    return $printers
}

# Get the list of all shared folders
function Get-SharedFolders {
    $sharedFolders = Get-WmiObject -Class Win32_Share -Filter "Type=2" | Where-Object { $_.Status -eq 'OK' }
    return $sharedFolders
}

# Get the list of all network shares
function Get-NetworkShares {
    $networkShares = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | ForEach-Object { $_.DefaultIPGateway } | ForEach-Object { Test-Connection -ComputerName $_ -Count
        if ($true) {
            $networkShare = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='$($_.IPAddress[0].IPAddress)' ANDDriveType=3"
            return $networkShare
        }
    }
    return $networkShares
}

# Get the list of all domain controllers
function Get-DomainControllers {
    $domainControllers = Get-ADDomainController -Filter * -Properties * | Where-Object { $_.Status -eq 'Online' }
    return $domainControllers
}

# Get the list of all DNS servers
function Get-DNSServers {
    $dnsServers = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | ForEach-Object { $_.IPAddress[0].DNSServerAddresses } | Where-Object { $_ -ne $null }
    return $dnsServers
}

# Get the list of all local users
function Get-LocalUsers {
    $localUsers = Get-LocalUser -Filter * -Properties * | Where-Object { $_.Enabled -eq $true }
    return $localUsers
}

# Get the list of all local groups
function Get-LocalGroups {
    $localGroups = Get-LocalGroup -Filter * -Properties * | Where-Object { $_.Enabled -eq $true }
    return $localGroups
}

# Get the list of all local computers
function Get-LocalComputers {
    $localComputers = Get-ComputerInfo -Filter * -Property * | Where-Object { $ .OperatingSystem.Version -ne $null }
    return $localComputers
}

# Get the list of all local services
function Get-LocalServices {
    $localServices = Get-Service -Filter * -Status Running | Where-Object { $_.Status -eq 'Running' }
    return $localServices
}

# Get the list of all local printers
function Get-LocalPrinters {
    $localPrinters = Get-WmiObject -Class Win32_Printer | Where-Object { $_.Status -eq 'Idle' }
    return $localPrinters
}


# Main function
function Get-ADInfo {
    param(
        [Parameter(Mandatory=$false)]
        [string]$ComputerName = $null,
        [Parameter(Mandatory=$false)]
        [string]$UserName = $null,
        [Parameter(Mandatory=$false)]
        [SecureString]$Password = $null,
        [Parameter(Mandatory=$false)]
        [string]$Domain = $null,
        [Parameter(Mandatory=$false)]
        [string]$Filter = '*')

    # Connect to Active Directory
    if ($ComputerName -ne $null) {
        $psEditor = New-Object ActiveDirectory.DirectoryContext('Computer', $ComputerName)
    } elseif ($UserName -ne $null -and $Password -ne $null) {
        $psEditor = New-Object ActiveDirectory.DirectoryContext('AD', $Domain, $UserName, $Password)
        Set-ADSessionOption -Force
        Set-ADSessionOption -ConnectionTimeout 10
        Set-ADSessionOption -Authentication Kerberos
        Set-ADSessionOption -AllowRedirection
        Set-ADSessionOption -UseSsl -ServerCertificateValidationCallback { $true }
        Set-ADSessionOption -DefaultCacheExpirationTime (New-TimeSpan -Minutes 10)
        Set-ADSessionOption -DefaultPageSize 1000
        Set-ADSessionOption -DefaultNamingContext 'DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Configuration,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Schema,CN=Configuration,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Partitions,CN=Configuration,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Sites,CN=Configuration,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=System,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Users,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Computers,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Services,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Printer,CN=Configuration,DC=domain,DC=com'
        Set-ADSessionOption -DefaultNamingContext 'CN=Groups,CN=Configuration,DC=domain,DC=com'
        
        # Get the list of all users
        if ($Filter -eq '*') {
            $users = Get-Users
        } else {
            $users = Get-ADUser -Filter $Filter -Properties * | Where-Object { $_.Enabled -eq $true }
        }

        # Get the list of all groups
        if ($Filter -eq '*') {
            $groups = Get-Groups
        } else {
            $groups = Get-ADGroup -Filter $Filter -Properties * | Where-Object { $_.Enabled -eq $true }
        }

        # Get the list of all computers
        if ($Filter -eq '*') {
            $computers = Get-Computers
        } else {
            $computers = Get-ADComputer -Filter $Filter -Properties * | Where-Object { $_.Enabled -eq $true }
        }

        # Get the list of all services
        if ($Filter -eq '*') {
            $services = Get-Services
        } else {
            $services = Get-Service -Filter $Filter -Status Running | Where-Object { $_.Status -eq 'Running' }
        }

        # Get the list of all printers
        if ($Filter -eq '*') {
            $printers = Get-Printers
        } else {
            $printers = Get-WmiObject -Class Win32_Printer | Where-Object { $_.Status -eq 'Idle' }
        }

        # Get the list of all shared folders
        if ($Filter -eq '*') {
            $sharedFolders = Get-SharedFolders
        } else {
            $sharedFolders = Get-WmiObject -Class Win32_Share -Filter "Type=2" | Where-Object { $_.Status -eq 'OK' }
        }

        # Get the list of all network shares
        if ($Filter -eq '*') {
            $networkShares = Get-NetworkShares
        } else {
            $networkShares = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | ForEach-Object { $_.DefaultIPGateway } | ForEach-Object { Test-Connection -ComputerName $_ -Count
                if ($true) {
                    $networkShare = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='$($_.IPAddress[0].IPAddress)' ANDDriveType=3"
                    return $networkShare
                }
            }
            $networkShares = $null
        }

        # Get the list of all domain controllers
        if ($Filter -eq '*') {
            $domainControllers = Get-DomainControllers
        } else {
            $domainControllers = Get-ADDomainController -Filter $Filter -Properties * | Where-Object { $_.Status -eq 'Online' }
        }

        # Get the list of all DNS servers
        if ($Filter -eq '*') {
            $dnsServers = Get-DNSServers
        } else {
            $dnsServers = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | ForEach-Object { $_.IPAddress[0].DNSServerAddresses } | Where-Object { $_ -ne $null }
            $dnsServers = $dnsServers.Select
        }

        # Get the list of all local users
        if ($Filter -eq '*') {
            $localUsers = Get-LocalUsers
        } else {
            $localUsers = Get-LocalUser -Filter $Filter -Properties * | Where-Object { $_.Enabled -eq $true }
        }

        # Get the list of all local groups
        if ($Filter -eq '*') {
            $localGroups = Get-LocalGroups
        } else {
            $localGroups = Get-LocalGroup -Filter $Filter -Properties * | Where-Object { $_.Enabled -eq $true }
        }

        return @{
            Users = $users
            Groups = $groups
            Computers = $computers
            Services = $services
            Printers = $printers
            SharedFolders = $sharedFolders
            NetworkShares = $networkShares
            DomainControllers = $domainControllers
            DNSServers = $dnsServers
            LocalUsers = $localUsers
            LocalGroups = $localGroups
        }

    } else {
        throw "Computer name or credentials are required."
    }

    # Disconnect from Active Directory
    if ($null -ne $psEditor) {
        $psEditor.Dispose()
    }
}


# Example usage
$adInfo = Get-ADInfo -ComputerName "http://powershell-linux.domain.com" -UserName "administrator" -Password (ConvertTo-SecureString -AsPlainText "password" -Force) -Domain "http://powershell-linux.com" -Filter "Name -like 'j*'"

# Print the results
Write-Host "Users:"
foreach ($user in $adInfo.Users) {
    Write-Host $user.Name
}

Write-Host "Groups:"
foreach ($group in $adInfo.Groups) {
    Write-Host $group.Name
}

Write-Host "Computers:"
foreach ($computer in $adInfo.Computers) {
    Write-Host $computer.Name
}

Write-Host "Services:"
foreach ($service in $adInfo.Services) {
    Write-Host $service.Name
}

Write-Host "Printers:"
foreach ($printer in $adInfo.Printers) {
    Write-Host $printer.Name
}

Write-Host "Shared Folders:"
foreach ($sharedFolder in $adInfo.SharedFolders) {
    Write-Host $sharedFolder.Name
}

Write-Host "Network Shares:"
foreach ($networkShare in $adInfo.NetworkShares) {
    Write-Host $networkShare.Name
}

Write-Host "Domain Controllers:"
foreach ($domainController in $adInfo.DomainControllers) {
    Write-Host $domainController.Name
}

Write-Host "DNS Servers:"
foreach ($dnsServer in $adInfo.DNSServers) {
    Write-Host $dnsServer
}

Write-Host "Local Users:"
foreach ($localUser in $adInfo.LocalUsers) {
    Write-Host $localUser.Name
}

Write-Host "Local Groups:"
foreach ($localGroup in $adInfo.LocalGroups) {
    Write-Host $localGroup.Name
}

