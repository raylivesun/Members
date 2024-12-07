#!/home/admin/app/PowerShell/Members

# You can store the object in a variable by prefacing the command with 
# $newObject = You may also need to store collections of objects. This 
# can be done by creating an empty collection variable, and
# adding objects to the collection, like so:


# Define the object properties
$name = "John Doe"
$age = 30
$city = "New York"

# Create a new object using the defined properties
$person = New-Object PSObject -Property @{
    Name    = $name
    Age     = $age
    City    = $city
}

# Output the object
$person

$newCollection = @()
$newCollection += New-Object -TypeName PSObject -Property @{
     Name = $env:username
     ID = 12
     Address = $null
}

$newCollection += New-Object -TypeName PSObject -Property @{
     Name = "Jane Doe"
     ID = 13
     Address = "123 Main St"
}

$newCollection

# You may then wish to iterate through this collection object by object. 
# To do that, locate the Loop section in the documentation.
# Option 2: Select-Object
# A less common way of creating objects that you'll still ﬁnd on the 
# internet is the following:

$newObject = 'unuseddummy' | Select-Object -Property Name, ID, Address
$newObject.Name = $env:username
$newObject.ID = 12
$newObject.Address = $null

$newObject

# Option 3: pscustomobject type accelerator (PSv3+ required)
# The ordered type accelerator forces PowerShell to keep our properties 
# in the order that we deﬁned them. You don't
# need the ordered type accelerator to use [PSCustomObject]:


$newObject = [PSCustomObject]@{
    Name = $env:username
    ID = 12
    Address = $null
}

$newObject

# Note: examples written for PowerShell 5.1 You can create 
# instances of Generic Classes


# Define a generic class
class GenericClass
{
    [Parameter(Mandatory=$true)]
    [string]$Property1

    [Parameter(Mandatory=$true)]
    [int]$Property2
}

# Create an instance of the generic class
$genericObject = New-Object GenericClass -Property @{
    Property1 = "Hello"
    Property2 = 42
}

$genericObject

#Nullable System.DateTime
[Nullable[datetime]]$nullableDate = Get-Date -Year 2012
$nullableDate
$nullableDate.GetType().FullName
$nullableDate = $null
$nullableDate
$nullableDate.GetType().FullName

# Nullable System.Int32
[Nullable[int]]$nullableInt = 42
$nullableInt
$nullableInt.GetType().FullName
$nullableInt = $null
$nullableInt
$nullableInt.GetType().FullName

# Nullable System.String
[Nullable[string]]$nullableString = "Hello"
$nullableString
$nullableString.GetType().FullName
$nullableString = $null
$nullableString
$nullableString.GetType().FullName


# Nullable System.Boolean
[Nullable[bool]]$nullableBool = $true
$nullableBool
$nullableBool.GetType().FullName
$nullableBool = $null
$nullableBool
$nullableBool.GetType().FullName

# Nullable System.Decimal
[Nullable[decimal]]$nullableDecimal = 42.0
$nullableDecimal
$nullableDecimal.GetType().FullName
$nullableDecimal = $null
$nullableDecimal
$nullableDecimal.GetType().FullName

# Nullable System.Char
[Nullable[char]]$nullableChar = "H"
$nullableChar
$nullableChar.GetType().FullName
$nullableChar = $null
$nullableChar
$nullableChar.GetType().FullName

# Nullable System.Byte
[Nullable[byte]]$nullableByte = 42
$nullableByte
$nullableByte.GetType().FullName
$nullableByte = $null
$nullableByte
$nullableByte.GetType().FullName

# Nullable System.SByte
[Nullable[sbyte]]$nullableSByte = -42
$nullableSByte
$nullableSByte.GetType().FullName
$nullableSByte = $null
$nullableSByte
$nullableSByte.GetType().FullName

# Nullable System.UInt16
[Nullable[uint16]]$nullableUInt16 = 42
$nullableUInt16
$nullableUInt16.GetType().FullName
$nullableUInt16 = $null
$nullableUInt16
$nullableUInt16.GetType().FullName

# Nullable System.UInt32
[Nullable[uint32]]$nullableUInt32 = 42
$nullableUInt32
$nullableUInt32.GetType().FullName
$nullableUInt32 = $null
$nullableUInt32
$nullableUInt32.GetType().FullName

# Nullable System.UInt64
[Nullable[uint64]]$nullableUInt64 = 42
$nullableUInt64
$nullableUInt64.GetType().FullName
$nullableUInt64 = $null
$nullableUInt64
$nullableUInt64.GetType().FullName

