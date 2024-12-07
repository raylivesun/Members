#!/home/admin/app/PowerShell/Members

# overloading the Add method to accept an array of Person objects

class Person {
    [string] $Name
    [int] $Age
    Person([string] $Name) {
    $this.Name = $Name
    }
    Person([string] $Name, [int]$Age) {
    $this.Name = $Name
    $this.Age = $Age
    45
    }
}

function Add([Person]$Person1, [Person]$Person2) {
    $result = New-Object Person -Property @{
        Name = $Person1.Name + ' ' + $Person2.Name
        Age = $Person1.Age + $Person2.Age
    }
    return $result
}

$person1 = New-Object Person -Property @{
    Name = 'John Doe'
    Age = 45
}

$person2 = New-Object Person -Property @{
    Name = 'Jane Smith'
    Age = 35
}

$result = Add $person1 $person2

Write-Host "Name: $($result.Name)"
Write-Host "Age: $($result.Age)"
