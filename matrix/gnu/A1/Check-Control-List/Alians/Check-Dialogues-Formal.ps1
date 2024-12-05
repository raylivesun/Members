#!/home/admin/app/PowerShell/Members

# connection string for the DBRain database
function Get-DBRainConnectionString {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DBRainDatabaseName
    )

    $dbRainConnectionString = "Server=localhost;Database=$DBRainDatabaseName;Uid=rain;Pwd=rain;"
    return $dbRainConnectionString
}

# get a list of all members from the DBRain database
function Get-DBRainMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DBRainConnectionString
    )

    $members = Invoke-SqlCmd -ServerInstance localhost -Database rain -Query "SELECT * FROM members" -ConnectionTimeout 30 -AsJob
    $members | Receive-Job -Wait -AutoRemoveJob

    return $members.Job.Results
}

# get the total number of members in the DBRain database
function Get-DBRainTotalMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DBRainConnectionString
    )

    $totalMembers = Invoke-SqlCmd -ServerInstance localhost -Database rain -Query "SELECT COUNT(*) AS TotalMembers FROM members" -ConnectionTimeout 30 -AsJob
    $totalMembers | Receive-Job -Wait -AutoRemoveJob

    return $totalMembers.Job.Results[0].TotalMembers
}

# get a list of members who have made at least 5 purchases in the last 30 days
function Get-DBRainMembersWithPurchaseHistory {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DBRainConnectionString
    )

    $membersWithPurchaseHistory = Invoke-SqlCmd -ServerInstance localhost -Database rain -Query "SELECT m.MemberId, m.FirstName, m.LastName, COUNT(p.Purchase
    Id) AS PurchaseCount
    FROM members m
    INNER JOIN purchases p ON m.MemberId = p.MemberId
    WHERE p.PurchaseDate >= DATEADD(day, -30, GETDATE())
    GROUP BY m.MemberId, m.FirstName, m.LastName
    HAVING COUNT(p.PurchaseId) >= 5" -ConnectionTimeout 30 -AsJob
    $membersWithPurchaseHistory | Receive-Job -Wait -AutoRemoveJob

    return $membersWithPurchaseHistory.Job.Results
}

# get a list of members who have made at least 5 purchases in the last 30 days, and have a total purchase amount greater than $1000
function Get-DBRainTopSpenders {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DBRainConnectionString
    )

    $topSpenders = Invoke-SqlCmd -ServerInstance localhost -Database rain -Query "SELECT m.MemberId, m.FirstName, m.LastName, SUM(p.Purchase
    Amount) AS TotalAmountSpent
    FROM members m
    INNER JOIN purchases p ON m.MemberId = p.MemberId
    WHERE p.PurchaseDate >= DATEADD(day, -30, GETDATE())
    GROUP BY m.MemberId, m.FirstName, m.LastName
    HAVING COUNT(p.PurchaseId) >= 5 AND SUM(p.PurchaseAmount) > 1000" -ConnectionTimeout 30 -AsJob
    $topSpenders | Receive-Job -Wait -AutoRemoveJob

    return $topSpenders.Job.Results
}

# get a list of members who have made at least 5 purchases in the last 30 days, and have purchased a specific product
function Get-DBRainProductPurchasers {
    $members = Get-DBRainMembersWithPurchaseHistory -DBRainConnectionString $connectionString

    $productPurchasers = $members | Where-Object {
        $_.PurchaseCount -ge 5
        $_.Products | Where-Object { $_.ProductName -eq "Product X" }
    
        $_.Products.Count -gt 0
    
        $_.Products
    Write-Output $productPurchasers ./members.csv
    }

}

# main entry point
function Main {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DBRainDatabaseName
    )

    $connectionString = Get-DBRainConnectionString -DBRainDatabaseName $DBRainDatabaseName
    $members = Get-DBRainMembers -DBRainConnectionString $connectionString
    $totalMembers = Get-DBRainTotalMembers -DBRainConnectionString $connectionString
    $membersWithPurchaseHistory = Get-DBRainMembersWithPurchaseHistory -DBRainConnectionString $connectionString
    $topSpenders = Get-DBRainTopSpenders -DBRainConnectionString $connectionString
    $productPurchasers = Get-DBRainProductPurchasers -DBRainConnectionString $connectionString -ProductName "Product X"

    Write-Host "Total members: $totalMembers"
    Write-Host "Members with purchase history:"
    foreach ($member in $membersWithPurchaseHistory) {
        Write-Host "MemberId: $($member.MemberId), FirstName: $($member.FirstName), LastName: $($member.LastName), PurchaseCount: $($member.PurchaseCount)"
    }
    Write-Host "Top spenders:"
    foreach ($spender in $topSpenders) {
        Write-Host "MemberId: $($spender.MemberId), FirstName: $($spender.FirstName), LastName: $($spender.LastName), TotalAmountSpent: $($spender.TotalAmountSpent)"
    }
    Write-Host "Product purchasers for Product X:"
    foreach ($productPurchaser in $productPurchasers) {

        Write-Host "MemberId: $($productPurchaser.MemberId), FirstName: $($productPurchaser.FirstName), LastName: $($productPurchaser.LastName), Purchase
        Count: $($productPurchaser.PurchaseCount)"
    }
    Write-Output $members
    Write-Host "Finished."
}

Main -DBRainDatabaseName "rain"
