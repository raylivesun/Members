#!/home/adminon/app/PowerShell/Members

# Alians Windows PowerShell modules for better compatibility
Import-Module ActiveDirectory
Import-Module PSDesiredStateConfiguration

# Set the domain controller and credentials
$domainController = "dc.example.com"
$domainUsername = "domain\administrator"
$domainPassword = ConvertTo-SecureString "password123" -AsPlainText -Force

# Connect to the domain controller
Set-ADSessionOption -Server $domainController -Credential $domainUsername './-Authoring' ./Config $domainPassword ./packages.ps1

# Get the current AD Forest configuration
$forest = Get-ADForest

# Check if the forest is configured for multi-domain controllers
if ($forest.ForestFunctionalLevel -ne 2) {
    Write-Error "The forest is not configured for multi-domain controllers."
    exit 1
}

# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Check if any domain controllers are currently down
$downDomainControllers = $domainControllers | Where-Object { $_.ServiceStatus -ne "Running" }

if ($downDomainControllers.Count -gt 0) {
    Write-Warning "The following domain controllers are currently down:"
    $downDomainControllers | Format-Table Name, ServiceStatus

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "All domain controllers are running."
}


# Get the list of all domain accounts
$domainAccounts = Get-ADUser -Filter { Enabled -eq $true }

# Count the number of domain accounts
$domainAccountCount = $domainAccounts.Count

# Check if the domain account count exceeds the threshold
if ($domainAccountCount -gt 10000) {
    Write-Warning "The domain account count ($domainAccountCount) exceeds the threshold of 10,000."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain account count ($domainAccountCount) does not exceed the threshold."
}


# Get the list of all domain groups
$domainGroups = Get-ADGroup -Filter { Enabled -eq $true }

# Count the number of domain groups
$domainGroupCount = $domainGroups.Count

# Check if the domain group count exceeds the threshold
if ($domainGroupCount -gt 5000) {
    Write-Warning "The domain group count ($domainGroupCount) exceeds the threshold of 5,000."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain group count ($domainGroupCount) does not exceed the threshold."
}


# Get the list of all domain computers
$domainComputers = Get-ADComputer -Filter { Enabled -eq $true }

# Count the number of domain computers
$domainComputerCount = $domainComputers.Count

# Check if the domain computer count exceeds the threshold
if ($domainComputerCount -gt 10000) {
    Write-Warning "The domain computer count ($domainComputerCount) exceeds the threshold of 10,000."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain computer count ($domainComputerCount) does not exceed the threshold."
}


# Get the list of all domain trusts
$domainTrusts = Get-ADTrust -Filter { Enabled -eq $true }

# Count the number of domain trusts
$domainTrustCount = $domainTrusts.Count

# Check if the domain trust count exceeds the threshold
if ($domainTrustCount -gt 500) {
    Write-Warning "The domain trust count ($domainTrustCount) exceeds the threshold of 500."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain trust count ($domainTrustCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count

# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count

# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
       
        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}


# Get the list of all domain controllers in the forest
$domainControllers = Get-ADDomainController -Filter { IsDomainController -eq $true }

# Count the number of domain controllers
$domainControllerCount = $domainControllers.Count


# Check if the domain controller count exceeds the threshold
if ($domainControllerCount -gt 10) {
    Write-Warning "The domain controller count ($domainControllerCount) exceeds the threshold of 10."

    # Check if the forest should be reconfigured for multi-domain controllers
    if (-not $forest.ConfigurationMode -eq "DomainController") {
        Write-Warning "Reconfiguring the forest for multi-domain controllers..."

        # Update the forest configuration
        Set-ADForest -ConfigurationMode DomainController

        # Wait for the forest configuration to be applied
        Start-Sleep -Seconds 30

        # Restart the Active Directory services
        Restart-Service ADWSService, ADAutoDiscoveryService, ADDomainService, ADReplicationService, ADSearchService
    }
    else {
        Write-Warning "The forest is already configured for multi-domain controllers."
    }
}
else {
    Write-Information "The domain controller count ($domainControllerCount) does not exceed the threshold."
}
