#!/home/admin/app/PowerShell/Members

# Chapter 13: PowerShell Classes
# A class is an extensible program-code-template for creating objects, providing initial values for state (member
# variables) and implementations of behavior (member functions or methods).A class is a blueprint for an object. It is
# used as a model to deﬁne the structure of objects. An object contains data that we access through properties and
# that we can work on using methods. PowerShell 5.0 added the ability to create your own classes.


# Define a new class called 'Person'
class Person {
    # Define properties (member variables)
    [string]$Name
    [int]$Age
    [string]$Gender

    # Define a constructor (member function)
    Person([string]$name, [int]$age, [string]$gender) {
        $this.Name = $name
        $this.Age = $age
        $this.Gender = $gender
    }

}


# Create an object of the 'Person' class and assign it to a variable called 'john'
$john = New-Object Person -ArgumentList 'John Doe', 45, 'Male'

# Access the properties of the object
Write-Host "Name: $($john.Name)"
Write-Host "Age: $($john.Age)"
Write-Host "Gender: $($john.Gender)"


# Chapter 14: PowerShell Procedures
# A procedure is a reusable block of code that performs a specific task. Procedures are called by name and can take
# zero or more parameters. A procedure can be defined within a script, a module, or a script block. Procedures can also be
# imported from other scripts or modules.


# Define a new procedure called 'Greet'
function Greet {
    param(
        [Parameter(Mandatory=$true)]
        [string]$name
    )

    Write-Host "Hello, $name!"
}


# Call the 'Greet' procedure with an argument
Greet -name 'Alice'


# Chapter 15: PowerShell Modules
# A module is a reusable collection of PowerShell scripts, functions, aliases, and cmdlets. Modules are organized into
# folders and can be installed using the Get-Module cmdlet. Modules can be created using the New-Module cmdlet, and
# can be exported and imported using the Export-Module cmdlet and Import-Module cmdlet.


# Create a new folder called 'MyModule'
New-Item -ItemType Directory -Path './MyModule'


# Add a new script file called 'MyModule.ps1' to the 'MyModule' folder
New-Item -ItemType File -Path './MyModule/MyModule.ps1' -Value ''


# Export a function from the 'MyModule.ps1' script
$functionContent = @"
function Get-MyModuleProperty {
    return 'Hello, from MyModule!'
}
"@
Set-Content -Path './MyModule/MyModule.ps1' -Value $functionContent


# Export the 'MyModule' module
Export-Module -Name 'MyModule' -Path './MyModule' -Force


# Import the 'MyModule' module
Import-Module -Name 'MyModule'


# Call the exported function
Write-Host (Get-MyModuleProperty)


# Chapter 16: PowerShell Scripting and Automation
# PowerShell scripting and automation are two distinct approaches to writing scripts and automating tasks in PowerShell.
# Scripting is the process of writing and running scripts using a text editor or a scripting language like PowerShell.
# Automation is the process of automating tasks using scripts and tools like PowerShell, cmdlets, and modules.


# Section 13.1: Listing available constructors for a class
# Version ≥ 5.0
# In PowerShell 5.0+ you can list available constructors by calling 
# the static new-method without parentheses.


# Get the constructors of the 'Person' class
$constructors = [Person].GetConstructors()

# Print the constructors
foreach ($constructor in $constructors) {
    Write-Host "Constructor: $($constructor.Name)"
}

[datetime]::new


# Section 13.2: Creating objects using constructors
# Version ≥ 5.0
# In PowerShell 5.0+, you can create objects using constructors by calling the new-object cmdlet with the class name
# followed by the constructor arguments.


# Create an object of the 'Person' class using the default constructor
$john = New-Object Person

# Access the properties of the object
Write-Host "Name: $($john.Name)"
Write-Host "Age: $($john.Age)"
Write-Host "Gender: $($john.Gender)"

# For earlier versions you can create your own function to list 
# available constructors:
function Get-Constructor {
         [CmdletBinding()]
        param(
             [Parameter(ValueFromPipeline=$true)]
             [type]$type
        )
}


# Define a new function called 'Get-ConstructorInfo'
function Get-ConstructorInfo {
    param(
        [Parameter(Mandatory=$true)]
        [type]$type
    )

    # Get the constructors of the specified type
    $constructors = $type.GetConstructors()

    # Print the constructors
    foreach ($constructor in $constructors) {
        Write-Host "Constructor: $($constructor.Name)"
    }

    # Return the constructors
    return $constructors
}


# Call the 'Get-ConstructorInfo' function with the 'Person' class
Get-ConstructorInfo -type Person
