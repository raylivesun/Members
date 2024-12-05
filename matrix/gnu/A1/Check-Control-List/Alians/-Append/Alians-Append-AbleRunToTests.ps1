#!/home/admin/app/PowerShell/Members

# Alians local variables to the script
$aliases = @{
    'Get-ADUser' = 'Get-ADUser -Filter {Enabled -eq $true}'
    'Get-ADGroup' = 'Get-ADGroup -Filter {Enabled -eq $true}'
    'Get-ADComputer' = 'Get-ADComputer -Filter {Enabled -eq $true}'
}

# Iterate over the aliases
foreach ($alias in $aliases.Keys) {
    # Set the alias to the corresponding cmdlet
    Set-Alias -Name $alias -Value $aliases[$alias]
}

# Function to check if a user exists in a given group
function CheckUserInGroup {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName,
        [Parameter(Mandatory=$true)]
        [string]$userName
    )

    # Get the group object
    $group = Get-ADGroup -Identity $groupName
    
    # Check if the user is a member of the group
    if ($group.Members.Contains($userName)) {
        return $true
    } else {
        return $false
    }
}

# Function to check if a computer exists in a given OU
function CheckComputerInOU {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ouPath,
        [Parameter(Mandatory=$true)]
        [string]$computerName
    )

    # Get the OU object
    $ou = Get-ADOrganizationalUnit -Identity $ouPath
    
    # Check if the computer is in the OU
    if ($ou.Children.Where({ $_.GetType().Name -eq 'ADComputer' -and $_.Name -eq $computerName }).Count -gt 0) {
        return $true
    } else {
        return $false
    }
}

