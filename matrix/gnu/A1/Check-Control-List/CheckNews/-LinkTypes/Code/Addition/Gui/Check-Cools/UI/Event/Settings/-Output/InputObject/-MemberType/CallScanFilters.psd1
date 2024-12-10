#!/home/admin/app/PowerShell/Members

# Call Scan Filter Function to filter members
$filteredMembers = ScanFilterFunction

# Check if filtered members array is not empty
if ($filteredMembers) {
    # Get the total number of members
    $totalMembers = $filteredMembers.Count
    Write-Host "Total number of members: $totalMembers"

    # Calculate the average age of members
    $totalAge = $filteredMembers | ForEach-Object { $_.Age } | Measure-Object -Sum | Select-Object -ExpandProperty Sum
    $averageAge = [math]::Round($totalAge / $totalMembers, 2)
    Write-Host "Average age of members: $averageAge"

    # Calculate the percentage of members with a salary above $50,000
    $salaryAbove50K = $filteredMembers | Where-Object { $_.Salary -gt 50000 } | Measure-Object -Count
    $salaryAbove50KPercentage = [math]::Round(($salaryAbove50K.Count / $totalMembers) * 100, 2)
    Write-Host "Percentage of members with a salary above $50,000: $salaryAbove50KPercentage%"

    # Find the oldest member
    $oldestMember = $filteredMembers | Sort-Object -Property Age -Descending | Select-Object -First 1
    Write-Host "Oldest member: $($oldestMember.FirstName) $($oldestMember.LastName), Age: $($oldestMember.Age)"

    # Find the youngest member
    $youngestMember = $filteredMembers | Sort-Object -Property Age | Select-Object -First 1
    Write-Host "Youngest member: $($youngestMember.FirstName) $($youngestMember.LastName), Age: $($youngestMember.Age)"

    # Calculate the average salary of male and female members separately
    $maleMembers = $filteredMembers | Where-Object { $_.Gender -eq 'Male' }
    $femaleMembers = $filteredMembers | Where-Object { $_.Gender -eq 'Female' }
    $totalMaleSalary = $maleMembers | ForEach-Object { $_.Salary } | Measure-Object -Sum | Select-Object -ExpandProperty Sum
    $totalFemaleSalary = $femaleMembers | ForEach-Object { $_.Salary } | Measure-Object -Sum | Select-Object -ExpandProperty Sum
    $averageMaleSalary = [math]::Round($totalMaleSalary / ($maleMembers.Count), 2)
    $averageFemaleSalary = [math]::Round($totalFemaleSalary / ($femaleMembers.Count), 2)
    Write-Host "Average salary of male members: $averageMaleSalary"
    Write-Host "Average salary of female members: $averageFemaleSalary"

    # Find the member with the highest salary
    $highestSalaryMember = $filteredMembers | Sort-Object -Property Salary -Descending | Select-Object -First 1
    Write-Host "Member with the highest salary: $($highestSalaryMember.FirstName) $($highestSalaryMember.LastName), Salary: $($highestSalaryMember.Salary)"

    # Find the member with the lowest salary
    $lowestSalaryMember = $filteredMembers | Sort-Object -Property Salary | Select-Object -First 1
    Write-Host "Member with the lowest salary: $($lowestSalaryMember.FirstName) $($lowestSalaryMember.LastName), Salary: $($lowestSalaryMember.Salary)"

    # Find the member with the highest salary in each department
    $highestSalaryDepartmentMembers = $filteredMembers | Group-Object -Property Department | ForEach-Object {
        $department = $_.Name
        $departmentMembers = $_.Group
        $highestSalaryDepartmentMember = $departmentMembers | Sort-Object -Property Salary -Descending | Select-Object -First 1
        Write-Host "Member with the highest salary in department '$department': $($highestSalaryDepartmentMember.FirstName) $($highestSalaryDepartmentMember.LastName), Salary: $($highestSalaryDepartmentMember.
        Salary)"
    }
    Write-Host ""
    Write-Host "Note: The highest salary in each department is determined based on the entire department's members."
    Write-Host ""
    Write-Host "To get the highest salary in each department individually, you would need to filter the members by department first."
    Write-Host ""
    Write-Host "To filter members by department, you can modify the ScanFilterFunction as follows:"
    Write-Host ""
    Write-Host "# Filter members by department"
    Write-Host "$filteredMembers = $members | Where-Object { $_.Department -eq 'DepartmentName' }"
    Write-Host ""
    Write-Host "Replace 'DepartmentName' with the desired department."
    Write-Host ""
    Write-Host "After modifying the ScanFilterFunction, you can re-run the script."
    Write-Host ""
    Write-Host "To customize the script further, you can modify the properties of the Member objects, such as FirstName, LastName, Age, Gender, Salary, and Department."
    Write-Host ""
    Write-Host "To add more members, you can create new Member objects and add them to the $members array."
    Write-Host ""
    Write-Host "To run the script, save it in a .ps1 file, open a PowerShell console, and navigate to the directory containing the .ps1 file using the Set-Location
    cmdlet, and then run the following command:"
    Write-Host ""
    Write-Host ". .\scriptName.ps1"
    Write-Host ""
    Write-Host "Replace 'scriptName.ps1' with the name of your .ps1 file."
    Write-Host ""
    Write-Host "To view the generated output, open the PowerShell console and run the following command:"
    Write-Host ""
    Write-Host "Get-Content output.txt"
    Write-Host ""
    Write-Host "Note: The output.txt file will contain the generated output."
    Write-Host ""
    Write-Host "To customize the output format, you can modify the Write-Host commands in the script."
    Write-Host ""
    Write-Host "To run the script in a different PowerShell console, you can use the Start-Process cmdlet."
    Write-Host ""
    Write-Host "To customize the script to run in a different PowerShell console, you can modify the Start-Process cmdlet command."
    Write-Host ""
    Write-Host "To add more members, you can create new Member objects and add them to the $members array."
    Write-Host ""
}
else {
    Write-Host "No members found that meet the specified criteria. $(Get-Date)$highestSalaryMember.FirstName) $(Get-Date)$highestSalaryMember.LastName, Salary: $(Get-Date)$highestSalaryDepartmentMember.Salary)"
}
Write-Host $highestSalaryDepartmentMembers