# Nullable System.Int16
[Nullable[int16]]$nullableInt16 = 42
$nullableInt16
$nullableInt16.GetType().FullName
$nullableInt16 = $null
$nullableInt16
$nullableInt16.GetType().FullName

# Nullable System.Int64
[Nullable[int64]]$nullableInt64 = 42
$nullableInt64
$nullableInt64.GetType().FullName
$nullableInt64 = $null
$nullableInt64
$nullableInt64.GetType().FullName

# Nullable System.Single
[Nullable[single]]$nullableSingle = 42.0
$nullableSingle
$nullableSingle.GetType().FullName
$nullableSingle = $null
$nullableSingle
$nullableSingle.GetType().FullName

# Nullable System.Double
[Nullable[double]]$nullableDouble = 42.0
$nullableDouble
$nullableDouble.GetType().FullName
$nullableDouble = $null
$nullableDouble
$nullableDouble.GetType().FullName

# Nullable System.Decimal
[Nullable[decimal]]$nullableDecimal = 42.0
$nullableDecimal
$nullableDecimal.GetType().FullName
$nullableDecimal = $null
$nullableDecimal
$nullableDecimal.GetType().FullName

# Nullable System.Char
[Nullable[char]]$nullableChar = "H"
$nullableChar
$nullableChar.GetType().FullName
$nullableChar = $null
$nullableChar
$nullableChar.GetType().FullName

# Nullable System.Byte
[Nullable[byte]]$nullableByte = 42
$nullableByte
$nullableByte.GetType().FullName
$nullableByte = $null
$nullableByte
$nullableByte.GetType().FullName

# Nullable System.SByte
[Nullable[sbyte]]$nullableSByte = -42
$nullableSByte
$nullableSByte.GetType().FullName
$nullableSByte = $null
$nullableSByte
$nullableSByte.GetType().FullName

# Nullable System.UInt16
[Nullable[uint16]]$nullableUInt16 = 42
$nullableUInt16
$nullableUInt16.GetType().FullName
$nullableUInt16 = $null
$nullableUInt16
$nullableUInt16.GetType().FullName

# Nullable System.UInt32
[Nullable[uint32]]$nullableUInt32 = 42
$nullableUInt32
$nullableUInt32.GetType().FullName
$nullableUInt32 = $null
$nullableUInt32
$nullableUInt32.GetType().FullName

# Nullable System.UInt64
[Nullable[uint64]]$nullableUInt64 = 42
$nullableUInt64
$nullableUInt64.GetType().FullName
$nullableUInt64 = $null
$nullableUInt64
$nullableUInt64.GetType().FullName

# Nullable System.Int16
[Nullable[int16]]$nullableInt16 = 42
$nullableInt16
$nullableInt16.GetType().FullName
$nullableInt16 = $null
$nullableInt16
$nullableInt16.GetType().FullName

# Nullable System.Int64
[Nullable[int64]]$nullableInt64 = 42
$nullableInt64
$nullableInt64.GetType().FullName
$nullableInt64 = $null
$nullableInt64
$nullableInt64.GetType().FullName

# Nullable System.Single
[Nullable[single]]$nullableSingle = 42.0
$nullableSingle
$nullableSingle.GetType().FullName
$nullableSingle = $null
$nullableSingle
$nullableSingle.GetType().FullName

# Nullable System.Double
[Nullable[double]]$nullableDouble = 42.0
$nullableDouble
$nullableDouble.GetType().FullName
$nullableDouble = $null
$nullableDouble
$nullableDouble.GetType().FullName

# Nullable System.Decimal
[Nullable[decimal]]$nullableDecimal = 42.0
$nullableDecimal
$nullableDecimal.GetType().FullName
$nullableDecimal = $null
$nullableDecimal
$nullableDecimal.GetType().FullName

# Nullable System.Char
[Nullable[char]]$nullableChar = "H"
$nullableChar
$nullableChar.GetType().FullName
$nullableChar = $null
$nullableChar
$nullableChar.GetType().FullName

# Nullable System.Byte
[Nullable[byte]]$nullableByte = 42
$nullableByte
$nullableByte.GetType().FullName
$nullableByte = $null
$nullableByte
$nullableByte.GetType().FullName

# Nullable System.SByte
[Nullable[sbyte]]$nullableSByte = -42
$nullableSByte
$nullableSByte.GetType().FullName
$nullableSByte = $null
$nullableSByte
$nullableSByte.GetType().FullName

