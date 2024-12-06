#!/home/admin/app/PowerShell/Members

# Get Exec AMT-5 Caim actions from the last 24 hours
$caimActionsInfinity = Get-ADAMCaimAction -Filter {
    StartTime -ge (Get-Date).AddHours(-24) -And
    ActionType -eq 'Exec' -And
    ActionName -like 'AMT-5*'
}
Write-Debug "AMT-5 Caim actions from the last 24 hours: $($caimActionsInfinity.Count)"


