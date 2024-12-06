#!/home/admin/app/PowerShell/Members

# Get Allow Guests and Enable Nested Groups settings
$allowGuests = Get-ADDefaultDomainPasswordPolicy -GetValues AllowGuests
$enableNestedGroups = Get-ADDefaultDomainPasswordPolicy -GetValues EnableNestedGroups

# Set Allow Guests and Enable Nested Groups settings
Set-ADDefaultDomainPasswordPolicy -AllowGuests $allowGuests -EnableNestedGroups $enableNestedGroups

# Restart AD DS service
Restart-Service ADWS

# Display success message
Write-Host "Guest access and nested group settings have been updated successfully."
