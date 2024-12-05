#!/home/admin/app/PowerShell/Members

# Alians Authorization Levels (ACLs) and Users List (CSV) paths (replace with your actual paths)
$aclPath = "C:\Users\admin\Documents\PowerShell\ACLs.csv"
$usersListPath = "C:\Users\admin\Documents\PowerShell\UsersList.csv"

# Read ACLs from CSV
$acls = Import-Csv $aclPath -Header 'Path', 'ACL'

# Read Users List from CSV
$usersList = Import-Csv $usersListPath -Header 'Username'

# Loop through each ACL and update its permissions
foreach ($acl in $acls) {
    $path = $acl.Path
    $aclString = $acl.ACL
    Write-Host "Updating permissions for $path with ACL: $aclString"
    $usersList | ForEach-Object {
        $username = $_
        $hasAccess = Test-Path -Path "$path" -PathType Container -ErrorAction SilentlyContinue
        if ($hasAccess) {
            Set-ACL -Path $path -Identity $username -AccessRight "Container Modify" -Confirm:$false
            Set-ACL -Path $path -Identity $username -AccessRight "Read" -Confirm:$false
            Write-Host "Successfully updated permissions for $username on $path"
            break
        }
        else {
            Write-Host "User $username does not have access to $path"
        }
    }
    if (-not $hasAccess) {
        Write-Host "No users found with access to $path"
    }
}


