#!/home/admin/app/PowerShell/Members

# Alians AZDO and GitHub to get the required variables
. $PSScriptRoot/aliases.ps1

# Fetch the variables from the Azure DevOps (ADO) project
Get-AzDevOpsProject -Name "YourProject" | ForEach-Object {
    $ADOVariables = Get-AzDevOpsVariableGroup -Project $_.Id -Name "YourVariableGroup"
    $ADOVariables.Variables | ForEach-Object {
        New-Variable -Name $_.Key -Value $_.Value -Option AllScope
    }
}

# Fetch the variables from the GitHub repository
Get-GitHubRepository -RepositoryName "YourRepository" | ForEach-Object {
    $GitHubVariables = Get-GitHubVariable -Repository $_.FullName -Name "YourVariableGroup"
    $GitHubVariables.Variables | ForEach-Object {
        New-Variable -Name $_.Key -Value $_.Value -Option AllScope
    }
}

# Display the fetched variables
Get-Variable -Scope Global | Where-Object { $_.Name -like 'YourVariable*' }
