#!/home/admin/app/PowerShell/Members

# Get Exec Hash and Target Name from the arguments
$exec_hash = $args[0]
$target_name = $args[1]
Write-Debug "Target Name: $target_name"
Wait-Event "ProcessStart $($pid) $exec_hash"

# Check if the target is an AD user
$ad_user = Get-ADUser $target_name -ErrorAction SilentlyContinue
if ($ad_user) {
    # Get the user's last logon date and time
    $last_logon = (Get-ADUser $target_name -Properties LastLogon).LastLogon
    Write-Debug "Last Logon: $last_logon"

    # Calculate the logon duration in minutes
    $logon_duration = (Get-Date) - (New-DateTime $last_logon)
    $logon_duration_minutes = $logon_duration.TotalMinutes
    Write-Debug "Logon Duration (minutes): $logon_duration_minutes"

} else {
    Write-Error "Target $target_name is not an Active Directory user"
}

# An example of deﬁning a hash table and accessing a value by the key

$hashTable = @{
Key1 = 'Value1'
Key2 = 'Value2'
}
$hashTable.Key1
