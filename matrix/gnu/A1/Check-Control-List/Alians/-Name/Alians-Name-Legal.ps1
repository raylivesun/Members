#!/home/admin/app/PowerShell/Members

# Alians Name to Group Mapping (update as needed) Legal Policies Group is the primary group for all legal policies
$aliansToGroups = @{
    'Alice'    = 'Legal Policies Group'
    'Bob'      = 'Legal Policies Group'
    'Charlie'  = 'Legal Policies Group'
    'David'    = 'Legal Policies Group'
    'Eve'      = 'Legal Policies Group'
}

# Get the list of Active Directory users
$adUsers = Get-ADUser -Filter * -Properties SamAccountName,Enabled,MemberOf

# Loop through each AD user
foreach ($user in $adUsers) {
    # Check if the user is enabled and a member of the Legal Policies Group
    if ($user.Enabled -eq $true -and $user.MemberOf -contains $aliansToGroups['Legal Policies Group']) {
        # Update the user's primary group
        $primaryGroup = $aliansToGroups[$user.SamAccountName]
        Set-ADUser -Identity $user.SamAccountName -PrimaryGroup $primaryGroup
    }
    else {
        Write-Host "User $($user.SamAccountName) is not enabled or not a member of the Legal Policies Group"
    }
}


# Get the list of Active Directory groups
$adGroups = Get-ADGroup -Filter * -Properties Name,Members

# Loop through each AD group
foreach ($group in $adGroups) {
    # Check if the group is a member of the Legal Policies Group
    if ($group.Members -contains $aliansToGroups['Legal Policies Group']) {
        # Update the group's description
        $newDescription = "Updated description for group $($group.Name)"
        Set-ADGroup -Identity $group.Name -Description $newDescription
        Write-Host "Description updated for group $($group.Name)"
    }
    else {
        Write-Host "Group $($group.Name) is not a member of the Legal Policies Group"
    }
}


# Get the list of Active Directory computers
$adComputers = Get-ADComputer -Filter * -Properties Name,OperatingSystem

# Loop through each AD computer
foreach ($computer in $adComputers) {
    # Check if the computer's operating system is Windows
    if ($computer.OperatingSystem -like '*Windows*') {
        # Update the computer's description
        $newDescription = "Updated description for computer $($computer.Name)"
        Set-ADComputer -Identity $computer.Name -Description $newDescription
        Write-Host "Description updated for computer $($computer.Name)"
    }
    else {
        Write-Host "Computer $($computer.Name) is not a Windows machine"
    }
}


# Get the list of Active Directory services
$adServices = Get-ADService -Filter * -Properties Name,OperatingSystem

# Loop through each AD service
foreach ($service in $adServices) {
    # Check if the service's operating system is Windows
    if ($service.OperatingSystem -like '*Windows*') {
        # Update the service's description
        $newDescription = "Updated description for service $($service.Name)"
        Set-ADService -Identity $service.Name -Description $newDescription
        Write-Host "Description updated for service $($service.Name)"
    }
    else {
        Write-Host "Service $($service.Name) is not a Windows machine"
    }
}


# Get the list of Active Directory containers
$adContainers = Get-ADContainer -Filter * -Properties Name,Description

# Loop through each AD container
foreach ($container in $adContainers) {
    # Update the container's description
    $newDescription = "Updated description for container $($container.Name)"
    Set-ADContainer -Identity $container.Name -Description $newDescription
    Write-Host "Description updated for container $($container.Name)"
}


# Get the list of Active Directory trust relationships
$adTrustRelationships = Get-ADTrustRelationship -Filter *

# Loop through each AD trust relationship
foreach ($trustRelationship in $adTrustRelationships) {
    # Update the trust relationship's description
    $newDescription = "Updated description for trust relationship $($trustRelationship.Name)"
    Set-ADTrustRelationship -Identity $trustRelationship.Name -Description $newDescription
    Write-Host "Description updated for trust relationship $($trustRelationship.Name)"
}


# Get the list of Active Directory forest trust relationships
$adForestTrustRelationships = Get-ADForestTrustRelationship -Filter *

# Loop through each AD forest trust relationship
foreach ($forestTrustRelationship in $adForestTrustRelationships) {
    # Update the forest trust relationship's description
    $newDescription = "Updated description for forest trust relationship $($forestTrustRelationship.Name)"
    Set-ADForestTrustRelationship -Identity $forestTrustRelationship.Name -Description $newDescription
    Write-Host "Description updated for forest trust relationship $($forestTrustRelationship.Name)"
}


# Get the list of Active Directory domain trust relationships
$adDomainTrustRelationships = Get-ADDomainTrustRelationship -Filter *

# Loop through each AD domain trust relationship
foreach ($domainTrustRelationship in $adDomainTrustRelationships) {
    # Update the domain trust relationship's description
    $newDescription = "Updated description for domain trust relationship $($domainTrustRelationship.Name)"
    Set-ADDomainTrustRelationship -Identity $domainTrustRelationship.Name -Description $newDescription
    Write-Host "Description updated for domain trust relationship $($domainTrustRelationship.Name)"
}


# Get the list of Active Directory organizational units
$adOrganizationalUnits = Get-ADOrganizationalUnit -Filter * -Properties Name,Description

