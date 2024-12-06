#!/home/admin/app/PowerShell/Members

# Get exec drawn employees from 'Exec Draw' table
$execDrawEmployees = Get-Content.\ExecDraw.txt | ForEach-Object { $_ -split '\t' }

# Get all active employees from 'Employee' table
$activeEmployees = Get-Content.\Employee.txt | ForEach-Object { $_ -split '\t' }

# Get employees who are not in 'Exec Draw'
$nonExecDrawEmployees = $activeEmployees | Where-Object { $execDrawEmployees -notcontains $_.Name }

# Get employees who are in 'Exec Draw' but not active
$inactiveExecDrawEmployees = $execDrawEmployees | Where-Object { $nonExecDrawEmployees -notcontains $_.Name }

# Print inactive Exec Draw employees
Write-Host "Inactive Exec Draw Employees:"
foreach ($employee in $inactiveExecDrawEmployees) {
    Write-Host $employee.Name
    Write-Host $employee.Department
}

