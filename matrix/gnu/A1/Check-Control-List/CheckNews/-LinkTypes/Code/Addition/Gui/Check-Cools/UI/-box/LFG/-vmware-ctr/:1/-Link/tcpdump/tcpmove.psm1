#!/home/admin/app/PowerShell/Members

# The tcp move command moves the specified member to a new server.
# Replace "SERVER1" and "SERVER2" with your actual server names.
# Replace "SERVER1\username" and "SERVER2\username" with your actual credentials.
# Replace "domain\username" with your actual domain username.

$server1 = "SERVER1"
$server2 = "SERVER2"
$username = "SERVER1\username"
$password = ConvertTo-SecureString "password" -AsPlainText -Force
$domain = "domain"

$secureCredential = New-Object System.Management.Automation.PSCredential($username, $password)

$members = Get-ADUser -Filter * -Properties SamAccountName, MemberOf

foreach ($member in $members) {
    if ($member.MemberOf -contains "CN=Server Administrators,CN=Users,DC=domain,DC=com") {
        $server1Members = Get-ADGroupMember -Identity "Server Administrators" -Server $server1
        $server2Members = Get-ADGroupMember -Identity "Server Administrators" -Server $server2
        $server1MemberCount = $server1Members.Count
        $server2MemberCount = $server2Members.Count
        $moveCount = 0

        if ($server1MemberCount -gt $server2MemberCount) {
            $moveCount = $server1MemberCount - $server2MemberCount
            $server1Members = $server1Members | Where-Object { $_.SamAccountName -notin $server2Members.SamAccountName }
            $server1Members | Move-ADObject -TargetPath "DC=$server2,DC=domain,DC=com" -Server $server1 -Confirm:$false -Credential $secure
            Write-Host "Moved $($member.SamAccountName) to $server2"
            $moveCount--
        }
        elseif ($server2MemberCount -gt $server1MemberCount) {
            $moveCount = $server2MemberCount - $server1MemberCount
            $server2Members = $server2Members | Where-Object { $_.SamAccountName -notin $server1Members.SamAccountName }
            $server2Members | Move-ADObject -TargetPath "DC=$server1,DC=domain,DC=com" -Server $server2 -Confirm:$false -Credential $secure
            Write-Host "Moved $($member.SamAccountName) to $server1"
            $moveCount--
        }
        else {
            Write-Host "No need to move $($member.SamAccountName) to either server"
        }

        if ($moveCount -eq 0) {
            break
        }
        Start-Sleep -Seconds 5
    }
    else {
        Write-Host "Skipping $($member.SamAccountName) - not a server administrator"
    }
}
Wait-Debugger $domain -InformationAction SilentlyContinue 
Write-Host $secureCredential