#Normal System.DateTime
[datetime]$aDate = Get-Date -Year 2013
$aDate
$aDate.GetType().FullName
$aDate = $null #Throws exception when PowerShell attempts to convert null to


# Generic Collections are also possible
[System.Collections.Generic.SortedDictionary[int, String]]$dict =
[System.Collections.Generic.SortedDictionary[int, String]]::new()
$dict.GetType().FullName
$dict.Add(1, 'a')
$dict.Add(2, 'b')
$dict.Add(3, 'c')
$dict.Add('4', 'd') #powershell auto converts '4' to 4
$dict.Add('5.1', 'c') #powershell auto converts '5.1' to 5
$dict
$dict.Add('z', 'z') #powershell can't convert 'z' to System.Int32 so it throws an error


# Chapter 12: PowerShell Functions
# A function is basically a named block of code. When you call the function name, 
# the script block within that function runs. It is a list of PowerShell statements that has a name that you assign. When you run a function, you type the
# function name. It is a method of saving time when tackling repetitive tasks. 
# PowerShell formats in three parts: the keyword 'Function', followed by a Name, 
# ﬁnally, the payload containing the script block, which is enclosed by
# curly/parenthesis style bracket.


# Create a simple function
Function Get-Greeting {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name
    )
    "Hello, $Name!"
}

# Call the function
Get-Greeting -Name John


# Create a function with optional parameters
Function Get-GreetingWithOptionalParams {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [string]$Message = "Welcome",
        [switch]$GreetInUpperCase
    )
    if ($GreetInUpperCase) {
        "Hello, $Name!" -as [System.String]::ToUpper()
    } else {
        "Hello, $Name! $Message"
    }
}

# Call the function with optional parameters
Get-GreetingWithOptionalParams -Name John -Message "How are you?" -GreetInUpperCase
Get-GreetingWithOptionalParams -Name John


# Note: Casting parameters is not required in either type of parameter deﬁnition.
# Simple function syntax (SFS) has very limited capabilities in comparison to the param block.
# Though you can deﬁne parameters to be exposed within the function, you cannot specify Parameter Attributes,
# utilize Parameter Validation, include [CmdletBinding()], with SFS (and this is a non-exhaustive list).
# Functions can be invoked with ordered or named parameters.
# The order of the parameters on the invocation is matched to the order of the declaration in the function header (by
# default), or can be speciﬁed using the Position Parameter Attribute (as shown in the advanced function example,
# above).

# Chapter 13: PowerShell Classes
# Classes in PowerShell are a way to create custom objects. They are a blueprint for creating objects,
# and they are used to encapsulate data and behavior.

# Create a simple class
Class Person {
    [string]$Name
    [int]$Age
}

# Create an object of the Person class
$person = New-Object Person -Name John -Age 30

# Call the method on the object
$person.GetGreeting()

# Alternatively, this function can be invoked with named parameters
$greeting = Write-Greeting "Jim" 82
$greeting = Write-Greeting -name "Bob" -age 82
Write-Host $greeting


# Create a class with properties and methods
Class Employee {
    [string]$FirstName
    [string]$LastName
    [int]$Age
    [string]$Department

    # Property
}

Employee john = New-Object Employee -FirstName "John" -LastName "Doe" -Age 30 -Department "Sales"


# Section 12.2: Advanced Function
# This is a copy of the advanced function snippet from the Powershell ISE. Basically this is a template for many of the
# things you can use with advanced functions in Powershell. Key points to note:
# get-help integration - the beginning of the function contains a comment block that is set up to be read by the
# get-help cmdlet. The function block may be located at the end, if desired.
# cmdletbinding - function will behave like a cmdlet
# GoalKicker.com – PowerShell® Notes for Professionals
# 39
# parameter sets


