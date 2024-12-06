#!/home/admin/app/PowerShell/Members

# Get PapKey for current user from the registry key
$PapKey = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name '*Microsoft*' | Where-Object { $_.Name -match 'PapKey' }).Name

# Check if PapKey is found
if ($PapKey) {
    # Extract the PapKey value
    $PapKeyValue = $PapKey.Substring($PapKey.LastIndexOf('.') + 1)

    # Get the list of installed applications
    $installedApps = Get-Process | Where-Object { $_.Modules.Name -like '*app*' }

    # Iterate through the installed applications
    foreach ($app in $installedApps) {
        # Get the full path of the application executable
        $appPath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers\$($PapKeyValue)\$($app.Id)" -Name 'ExePath').ExePath

        # Check if the application executable exists
        if (Test-Path -Path $appPath) {
            # Get the application name and version
            $appName = (Get-ItemProperty -Path $appPath -ErrorAction SilentlyContinue).ProductName
            $appVersion = (Get-ItemProperty -Path $appPath -ErrorAction SilentlyContinue).Version

            # Output the application information
            Write-Host "Application: $appName"
            Write-Host "Version: $appVersion"
            Write-Host "Path: $appPath"
            Write-Host ""
        }
        else {
            Write-Host "Application not found: $($app.Id)"
            Write-Host ""
        }
    }
    Write-Host "PapKey found: $PapKeyValue"
}

function Get-ADGroupMember {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    $group = Get-ADGroup -Identity $groupName

    if ($group) {
        $members = $group.Members.Where({ $_.objectClass -eq 'user' })
        return $members
    }
    else {
        Write-Host "Group not found: $groupName"
        return $null
    }
    else {
        Write-Host "Error retrieving group members"
        return $null
    }

}


# Get members of the "Administrators" group
$administrators = Get-ADGroupMember "Administrators"

# Output the administrator names
foreach ($admin in $administrators) {
    Write-Host "Administrator: $($admin.Name)"
}

