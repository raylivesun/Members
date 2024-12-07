#!/home/admin/app/PowerShell/Members

# Section 12.5: Simple Function with No Parameters
# This is an example of a function which returns a string. In the example, the function is called in a statement
# assigning a value to a variable. The value in this case is the return value of the function.


function Get-HelloWorld() {
    return "Hello, World Edge Browser!"
}

$greeting = Get-HelloWorld

Write-Host $greeting


# Section 12.6: Function with Parameter
# This example demonstrates a function with a parameter. In this case, the function is called in a statement
# and the parameter is passed to the function. The function then uses the parameter to modify its behavior.

function Get-Greeting($name) {
    return "Hello, $name!"
}

$greeting = Get-Greeting "John Doe"

Write-Host $greeting


# Section 12.7: Function with Default Parameter
# This example demonstrates a function with a default parameter. In this case, if no parameter is passed to the function,
# the default value will be used.

function Get-GreetingWithDefault($name = "World") {
    return "Hello, $name!"
}

$greeting = Get-GreetingWithDefault

Write-Host $greeting