Function Get-Employees {
    <#
    .Synopsis
        Retrieves a list of employees.

    .Description
        This function retrieves a list of employees from a database.
       .Example
        Get-Employees | Format-Table Name, Age, Department
        Get-Employees | Where-Object { $_.Age -gt 30 } | Format-Table Name, Age, Department
        Get-Employees | Sort-Object Age -Descending | Format-Table Name, Age, Department
        Get-Employees | Select-Object -First 10 | Format-Table Name, Age, Department
        Get-Employees | Where-Object { $_.Department -eq "Sales" } | Sort-Object Age -Descending | Format-Table Name, Age, Department
        Get-Employees | Where-Object { $_.Age -gt 30 -and $_.Department -eq "Sales" } | Format-Table Name, Age, Department
        Get-Employees | Where-Object { $_.Age -gt 30 -and $_.Department -eq "Sales" } | Sort-Object Age -Descending | Select-Object -
        First 10 | Format-Table Name, Age, Department
        Get-Employees | Where-Object { $_.Age -gt 30 -and $_.Department -eq "Sales" } | Sort-Object Age -Descending | Select-Object -
        First 10 | Format-Table @{Expression={$_.Name}; Label="Employee Name"; Align="Left"}, Age, Department
        Get-Employees | Where-Object { $_.Age -gt 30 -and $_.Department -eq "Sales" } | Sort-Object Age -Descending | Select-Object -
        First 10 | Format-Table @{Expression={$_.Name}; Label="Employee Name"; Align="Left"}, @{Expression={$_.Age}; Label="Age"; Align="Right"},
        Department
        Get-Employees | Where-Object { $_.Age -gt 30 -and $_.Department -eq "Sales" } | Sort-Object Age -Descending | Select-Object -
        First 10 | Format-Table @{Expression={$_.Name}; Label="Employee Name"; Align="Left"}, @{Expression={$_.Age}; Label="Age"; Align="Right"},
        @{Expression={$_.Department}; Label="Department"; Align="Left"}
        Get-Employees | Where-Object { $_.Age -gt 30 -and $_.Department -eq "Sales" } | Sort-Object Age -Descending | Select-Object -
        First 10 | Format-Table @{Expression={$_.Name}; Label="Employee Name"; Align="Left"}, @{Expression={$_.Age}; Label="Age"; Align="Right"},
        @{Expression={$_.Department}; Label="Department"; Align="Left"} -Property Name, Age, Department
        # ... more examples ...
        #>
        [Parameter(Mandatory=$true)]
        [string]$DatabaseName,

        [Parameter(Mandatory=$true)]
        [string]$TableName,

        [Parameter(Mandatory=$true)]
        [string]$ColumnName,

        [Parameter(Mandatory=$false)]
        [string]$SortColumn,

        [Parameter(Mandatory=$false)]
        [ValidateSet("Ascending", "Descending")]
        [string]$SortOrder,

    # Parameter sets
    [Parameter(Mandatory=$false)]
    [string]$FilterExpression,

    [Parameter(Mandatory=$false)]
    [string]$AdditionalColumns,
    # ... more parameter sets...

    # Common parameter set
    [Parameter(Mandatory=$false)]
    [switch]$Count,

    [Parameter(Mandatory=$false)]
    [switch]$Debug,

    [Parameter(Mandatory=$false)]
    [switch]$ErrorActionPreference,

    [Parameter(Mandatory=$false)]
    [switch]$WarningActionPreference
    
    [Parameter(Mandatory=$false)]
    [pscredential]$Credential,

    [Parameter(Mandatory=$false)]
    [switch]$Force,

    [Parameter(Mandatory=$false)]
    [switch]$PassThru,

    [Parameter(Mandatory=$false)]
    [switch]$WhatIf,

    [Parameter(Mandatory=$false)]
    [switch]$Confirm,
    # ... more common parameters...

    # Positional parameters
    [Parameter(Mandatory=$true, Position=0)]
    [string[]]$Names,
    # ... more positional parameters...

    # Dynamic parameters
    [Parameter(Mandatory=$false)]
    [string]$DynamicParameter
    # ... function code ...
}


# Example usage
Get-Employees -DatabaseName "HRDB" -TableName "Employees" -ColumnName "Name" -SortColumn "Age" -SortOrder "Descending" -FilterExpression "Age -gt 30" -AdditionalColumns "Department" -Count -Debug -ErrorActionPreference Stop -WarningAction
Preference -Credential (Get-Credential) -Force -PassThru -WhatIf -Confirm



# Section 12.3: Mandatory Parameters
# Parameters to a function can be marked as mandatory
function Get-Greeting{
         param
         (
             [Parameter(Mandatory=$true)]$name
         )
"Hello World $name"
}

Get-Greeting -name John


# Section 12.4: Default Parameter Values
# Default values can be assigned to parameters
function Get-Greeting{
         if($uppercase){
             "Hello World $name" -as [System.String]::ToUpper()
         }else{
             "Hello World $name"
         }
         
}

Get-Greeting -name John
Get-Greeting

# If the function is invoked without a value, the command line will prompt 
# for the value:
$greeting = Get-Greeting
Write-Host $greeting