function Get-ADDefaultDomainPasswordPolicy {

    $domain = Get-ADDomain

    if ($domain) {
        $policy = Get-ADDefaultDomainPasswordPolicy -Identity $domain.Name
        if ($policy) {
            Write-Host "Default domain password policy: $($policy.Name)"
            Write-Host "Minimum password length: $($policy.MinLength)"
            Write-Host "Require password change: $($policy.RequirePasswordChange)"
            Write-Host "Require password history: $($policy.RequirePasswordHistory)"
            Write-Host "Password history length: $($policy.PasswordHistoryLength)"
            Write-Host "Password complex requirements: $($policy.PasswordComplex)"
            Write-Host "Disallow password reuse: $($policy.DisallowPasswordReuse)"
            Write-Host "Password expiration warning period: $($policy.PasswordExpirationWarningPeriod)"
            Write-Host "Account lockout threshold: $($policy.AccountLockoutThreshold)"
            Write-Host "Account lockout duration: $($policy.AccountLockoutDuration)"
            Write-Host "Lockout observation window: $($policy.LockoutObservationWindow)"
            Write-Host "Max password age: $($policy.MaxPasswordAge)"
            Write-Host "Min password age: $($policy.MinPasswordAge)"
            Write-Host "Password history enforcement: $($policy.PasswordHistoryEnforcement)"
            Write-Host "Clear text password storage: $($policy.ClearTextPasswordStorage)"
            Write-Host "Clear text password expiration policy: $($policy.ClearTextPasswordExpirationPolicy)"
            Write-Host "Clear text password history: $($policy.ClearTextPasswordHistory)"
            Write-Host "Clear text password history duration: $($policy.ClearTextPasswordHistoryDuration)"
        
            # Check if the domain has a custom password policy
            if ($policy.CustomPasswordPolicy) {
                $customPolicy = Get-ADCustomPasswordPolicy -Identity $policy.CustomPasswordPolicy
                Write-Host "Custom password policy: $($customPolicy.Name)"
                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
                # Check if the custom policy has any password rules
                if ($customPolicy.PasswordRules) {
                    foreach ($rule in $customPolicy.PasswordRules) {
                        Write-Host "Password rule: $($rule.Name)"
                        Write-Host "Regex pattern: $($rule.RegexPattern)"
                    

                    }
                }
                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
                # Check if the custom policy has any password rules
                if ($customPolicy.PasswordRules) {
                    foreach ($rule in $customPolicy.PasswordRules) {
                        Write-Host "Password rule: $($rule.Name)"
                        Write-Host "Regex pattern: $($rule.RegexPattern)"
                    

                    }
                }

                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
                # Check if the custom policy has any password rules
                if ($customPolicy.PasswordRules) {
                    foreach ($rule in $customPolicy.PasswordRules) {
                        Write-Host "Password rule: $($rule.Name)"
                        Write-Host "Regex pattern: $($rule.RegexPattern)"
                    

                    

                    }
                }
            }
            Write-Host ""
        
            # Check if the domain has a custom password policy
            if ($policy.CustomPasswordPolicy) {
                $customPolicy = Get-ADCustomPasswordPolicy -Identity $policy.CustomPasswordPolicy
                Write-Host "Custom password policy: $($customPolicy.Name)"
                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
                # Check if the custom policy has any password rules
                if ($customPolicy.PasswordRules) {
                    foreach ($rule in $customPolicy.PasswordRules) {
                        Write-Host "Password rule: $($rule.Name)"
                        Write-Host "Regex pattern: $($rule.RegexPattern)"
                    

                    


                    }
                }
                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
                # Check if the custom policy has any password rules
                if ($customPolicy.PasswordRules) {
                    foreach ($rule in $customPolicy.PasswordRules) {
                        Write-Host "Password rule: $($rule.Name)"
                        Write-Host "Regex pattern: $($rule.RegexPattern)"
                    

                    

                    


                    }
                }
                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
                # Check if the custom policy has any password rules
                if ($customPolicy.PasswordRules) {
                    foreach ($rule in $customPolicy.PasswordRules) {
                        Write-Host "Password rule: $($rule.Name)"
                        Write-Host "Regex pattern: $($rule.RegexPattern)"
                    

                    

                    

                    


                    }
                }
                Write-Host "Password complexity: $($customPolicy.PasswordComplexity)"
                Write-Host "Password restrictions: $($customPolicy.PasswordRestrictions)"
            }
            Write-Host ""
        }
        else {
            Write-Host "Default domain password policy not found"
        }
    }
}


# Get the default domain password policy
Get-ADDefaultDomainPasswordPolicy

function Get-PackageInfo {

    param (
        [Parameter(Mandatory=$true)]
        [string]$packageName
    )

    $package = Get-Package -Name $packageName

    if ($package) {
        Write-Host "Package name: $($package.Name)"
        Write-Host "Version: $($package.Version)"
        Write-Host "Publisher: $($package.Publisher)"
        Write-Host "Install location: $($package.InstallLocation)"
        Write-Host "Description: $($package.Description)"
        Write-Host ""
    
        # Get the installed applications associated with the package
        $installedApps = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$($package.Name)_is1" -ErrorAction SilentlyContinue

        if ($installedApps) {
            foreach ($app in $installedApps) {
                Write-Host "Installed application: $($app.DisplayName)"
                Write-Host "Uninstall string: $($app.UninstallString)"
                Write-Host ""
            }
        
        }
        else {
            Write-Host "No installed applications found for package $($package.Name)"
        }
    
        # Get the dependencies of the package
        $dependencies = Get-Package -Name $packageName -DependencyTree | Select-Object Name, Version

        if ($dependencies) {
            Write-Host "Dependencies:"
            foreach ($dependency in $dependencies) {
                Write-Host "Name: $($dependency.Name)"
                Write-Host "Version: $($dependency.Version)"
                Write-Host ""
            }
    
        }
        else {
            Write-Host "No dependencies found for package $($package.Name)"
        }
    }    
}


# Get the installed applications associated with the package
Get-PackageInfo -packageName "Microsoft.Windows.10.ConsumerPreview"


