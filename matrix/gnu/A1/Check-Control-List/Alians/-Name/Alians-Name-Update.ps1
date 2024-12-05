#!/home/admin/app/PowerShell/Members

# Alians Name to Module Name Mapping (Optional) Update as needed
$aliases = @{
    'Get-ADUser' = 'ActiveDirectoryUser'
    'Get-ADGroup' = 'ActiveDirectoryGroup'
    'Get-ADComputer' = 'ActiveDirectoryComputer'
    'Get-ADService' = 'ActiveDirectoryService'
    'Get-ADTrust' = 'ActiveDirectoryTrust'
    'Get-ADPrincipalGroupMembership' = 'ActiveDirectoryPrincipalGroupMembership'
    'Get-ADUserProperty' = 'ActiveDirectoryUserProperty'
    'Get-ADGroupProperty' = 'ActiveDirectoryGroupProperty'
    'Get-ADComputerProperty' = 'ActiveDirectoryComputerProperty'
    'Get-ADServiceProperty' = 'ActiveDirectoryServiceProperty'
    'Get-ADTrustProperty' = 'ActiveDirectoryTrustProperty'
    'Get-ADPrincipalGroupMembershipProperty' = 'ActiveDirectoryPrincipalGroupMembershipProperty'
}

# Get script arguments
$arguments = $args | Where-Object { $_ -ne '' }

# Check if module name is provided
if ($arguments.Count -eq 0) {
    Write-Host "Usage: $MyInvocation.ScriptName <module_name> <property_name> [<filter_value>]"
    exit 1
}

$moduleName = $arguments[0]
$propertyName = $arguments[1]
$filterValue = $arguments[2]

# Check if module name is valid
if ($aliases.ContainsKey($moduleName)) {
    $moduleName = $aliases[$moduleName]
}

try {
    # Import the module
    Import-Module ActiveDirectory

    # Get the property value(s)
    if ($filterValue) {
        $propertyValue = Get-ADObject -Filter "{$propertyName -eq '$filterValue'}" -Properties $propertyName
        Write-Output $propertyValue
        exit 0

        # If a filter value is not provided, retrieve all property values
        } else {
            $propertyValues = Get-ADObject -Properties $propertyName
            Write-Output $propertyValues
            exit 0
        }

} catch {
    Write-Error "An error occurred while retrieving the property value(s): $_"
}

