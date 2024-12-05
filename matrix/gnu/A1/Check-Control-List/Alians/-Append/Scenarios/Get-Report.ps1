#!/home/admin/app/PowerShell/Members

# Alians Scenarios (1) (no specific action) - These are just for testing purposes
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | Format-Table Name, Definition

# Alians Scenarios (2) (action on the aliased cmdlet) - This action is to update the display name of the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    $user.DisplayName = $user.Name + ' (Updated)'
    Set-ADUser -Identity $user
}

# Alians Scenarios (3) (action on the aliased cmdlet) - This action is to delete the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Remove-ADUser -Identity $user
}

# Alians Scenarios (4) (action on the aliased cmdlet) - This action is to create a new user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    New-ADUser -Name 'NewUser' -GivenName 'New' -Surname 'User' -Enabled $true
}

# Alians Scenarios (5) (action on the aliased cmdlet) - This action is to update the password of the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -ChangePasswordAtLogon $true -PasswordNeverExpires $true
}

# Alians Scenarios (6) (action on the aliased cmdlet) - This action is to reset the password of the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Reset-ADUserPassword -Identity $user -ResetPassword
}

# Alians Scenarios (7) (action on the aliased cmdlet) - This action is to enable the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -Enabled $true
}

# Alians Scenarios (8) (action on the aliased cmdlet) - This action is to disable the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -Enabled $false
}

# Alians Scenarios (9) (action on the aliased cmdlet) - This action is to lock the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountPasswordExpired $true
}

# Alians Scenarios (10) (action on the aliased cmdlet) - This action is to unlock the user
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountPasswordExpired $false
}

# Alians Scenarios (11) (action on the aliased cmdlet) - This action is to enable the user to logon
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -UserCannotChangePassword $false
}

# Alians Scenarios (12) (action on the aliased cmdlet) - This action is to disable the user to logon
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -UserCannotChangePassword $true
}

# Alians Scenarios (13) (action on the aliased cmdlet) - This action is to set the user's password expiration policy
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -PasswordExpirationPolicy "No Expiration"
}

# Alians Scenarios (14) (action on the aliased cmdlet) - This action is to set the user's password minimum length
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -PasswordComplexityEnabled $true -PasswordLength 12
}

# Alians Scenarios (15) (action on the aliased cmdlet) - This action is to set the user's password minimum age
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -PasswordExpirationDays 90
}

# Alians Scenarios (16) (action on the aliased cmdlet) - This action is to set the user's password history
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -PasswordHistory 2
}

# Alians Scenarios (17) (action on the aliased cmdlet) - This action is to set the user's password lockout threshold
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -MaxPasswordAge (New-TimeSpan -Days 365)
}

# Alians Scenarios (18) (action on the aliased cmdlet) - This action is to set the user's password lockout duration
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -LockoutDuration (New-TimeSpan -Minutes 15)
}

# Alians Scenarios (19) (action on the aliased cmdlet) - This action is to set the user's password lockout observation window
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -LockoutObservationWindow (New-TimeSpan -Minutes 10)
}

# Alians Scenarios (20) (action on the aliased cmdlet) - This action is to set the user's account lockout threshold
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountLockoutThreshold 5
}

# Alians Scenarios (21) (action on the aliased cmdlet) - This action is to set the user's account lockout duration
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountLockoutDuration (New-TimeSpan -Minutes 15)
}

# Alians Scenarios (22) (action on the aliased cmdlet) - This action is to set the user's account lockout observation window
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountLockoutObservationWindow (New-TimeSpan -Minutes 10)
}

# Alians Scenarios (23) (action on the aliased cmdlet) - This action is to set the user's account expiration policy
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountExpirationPolicy "No Expiration"
    Set-ADUser -Identity $user -AccountExpirationDate (Get-Date).AddYears(10)
}

# Alians Scenarios (24) (action on the aliased cmdlet) - This action is to set the user's account lockout duration
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountLockoutDuration (New-TimeSpan -Minutes 15)
}

# Alians Scenarios (25) (action on the aliased cmdlet) - This action is to set the user's account lockout observation window
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -AccountLockoutObservationWindow (New-TimeSpan -Minutes 10)
}

# Alians Scenarios (26) (action on the aliased cmdlet) - This action is to set the user's password validation policy
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -PasswordValidationPolicy "DisallowPasswordReuse:24, MinimumLength:12, RequireDigit:2, RequireLowercase:2,
    RequireNonAlphaNumeric:2, RequireUppercase:2"
}

# Alians Scenarios (27) (action on the aliased cmdlet) - This action is to set the user's password history enforcement policy
Get-Alias | Where-Object { $_.Definition -like '*Get-ADUser*' } | ForEach-Object {
    $user = Get-ADUser -Identity $_.Name
    Set-ADUser -Identity $user -PasswordHistoryEnforcementPolicy "Enforce"
    Set-ADUser -Identity $user -PasswordHistory 2
}