# Loop through each AD organizational unit
foreach ($organizationalUnit in $adOrganizationalUnits) {
    # Update the organizational unit's description
    $newDescription = "Updated description for organizational unit $($organizationalUnit.Name)"
    Set-ADOrganizationalUnit -Identity $organizationalUnit.Name -Description $newDescription
    Write-Host "Description updated for organizational unit $($organizationalUnit.Name)"
}


# Get the list of Active Directory security groups
$adSecurityGroups = Get-ADSecurityGroup -Filter * -Properties Name,Description

# Loop through each AD security group
foreach ($securityGroup in $adSecurityGroups) {
    # Update the security group's description
    $newDescription = "Updated description for security group $($securityGroup.Name)"
    Set-ADSecurityGroup -Identity $securityGroup.Name -Description $newDescription
    Write-Host "Description updated for security group $($securityGroup.Name)"
}


# Get the list of Active Directory user accounts
$adUserAccounts = Get-ADUserAccount -Filter * -Properties Name,Description

# Loop through each AD user account
foreach ($userAccount in $adUserAccounts) {
    # Update the user account's description
    $newDescription = "Updated description for user account $($userAccount.Name)"
    Set-ADUserAccount -Identity $userAccount.Name -Description $newDescription
    Write-Host "Description updated for user account $($userAccount.Name)"
}


# Get the list of Active Directory administrative templates
$adAdministrativeTemplates = Get-ADAdministrativeTemplate -Filter * -Properties Name,Description

# Loop through each AD administrative template
foreach ($administrativeTemplate in $adAdministrativeTemplates) {
    # Update the administrative template's description
    $newDescription = "Updated description for administrative template $($administrativeTemplate.Name)"
    Set-ADAdministrativeTemplate -Identity $administrativeTemplate.Name -Description $newDescription
    Write-Host "Description updated for administrative template $($administrativeTemplate.Name)"
}


# Get the list of Active Directory group policies
$adGroupPolicies = Get-ADGroupPolicy -Filter * -Properties Name,Description

# Loop through each AD group policy
foreach ($groupPolicy in $adGroupPolicies) {
    # Update the group policy's description
    $newDescription = "Updated description for group policy $($groupPolicy.Name)"
    Set-ADGroupPolicy -Identity $groupPolicy.Name -Description $newDescription
    Write-Host "Description updated for group policy $($groupPolicy.Name)"
}


# Get the list of Active Directory user policies
$adUserPolicies = Get-ADUserPolicy -Filter * -Properties Name,Description

# Loop through each AD user policy
foreach ($userPolicy in $adUserPolicies) {
    # Update the user policy's description
    $newDescription = "Updated description for user policy $($userPolicy.Name)"
    Set-ADUserPolicy -Identity $userPolicy.Name -Description $newDescription
    Write-Host "Description updated for user policy $($userPolicy.Name)"
}


# Get the list of Active Directory organizational unit policies
$adOrganizationalUnitPolicies = Get-ADOrganizationalUnitPolicy -Filter * -Properties Name,Description

# Loop through each AD organizational unit policy
foreach ($organizationalUnitPolicy in $adOrganizationalUnitPolicies) {
    # Update the organizational unit policy's description
    $newDescription = "Updated description for organizational unit policy $($organizationalUnitPolicy.Name)"
    Set-ADOrganizationalUnitPolicy -Identity $organizationalUnitPolicy.Name -Description $newDescription
    Write-Host "Description updated for organizational unit policy $($organizationalUnitPolicy.Name)"
}


# Get the list of Active Directory security group policies
$adSecurityGroupPolicies = Get-ADSecurityGroupPolicy -Filter * -Properties Name,Description

# Loop through each AD security group policy
foreach ($securityGroupPolicy in $adSecurityGroupPolicies) {
    # Update the security group policy's description
    $newDescription = "Updated description for security group policy $($securityGroupPolicy.Name)"
    Set-ADSecurityGroupPolicy -Identity $securityGroupPolicy.Name -Description $newDescription
    Write-Host "Description updated for security group policy $($securityGroupPolicy.Name)"
}


# Get the list of Active Directory user rights assignments
$adUserRightsAssignments = Get-ADUserRightAssignment -Filter * -Properties Name,Description

# Loop through each AD user rights assignment
foreach ($userRightsAssignment in $adUserRightsAssignments) {
    # Update the user rights assignment's description
    $newDescription = "Updated description for user rights assignment $($userRightsAssignment.Name)"
    Set-ADUserRightAssignment -Identity $userRightsAssignment.Name -Description $newDescription
    Write-Host "Description updated for user rights assignment $($userRightsAssignment.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description

    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}


# Get the list of Active Directory group memberships
$adGroupMemberships = Get-ADGroupMember -Filter * -Properties Name,Description

# Loop through each AD group membership
foreach ($groupMembership in $adGroupMemberships) {
    # Update the group membership's description
    $newDescription = "Updated description for group membership $($groupMembership.Name)"
    Set-ADGroupMember -Identity $groupMembership.Name -Description $newDescription
    Write-Host "Description updated for group membership $($groupMembership.Name)"
}


# Get the list of Active Directory user memberships
$adUserMemberships = Get-ADUserMember -Filter * -Properties Name,Description

# Loop through each AD user membership
foreach ($userMembership in $adUserMemberships) {
    # Update the user membership's description
    $newDescription = "Updated description for user membership $($userMembership.Name)"
    Set-ADUserMember -Identity $userMembership.Name -Description $newDescription
    Write-Host "Description updated for user membership $($userMembership.Name)"
}