function Get-ServiceInfo {

    param (
        [Parameter(Mandatory=$true)]
        [string]$serviceName
    )

    $service = Get-Service -Name $serviceName

    if ($service) {
        Write-Host "Service name: $($service.Name)"
        Write-Host "Status: $($service.Status)"
        Write-Host "Start type: $($service.StartType)"
        Write-Host "Description: $($service.Description)"
        Write-Host "Path to executable: $($service.PathToExecutable)"
        Write-Host ""
    
        # Get the dependencies of the service
        $dependencies = Get-Service -Name $serviceName -Dependent

        if ($dependencies) {
            Write-Host "Dependencies:"
            foreach ($dependency in $dependencies) {
                Write-Host "Name: $($dependency.Name)"
                Write-Host ""
            }
    
        }
        else {
            Write-Host "No dependencies found for service $($service.Name)"
        }

        # Get the services that depend on the service
        $dependentServices = Get-Service -Name $serviceName -Dependent

        if ($dependentServices) {
            Write-Host "Dependent services:"
            foreach ($dependentService in $dependentServices) {
                Write-Host "Name: $($dependentService.Name)"
                Write-Host ""
            }
    
        }
        else {
            Write-Host "No dependent services found for service $($service.Name)"
        }
    }
    else {
        Write-Host "Service not found"
    }
}

function Get-CornerJobInfo {
    param (
        [Parameter(Mandatory=$true)]
        [string]$jobName
    )

    $job = Get-Job -Name $jobName

    if ($job) {
        Write-Host "Job name: $($job.Name)"
        Write-Host "Status: $($job.Status)"
        Write-Host "Has more work to do: $($job.HasMoreWork)"
        Write-Host "Job object: $($job.JobObject)"
        Write-Host "Job object name: $($job.JobObject.Name)"
        Write-Host "Process ID: $($job.JobObject.ProcessId)"
        Write-Host "User name: $($job.JobObject.UserName)"
        Write-Host ""

        # Get the children of the job
        $children = Get-Job -Name $jobName -Child

        if ($children) {
            Write-Host "Children:"
            foreach ($child in $children) {
                Write-Host "Name: $($child.Name)"
                Write-Host "Status: $($child.Status)"
                Write-Host ""
            }
    
        
            Write-Host "Children:"
            foreach ($child in $children) {
                Write-Host "Name: $($child.Name)"
                Write-Host "Status: $($child.Status)"
                Write-Host ""
            }
    
        
            Write-Host "Children:"
            foreach ($child in $children) {
                Write-Host "Name: $($child.Name)"
                Write-Host "Status: $($child.Status)"
                Write-Host ""
            }

        
            Write-Host "Children:"
            foreach ($child in $children) {
                Write-Host "Name: $($child.Name)"
                Write-Host "Status: $($child.Status)"
                Write-Host ""
            }
    
        
            Write-Host "Children:"
            foreach ($child in $children) {
                Write-Host "Name: $($child.Name)"
                Write-Host "Status: $($child.Status)"
                Write-Host ""
                Write-Host "Children:"
                foreach ($grandchild in $child.Children) {
                    Write-Host "Name: $($grandchild.Name)"
                    Write-Host "Status: $($grandchild.Status)"
                    Write-Host ""
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                    
                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    

                    }

                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }

                    Write-Host "Children:"
                    foreach ($greatgrandchild in $grandchild.Children) {
                        Write-Host "Name: $($greatgrandchild.Name)"
                        Write-Host "Status: $($greatgrandchild.Status)"
                        Write-Host ""
                    }
                }
            }
            Write-Host ""
        }
        else {
            Write-Host "No children found for job $($job.Name)"
        }
    }
}


# Example usage
Get-ServiceInfo -ServiceName "w3svc"
Get-ServiceInfo -ServiceName " IISAdminService"
Get-ServiceInfo -ServiceName "WcfServiceHost"
Get-ServiceInfo -ServiceName "Windows Update"
Get-ServiceInfo -ServiceName "Windows Task Scheduler"

Get-DependentServices -ServiceName "w3svc"
Get-DependentServices -ServiceName "Windows Update"

Get-CornerJobInfo -JobName "Job1"