function ScanFilterFunction {
    # Filter members by age
    $filteredMembers = $members | Where-Object { $_.Age -gt 30 }

    # Filter members by salary
    $filteredMembers = $filteredMembers | Where-Object { $_.Salary -gt 30000 }

    # Filter members by gender
    $filteredMembers = $filteredMembers | Where-Object { $_.Gender -eq 'Male' }

    # Filter members by department
    $filteredMembers = $filteredMembers | Where-Object { $_.Department -eq 'Sales' }

    return $filteredMembers
}


class Member {
    [string]$FirstName
    [string]$LastName
    [int]$Age
    [string]$Gender
    [int]$Salary
    [string]$Department
    Member([string]$firstName, [string]$lastName, [int]$age, [string]$gender, [int]$salary, [string]$department) {
        $this.FirstName = $firstName
        $this.LastName = $lastName
        $this.Age = $age
        $this.Gender = $gender
        $this.Salary = $salary
        $this.Department = $department
    }
}


# Create sample members
$members = @()
$members += New-Object Member -ArgumentList 'John', 'Doe', 35, 'Male', 50000, 'Sales'
$members += New-Object Member -ArgumentList 'Jane', 'Smith', 32, 'Female', 60000, 'Sales'
$members += New-Object Member -ArgumentList 'Bob', 'Johnson', 37, 'Male', 45000, 'Marketing'
$members += New-Object Member -ArgumentList 'Alice', 'Williams', 30, 'Female', 55000, 'Marketing'
$members += New-Object Member -ArgumentList 'Mike', 'Brown', 40, 'Male', 65000, 'Finance'
$members += New-Object Member -ArgumentList 'Emily', 'Davis', 38, 'Female', 52000, 'Finance'
$members += New-Object Member -ArgumentList 'Sarah', 'Miller', 36, 'Female', 48000, 'HR'
$members += New-Object Member -ArgumentList 'Daniel', 'Wilson', 39, 'Male', 57000, 'HR'
$members += New-Object Member -ArgumentList 'Patricia', 'Garcia', 33, 'Female', 59000, 'IT'


# Call the main function
Main


# Save the output to a file
Get-Content output.txt | Out-File output.txt -Append
