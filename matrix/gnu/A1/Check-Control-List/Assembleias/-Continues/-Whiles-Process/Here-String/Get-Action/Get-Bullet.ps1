#!/home/admin/app/PowerShell/Members

# Get Bullet Hall IDs from the database using SQL query
$bulletHallIds = (Get-Content -Path 'bulletHallIds.txt') | ForEach-Object {
    $queryBulletTable = @"
SELECT BulletHallId
FROM BulletHalls
WHERE BulletHallName = '$_'
"@
    $bulletHallId = Invoke-Sqlcmd -ServerInstance 'your-server-name' -Database 'your-database-name' -Query $queryBulletTable
    $bulletHallId
}

function Get-BulletHallMembers {
    
    param (
        [Parameter(Mandatory=$true)]
        [string]$bulletHallId
    )

    if ($bulletHallId) {
        $bulletHallIds = Get-Alias ? bulletHallIds | Where-Object { $_ -eq $bulletHallId }
        if ($bulletHallIds) {
            $bulletHallIds = $bulletHallIds.Count
        } else {
            $bulletHallIds = 0
        }
        return $bulletHallIds
        } else {
            Write-Error "Bullet Hall ID '$bulletHallId' not found."
            return $null
        }
}

$bulletHallMembers = Get-BulletHallMembers -bulletHallId (Get-Content -Path 'bulletHallIds.txt')
$bulletHallMembers


function Get-BulletPOMatches {

    param (
        [Parameter(Mandatory=$true)]
        [string]$bulletHallId
    )

    if ($bulletHallId) {
        $bulletHallIds = Get-Alias ? bulletHallIds | Where-Object { $_ -eq $bulletHallId }
        if ($bulletHallIds) {
            $bulletHallIds = $bulletHallIds.Count
        } else {
            $bulletHallIds = 0
        }
        return $bulletHallIds
        } else {
            Write-Error "Bullet Hall ID '$bulletHallId' not found."
            return $null
        }
}

$bulletPOMatches = Get-BulletPOMatches -bulletHallId (Get-Content -Path 'bulletHallIds.txt')
$bulletPOMatches


function Get-BulletHallEvents {

    param (
        [Parameter(Mandatory=$true)]
        [string]$bulletHallId
    )

    if ($bulletHallId) {
        $bulletHallIds = Get-Alias ? bulletHallIds | Where-Object { $_ -eq $bulletHallId }
        if ($bulletHallIds) {
            $bulletHallIds = $bulletHallIds.Count
        } else {
            $bulletHallIds = 0
        }
        return $bulletHallIds
        } else {
            Write-Error "Bullet Hall ID '$bulletHallId' not found."
            return $null
        }
}

$bulletHallEvents = Get-BulletHallEvents -bulletHallId (Get-Content -Path 'bulletHallIds.txt')
$bulletHallEvents


function Get-BulletHallTournaments {

    param (
        [Parameter(Mandatory=$true)]
        [string]$bulletHallId
    )

    if ($bulletHallId) {
        $bulletHallIds = Get-Alias ? bulletHallIds | Where-Object { $_ -eq $bulletHallId }
        if ($bulletHallIds) {
            $bulletHallIds = $bulletHallIds.Count
        } else {
            $bulletHallIds = 0
        }
        return $bulletHallIds
        } else {
            Write-Error "Bullet Hall ID '$bulletHallId' not found."
            return $null
        }
}

$bulletHallTournaments = Get-BulletHallTournaments -bulletHallId (Get-Content -Path 'bulletHallIds.txt')
$bulletHallTournaments


function Get-BulletHallTournamentMatches {

    param (
        [Parameter(Mandatory=$true)]
        [string]$bulletHallId
    )

    if ($bulletHallId) {
        $bulletHallIds = Get-Alias ? bulletHallIds | Where-Object { $_ -eq $bulletHallId }
        if ($bulletHallIds) {
            $bulletHallIds = $bulletHallIds.Count
        } else {
            $bulletHallIds = 0
        }
        return $bulletHallIds
        } else {
            Write-Error "Bullet Hall ID '$bulletHallId' not found."
            return $null
        }
}

$bulletHallTournamentMatches = Get-BulletHallTournamentMatches -bulletHallId (Get-Content -Path 'bulletHallIds.txt')
$bulletHallTournamentMatches

`0  #Null 
`a  #Alert/Beep
`b  #Backspace
`f  #Form feed (used for printer output)
`n  #New line  
`r  #Carriage return
`t  #Horizontal tab
`v #Vertical tab (used for printer output)
