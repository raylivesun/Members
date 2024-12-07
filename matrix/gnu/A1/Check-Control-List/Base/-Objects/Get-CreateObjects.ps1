#!/home/admin/app/PowerShell/Members

# PowerShell, unlike some other scripting languages, sends objects through 
# the pipeline. What this means is that when you send data from one command 
# to another, it's essential to be able to create, modify, and collect objects.
# Creating an object is simple. Most objects you create will be custom objects 
# in PowerShell, and the type to use for that is PSObject. PowerShell will also 
# allow you to create any object you could create in .NET. Here's an example of 
# creating a new objects with a few properties:


# Create a new PSObject
$member = New-Object PSObject -Property @{
    FirstName = 'John'
    LastName = 'Doe'
    Email = 'johndoe@example.com'
    PhoneNumber = '555-123-4567'
}

# Add the new member object to an array
$members = @($members, $member)

# Output the updated array
$members
$members.BaseObject.Count
$members.BaseObject | Format-Table FirstName, LastName, Email, PhoneNumber
$members.BaseObject | Select-Object -First 3
$members.BaseObject | Where-Object { $_.FirstName -like 'J*' }
$members.BaseObject | Sort-Object LastName -Descending
$members.BaseObject | Format-Table @{Expression = { $_.FirstName }; Label = 'First Name'; Width = 10 }, LastName, Email, PhoneNumber
$members.BaseObject | Measure-Object -Property Length -Average
$members.BaseObject | Where-Object { $_.PhoneNumber -like '555*' } | Format-Table FirstName, LastName, Email, PhoneNumber
$members.BaseObject | Where-Object { $_.PhoneNumber -like '555*' } | Sort-Object LastName -Descending | Format-Table FirstName, LastName,
$members.Count # How many members are in the array
$members.ImmediateBaseObject.Length # How many members are in the array
$members.BaseObject | Measure-Object -Property Length -Average
$members.IsFixedSize # Is the array fixed size?
$members.IsSynchronized # Is the array synchronized?
$members.SyncRoot # Get the synchronization root for the array.
$members.Length # Get the number of elements in the array.
$members.TypeNames # Get the type names of the array.
$members.Address()