# Section 12.4: Parameter Validation
# There are a variety of ways to validate parameter entry, in PowerShell.
# Instead of writing code within functions or scripts to validate parameter values, these ParameterAttributes will
# throw if invalid values are passed.
# ValidateSet
# Sometimes we need to restrict the possible values that a parameter can accept. Say we want to allow only red,
# green and blue for the $Color parameter in a script or function.
# We can use the ValidateSet parameter attribute to restrict this. It has the additional beneﬁt of allowing tab
# completion when setting this argument (in some environments).


function Set-Color {
    param (
        [Parameter(Mandatory=$true, ValidateSet="Red","Green","Blue")]
        [string]$Color
    )
    Write-Host "Setting color to $Color"
}

Set-Color Red
Set-Color Green
Set-Color Blue
Set-Color Yellow # This will throw an error because Yellow is not in the ValidateSet


# ValidateLength
# The ValidateLength parameter attribute can be used to restrict the length of a parameter.
# It can be used to enforce a minimum or maximum length.

function Set-Length {
    param (
        [Parameter(Mandatory=$true, ValidateLength={2,50})]
        [string]$Name
    )
    Write-Host "Name is $Name"
}

Set-Length John
Set-Length Jane
Set-Length "JohnDoe" # This will throw an error because the length is greater than 50

# ValidateRange
# This method of parameter validation takes a min and max Int32 value, 
# and requires the parameter to be within that
# range.

function Set-Age {
    param (
        [Parameter(Mandatory=$true, ValidateRange=18,250)]
        [int]$Age
    )
    Write-Host "Age is $Age"
}

Set-Age 25
Set-Age 179 # This will throw an error because the age is outside the range 18-250

$ValidateRange = {18,250}
Set-Age 45 -ValidateRange $ValidateRange

# ValidatePattern
# This method of parameter validation accepts parameters that match the regex 
# pattern speciﬁed.


function Set-Name {
    param (
        [Parameter(Mandatory=$true, ValidatePattern='^[A-Za-z]+$')]
        [string]$Name
    )
    Write-Host "Name is $Name"
}

Set-Name John
Set-Name Jane
Set-Name "JohnDoe" # This will throw an error because the name contains numbers

$ValidatePatern = '^[A-Za-z]+$'
Write-Host (Set-Name "JohnDoe" -ValidatePattern $ValidatePatern)
Set-Name 'System.Management.Automation.CmdletBindingAttribute'

# Section 12.5: Parameter Coercion
# Parameter coercion is a feature in PowerShell that allows certain types to be automatically converted to other types.
# This is particularly useful when dealing with functions that take parameters of different types.
# For example, if we have a function that takes a string parameter and returns an integer, 
# we can use parameter coercion to convert the string to an integer if necessary.

function Convert-StringToInteger {
    param (
        [System.Management.Automation.CmdletBindingAttribute]$account
    )
    [int]$Input
}

$integerResult = Convert-StringToInteger 123
Write-Host $integerResult | Format-Table -AutoSize $account

# ValidateLength
# This method of parameter validation tests the length of the passed string.
function Get-StringLength {
    param (
        [Parameter(Mandatory=$true, ValidateLength={2,50})]
        [string]$Name
    )
    if ($Name.Length -lt 2 -or $Name.Length -gt 50) {
        throw "Name must be between 2 and 50 characters long"
    }
    Write-Host "Name is $Name"
}

Get-StringLength John
Get-StringLength Jane
Get-StringLength "JohnDoe" # This will throw an error because the name is too long

$ = {18,250}
Get-StringLength "JohnDoe" -ValidateLength $ValidateLength
Write-Host (Get-StringLength "JohnDoe" -ValidateLength $ValidateLength)

# ValidateCount
# This method of parameter validation tests the amount of arguments 
# passed in, for example, an array of strings.


function Get-StringCount {
    param (
        [Parameter(Mandatory=$true, ValidateCount=2)]
        [string[]]$Names
    )
    Write-Host "Names are $Names[0] and $Names[1]"
}

Get-StringCount John Doe
Get-StringCount John Doe Jane # This will throw an error because we have passed more than 2 arguments

$ = {18,250}
Get-StringCount "JohnDoe" "Jane" -ValidateCount $ValidateCount
Write-Host (Get-StringCount "JohnDoe" "Jane" -ValidateCount $ValidateCount)

$ValidateCount = 2
Get-StringCount "JohnDoe" "Jane" -ValidateCount $ValidateCount

# ValidateSet
# This method of parameter validation tests the presence of a parameter 
# in a set of allowed values.

