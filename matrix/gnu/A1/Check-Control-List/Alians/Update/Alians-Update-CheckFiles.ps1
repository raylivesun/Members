#!/home/admin/app/PowerShell/Members

# Alians Update Script for Alians Members Only (PowerShell)

# Define variables
$aliansMembers = 'path/to/your/alians/members/file.txt'
$aliansPassword = 'your_alians_password'
$aliansUrl = 'https://your_alians_url'
$aliansAdminEmail = 'your_alians_admin_email'
$aliansAdminPassword = 'your_alians_admin_password'

# Read Alians members from the file
$aliansMembersList = Get-Content -Path $aliansMembers

# Loop through each Alians member
foreach ($aliansMember in $aliansMembersList) {
    # Split the member details by comma
    $aliansMemberInfo = $aliansMember.Split(',')

    # Extract the member's email and password
    $aliansMemberEmail = $aliansMemberInfo[0]
    $aliansMemberPassword = $aliansMemberInfo[1]

    # Create a new Alians account for the member
    $newAliansAccount = Invoke-RestMethod -Method POST -Uri "$aliansUrl/api/accounts" -Body @{ email = $aliansMemberEmail; password = $aliansMemberPassword } -ContentType 'application/json'
    $newAliansAccountId = $newAliansAccount.id

    # Update the member's password
    Invoke-RestMethod -Method PUT -Uri "$aliansUrl/api/accounts/$newAliansAccountId" -Body @{ password = $aliansMemberPassword } -ContentType 'application/json'

    # Create an Alians admin account for the member
    $newAliansAdminAccount = Invoke-RestMethod -Method POST -Uri "$aliansUrl/api/accounts" -Body @{ email = $aliansAdminEmail; password = $aliansAdminPassword } -ContentType 'application/json'
    $newAliansAdminAccountId = $newAliansAdminAccount.id

    # Assign the Alians admin account to the member
    Invoke-RestMethod -Method PUT -Uri "$aliansUrl/api/accounts/$newAliansAccountId/assign-admin" -Body @{ accountId = $newAliansAdminAccountId } -ContentType 'application/json'

    # Log the creation of the Alians account and admin account for the member
    Write-Host "Alians account and admin account created for $aliansMemberEmail"
    Write-Host "Account ID: $newAliansAccountId"
    Write-Host "Admin Account ID: $newAliansAdminAccountId"
    Write-Host "--------------------------------------------"
    Write-Host "Password updated for $aliansMemberEmail"
    Write-Host "--------------------------------------------"
    Write-Host "Admin Account created for $aliansMemberEmail"
    Write-Host "Account ID: $newAliansAdminAccountId"
    Write-Host "--------------------------------------------"
    Write-Host ""
    # Wait for 5 seconds before creating the next Alians account and admin account
    Start-Sleep -Seconds 5
    # Clear the console to prevent too many lines of output
    Clear-Host
    # Ensure that the Alians admin account is deleted after 10 days
    Start-Job -Name "DeleteAdminAccount$newAliansAdminAccountId" -ScriptBlock {
        $deleteAdminAccountUrl = "$aliansUrl/api/accounts/$args[0]"
        Invoke-RestMethod -Method DELETE -Uri $deleteAdminAccountUrl -ContentType 'application/json'
        Write-Host "Admin Account deleted for $args[0]"
        Write-Host "--------------------------------------------"
        Write-Host ""
        # Wait for 10 days before deleting the admin account
        Start-Sleep -Seconds 3600 * 24 * 10
        # Delete the admin account
        Invoke-RestMethod -Method DELETE -Uri $deleteAdminAccountUrl -ContentType 'application/json'
        Write-Host "Admin Account deleted for $args[0]"
        Write-Host "--------------------------------------------"
        Write-Host ""
        # Clear the console to prevent too many lines of output
        Clear-Host
        # Wait for 5 seconds before deleting the next admin account
        Start-Sleep -Seconds 5
        # Clear the console to prevent too many lines of output
        Clear-Host
        # Ensure that the Alians account is deleted after 10 days
        Start-Job -Name "DeleteAccount$newAliansAccountId" -ScriptBlock {
            $deleteAccountUrl = "$aliansUrl/api/accounts/$args[0]"
            Invoke-RestMethod -Method DELETE -Uri $deleteAccountUrl -ContentType 'application/json'
            Write-Host "Account deleted for $args[0]"
            Write-Host "--------------------------------------------"
            Write-Host ""
            # Wait for 10 days before deleting the account
            Start-Sleep -Seconds 3600 * 24 * 10
            # Delete the account
            Invoke-RestMethod -Method DELETE -Uri $deleteAccountUrl -ContentType 'application/json'
            Write-Host "Account deleted for $args[0]"
            Write-Host "--------------------------------------------"
            Write-Host ""
            # Clear the console to prevent too many lines of output
            Clear-Host
        
            # Wait for 5 seconds before deleting the next account
            Start-Sleep -Seconds 5
            # Clear the console to prevent too many lines of output
            Clear-Host
        
            # Wait for 10 seconds before creating the next Alians account and admin account
            Start-Sleep -Seconds 10
        
            # Clear the console to prevent too many lines of output
            Clear-Host
        }
        # Start the deletion job for the account
        Start-Job -Name "DeleteAccount$newAliansAccountId" -ArgumentList $newAliansAccountId
    
        # Wait for the deletion job to finish
        Receive-Job -Name "DeleteAccount$newAliansAccountId" | Wait-Job
    
        # Clear the console to prevent too many lines of output
        Clear-Host
    
        # Wait for 5 seconds before creating the next Alians account and admin account
        Start-Sleep -Seconds 5
        # Clear the console to prevent too many lines of output
        Clear-Host
    
        # Wait for 10 seconds before creating the next Alians account and admin account
        Start-Sleep -Seconds 10
    
        # Clear the console to prevent too many lines of output
        Clear-Host
    
        # Wait for 5 seconds before creating the next Alians account and admin account
        Start-Sleep -Seconds 5
        # Clear the console to prevent too many lines of output
        Clear-Host
    
    }

    # Start the deletion job for the admin account
    Start-Job -Name "DeleteAdminAccount$newAliansAdminAccountId" -ArgumentList $newAliansAdminAccountId

    # Wait for the deletion job to finish
    Receive-Job -Name "DeleteAdminAccount$newAliansAdminAccountId" | Wait-Job

    # Clear the console to prevent too many lines of output
    Clear-Host
    Write-Host $aliansPassword
}