# Function to check if a user is a member of a given group and has a specific attribute
function CheckUserInGroupWithAttribute {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName,
        [Parameter(Mandatory=$true)]
        [string]$userName,
        [Parameter(Mandatory=$true)]
        [string]$attributeName,
        [Parameter(Mandatory=$true)]
        [string]$attributeValue
    )

    # Get the group object
    $group = Get-ADGroup -Identity $groupName
    
    # Check if the user is a member of the group
    if ($group.Members.Contains($userName)) {
        # Get the user object
        $user = Get-ADUser -Identity $userName

        # Check if the user has the specified attribute with the given value
        if ($user.$attributeName -eq $attributeValue) {
            return $true
            }
        }
        return $false
    }

    # Function to check if a user is a member of a given group and has a specific attribute
    function CheckUserInGroupWithAttribute {
        param (
            [Parameter(Mandatory=$true)]
            [string]$groupName,
            [Parameter(Mandatory=$true)]
            [string]$userName,
            [Parameter(Mandatory=$true)]
            [string]$attributeName,
            [Parameter(Mandatory=$true)]
            [string]$attributeValue
        )

        # Get the group object
        $group = Get-ADGroup -Identity $groupName
        
        # Check if the user is a member of the group
        if ($group.Members.Contains($userName)) {
            # Get the user object
            $user = Get-ADUser -Identity $userName

            # Check if the user has the specified attribute with the given value
            if ($user.$attributeName -eq $attributeValue) {
                return $true
            }
                        return $false
        }

        # Function to check if a user is a member of a given group and has a specific attribute
        function CheckUserInGroupWithAttribute {
            param (
                [Parameter(Mandatory=$true)]
                [string]$groupName,
                [Parameter(Mandatory=$true)]
                [string]$userName,
                [Parameter(Mandatory=$true)]
                [string]$attributeName,
                [Parameter(Mandatory=$true)]
                [string]$attributeValue
            )
            # Get the group object
            $group = Get-ADGroup -Identity $groupName
            
            # Check if the user is a member of the group
            if ($group.Members.Contains($userName)) {
                # Get the user object
                $user = Get-ADUser -Identity $userName

                # Check if the user has the specified attribute with the given value
                if ($user.$attributeName -eq $attributeValue) {
                    return $true
                }
                return $false
            }

            # Function to check if a user is a member of a given group and has a specific attribute
            function CheckUserInGroupWithAttribute {
                param (
                    [Parameter(Mandatory=$true)]
                    [string]$groupName,
                    [Parameter(Mandatory=$true)]
                    [string]$userName,
                    [Parameter(Mandatory=$true)]
                    [string]$attributeName,
                    [Parameter(Mandatory=$true)]
                    [string]$attributeValue
                )
                # Get the group object
                $group = Get-ADGroup -Identity $groupName
                
                # Check if the user is a member of the group
                if ($group.Members.Contains($userName)) {
                    # Get the user object
                    $user = Get-ADUser -Identity $userName

                    # Check if the user has the specified attribute with the given value
                    if ($user.$attributeName -eq $attributeValue) {
                        return $true
                    }
                    return $false
                }

                # Function to check if a user is a member of a given group and has a specific attribute
                function CheckUserInGroupWithAttribute {
                    param (
                        [Parameter(Mandatory=$true)]
                        [string]$groupName,
                        [Parameter(Mandatory=$true)]
                        [string]$userName,
                        [Parameter(Mandatory=$true)]
                        [string]$attributeName,
                        [Parameter(Mandatory=$true)]
                        [string]$attributeValue
                    )
                    # Get the group object
                    $group = Get-ADGroup -Identity $groupName
                    
                    # Check if the user is a member of the group
                    if ($group.Members.Contains($userName)) {
                        # Get the user object
                        $user = Get-ADUser -Identity $userName

                        # Check if the user has the specified attribute with the given value
                        if ($user.$attributeName -eq $attributeValue) {
                            return $true
                        }
                        return $false
                    }
                    # Function to check if a user is a member of a given group and has a specific attribute
                    function CheckUserInGroupWithAttribute {
                        param (
                            [Parameter(Mandatory=$true)]
                            [string]$groupName,
                            [Parameter(Mandatory=$true)]
                            [string]$userName,
                            [Parameter(Mandatory=$true)]
                            [string]$attributeName,
                            [Parameter(Mandatory=$true)]
                            [string]$attributeValue
                        )
                        # Get the group object
                        $group = Get-ADGroup -Identity $groupName
                        
                        # Check if the user is a member of the group
                        if ($group.Members.Contains($userName)) {
                            # Get the user object
                            $user = Get-ADUser -Identity $userName

                            # Check if the user has the specified attribute with the given value
                            if ($user.$attributeName -eq $attributeValue) {
                                return $true
                            }
                            return $false
                        }
                        # Function to check if a user is a member of a given group and has a specific attribute
                        function CheckUserInGroupWithAttribute {
                            param (
                                [Parameter(Mandatory=$true)]
                                [string]$groupName,
                                [Parameter(Mandatory=$true)]
                                [string]$userName,
                                [Parameter(Mandatory=$true)]
                                [string]$attributeName,
                                [Parameter(Mandatory=$true)]
                                [string]$attributeValue
                            )
                            # Get the group object
                            $group = Get-ADGroup -Identity $groupName
                            
                            # Check if the user is a member of the group
                            if ($group.Members.Contains($userName)) {
                                # Get the user object
                                $user = Get-ADUser -Identity $userName

                                # Check if the user has the specified attribute with the given value
                                if ($user.$attributeName -eq $attributeValue) {
                                    return $true
                                }
                                return $false
                            }
                            # Function to check if a user is a member of a given group and has a specific attribute
                            function CheckUserInGroupWithAttribute {
                                param (
                                    [Parameter(Mandatory=$true)]
                                    [string]$groupName,
                                    [Parameter(Mandatory=$true)]
                                    [string]$userName,
                                    [Parameter(Mandatory=$true)]
                                    [string]$attributeName,
                                    [Parameter(Mandatory=$true)]
                                    [string]$attributeValue
                                )
                                # Get the group object
                                $group = Get-ADGroup -Identity $groupName
                                
                                # Check if the user is a member of the group
                                if ($group.Members.Contains($userName)) {
                                    # Get the user object
                                    $user = Get-ADUser -Identity $userName

                                    # Check if the user has the specified attribute with the given value
                                    if ($user.$attributeName -eq $attributeValue) {


                                         return $true
                                    }
                                    return $false
                                }

                            }
                            return $false
                        }
                    }
                    return $false
                }
                        return $false
        }
        return $false
}

# Test the function with sample inputs
$groupName = "TestGroup"
$userName = "TestUser"
$attributeName = "Department"
$attributeValue = "IT"

if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
    Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
    } else {
    Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
    }

    # Test the function with a different attribute
    $attributeName = "Title"
    $attributeValue = "Manager"

    if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
        Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
        } else {
        Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
        }

        # Test the function with a different user
        $userName = "TestUser2"
        if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
            Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
            } else {
                Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
            }
            # Test the function with a different group
            $groupName = "TestGroup2"
            if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                } else {
                    Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                }
                # Test the function with a non-existent group
                $groupName = "NonExistentGroup"
                if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                    Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                    } else {
                        Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                    }
                    # Test the function with a non-existent user
                    $userName = "NonExistentUser"
                    if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                        Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                        } else {
                            Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                        }
                        # Test the function with a non-existent attribute
                        $attributeName = "NonExistentAttribute"
                        if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                            Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                            } else {
                                Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                            }
                            # Test the function with a non-existent value for the specified attribute
                            $attributeValue = "NonExistentAttributeValue"
                            if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                                Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                                } else {
                                    Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                                }
                                # Test the function with a null attribute name
                                $attributeName = $null
                                if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                                    Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                                    } else {
                                        Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                                    }
                                    # Test the function with a null user name
                                    $userName = $null
                                    if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                                        Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                                        } else {
                                            Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                                        }
                                        # Test the function with a null group name
                                        $groupName = $null
                                        if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                                            Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                                            } else {
                                                Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                                            }
                                            # Test the function with a null attribute value
                                            $attributeValue = $null
                                            if (Check-UserInGroupWithAttribute -groupName $groupName -userName $userName -attributeName $attributeName -attributeValue $attributeValue) {
                                                Write-Host "The user is a member of the group '$groupName' and has the attribute '$attributeName' with the value '$attributeValue'"
                                                } else {
                                                    Write-Host "The user is not a member of the group '$groupName' or does not have the attribute '$attributeName' with the value '$attributeValue'"
                                                }
                                            }      