function Get-Color {
    param (
        [Parameter(Mandatory=$true, ValidateSet="Red","Green","Blue")]
        [string]$Color
    )
    Write-Host "Color is $Color"
}

Get-Color Red
Get-Color Green


$ValidateSet = "Red","Green","Blue"
Get-Color Yellow -ValidateSet $ValidateSet

# ValidatePattern
# This method of parameter validation tests the presence of a parameter 
# in a set of allowed values based on a regex pattern.

function Get-Name {
    param (
        [Parameter(Mandatory=$true, ValidatePattern='^[A-Za-z]+$')]
        [string]$Name
    )
    Write-Host "Name is $Name"
}

Get-Name John
Get-Name Jane
Get-Name "JohnDoe" # This will throw an error because the name contains numbers

$ValidatePattern = '^[A-Za-z]+$'
Get-Name 'System.Management.Automation.ExperimentAction' -ValidatePattern $ValidatePattern

# Section 12.6: Common Parameter Attributes
# The following are some common parameter attributes in PowerShell:
# Mandatory: Indicates that the parameter is required and must be provided when the function is called.
# ValueFromPipeline: Indicates that the parameter will accept input from the pipeline.
# ValueFromRemainingArguments: Indicates that the parameter will accept input from the remaining command-line arguments.
# Positional: Indicates that the parameter should be provided as a positional parameter.


function Get-Employees {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$DatabaseName,

        [Parameter(Mandatory=$true, Position=1)]
        [string]$TableName,
        
        [Parameter(Mandatory=$true, Position=2)]
        [string]$ColumnName,

        [Parameter(Mandatory=$false)]
        [string]$SortColumn,
        
        [Parameter(Mandatory=$false)]
        [string]$SortOrder,
        
        [Parameter(Mandatory=$false)]
        [string]$FilterExpression,

        [Parameter(Mandatory=$false)]
        [string[]]$AdditionalColumns,

        [Parameter(Mandatory=$false)]
        [switch]$Count,

        [Parameter(Mandatory=$false)]
        [switch]$Debug,
        
        [Parameter(Mandatory=$false)]
        [switch]$ErrorActionPreference,

        [Parameter(Mandatory=$false)]
        [switch]$WarningActionPreference,

        [Parameter(Mandatory=$false)]
        [PSCredential]$Credential,

        [Parameter(Mandatory=$false)]
        [switch]$Force,

        [Parameter(Mandatory=$false)]
        [switch]$WhatIf,

        [Parameter(Mandatory=$false)]
        [switch]$Confirm
    )
    # Implementation of the function goes here
}

Get-Employees myDatabase myTable myColumn
Get-Employees myDatabase myTable myColumn -SortColumn lastName -SortOrder Descending -FilterExpression "Age > 30"
Get-Employees myDatabase myTable myColumn -AdditionalColumns age, department -Count
Get-Employees myDatabase myTable myColumn -Debug
Get-Employees myDatabase myTable myColumn -ErrorAction Stop
Get-Employees myDatabase myTable myColumn -WarningAction SilentlyContinue
Get-Employees myDatabase myTable myColumn -Credential (Get-Credential)
Get-Employees myDatabase myTable myColumn -Force
Get-Employees myDatabase myTable myColumn -WhatIf
Get-Employees myDatabase myTable myColumn -Confirm


# ValidateScript
# Finally, the ValidateScript method is extraordinarily ﬂexible, taking a scriptblock and evaluating it using $_ to
# represent the passed argument. It then passes the argument if the result is $true (including any output as valid).
# This can be used to test that a ﬁle exists:


function Get-File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath,

        [Parameter(Mandatory=$true, ValidateScript={Test-Path $_})]
        [string]$File
    )
    Write-Host "File path is $FilePath"
}

Get-File C:\Users\John\Documents\myFile.txt myFile.txt
Get-File C:\Users\John\Documents\myFolder myFolder.txt # This will throw an error because the folder doesn't exist

$ValidateScript = {Test-Path $_}
Get-File C:\Users\John\Documents\myFolder myFolder.txt -ValidateScript $ValidateScript

# Conclusion
# In this article, we explored the power of parameter validation in PowerShell. We covered various validation methods,
# including ValidateLength, ValidateRange, ValidateCount, ValidateSet, ValidatePattern, and ValidateScript. We also looked at
# parameter coercion, common parameter attributes, and the ValidateScript method. By understanding these concepts, you can create
# more robust and secure PowerShell functions.

