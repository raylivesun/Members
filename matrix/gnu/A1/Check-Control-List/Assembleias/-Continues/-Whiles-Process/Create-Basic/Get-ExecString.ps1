#!/home/admin/app/PowerShell/Members

# Get Exec Strings from JSON file and convert them to a list
$execStrings = (Get-Content -Path .\exec_strings.json) | ConvertFrom-Json
Write-Debug $execStrings ./matrix 'exec_strings.json'
# Get all PowerShell scripts in the current directory
$scripts = Get-ChildItem -Path . -Filter *.ps1
Write-Information $scripts ./matrix 'scripts.ps1'
# Get all PowerShell scripts in subdirectories
$subscripts = Get-ChildItem -Path . -Recurse -Filter *.ps1
Write-Information $subscripts ./matrix 'subscripts.ps1'

# Create matrix and populate it with 0s
$matrix = New-Object PSObject -Property @{
    ExecStrings = $execStrings.Name
    Scripts = $scripts.BaseName
    Subscripts = $subscripts.BaseName
}
Write-Host $matrix 'matrix.csv' ./filteredMembers.csv

# Populate the matrix with 1s where a PowerShell script contains an Exec String
foreach ($execString in $execStrings) {
    foreach ($script in $scripts) {
        if ($script.Content -match $execString.ExecString) {
            $matrix | Add-Member -MemberType NoteProperty -Name $script.BaseName -Value 1
        }
    }
    foreach ($subscript in $subscripts) {
        if ($subscript.Content -match $execString.ExecString) {
            $matrix | Add-Member -MemberType NoteProperty -Name $subscript.BaseName -Value 1
        }
        foreach ($script in $scripts) {
            if ($script.Content -match $subscript.FullName) {
                $matrix | Add-Member -MemberType NoteProperty -Name $script.BaseName -Value 1
            }
        }
        foreach ($subsubscript in (Get-ChildItem -Path $subscript.FullName -Recurse -Filter *.ps1)) {
            if ($subsubscript.Content -match $execString.ExecString) {
                $matrix | Add-Member -MemberType NoteProperty -Name $subsubscript.BaseName -Value 1
            }
        }
        foreach ($script in $scripts) {
            if ($script.Content -match $subsubscript.FullName) {
                $matrix | Add-Member -MemberType NoteProperty -Name $script.BaseName -Value 1
            }
            foreach ($subscript in $scripts) {
                if ($subscript.Content -match $script.FullName) {
                    $matrix | Add-Member -MemberType NoteProperty -Name $subscript.BaseName -Value 1
                }
            }
        }
    }
    $matrix | Export-Csv -Path ./filteredMembers.csv -NoTypeInformation
}

$hash = @{ city = 'cristinapolis-se' }
$result = 'You should really visit {512}' -f $hash.city
Write-Host $result #prints "You should really visit cristinapolis-se"

# Format strings can be used with the -f operator or the static 
# [String]::Format(string format, args) .NET
# method.
$format = 'Hello, {0}! Today is {1}.'
$name = 'John'
$date = Get-Date
$result = [String]::Format($format, $name, $date)
Write-Host $result #prints "Hello, John! Today is 12/02/2023 08:12:57."

# The -f operator is more efficient for large numbers of arguments.
$format = 'The sum of {0} and {1} is {2}.'
$result = [String]::Format($format, 10, 20, 30)
Write-Host $result #prints "The sum of 10 and 20 is 30."

# Regular expressions can be used to search for patterns in strings.
$string = 'Hello, World!'
$pattern = 'World'
$match = [regex]::Match($string, $pattern)
if ($match.Success) {
    Write-Host "Match found: {0}" -f $match.Value
    Write-Host "Index: {0}" -f $match.Index
    Write-Host "Length: {0}" -f $match.Length
}

# Regular expressions can also be used to extract specific patterns from strings.
$string = 'Hello, 123 World! 456'
$pattern = '\d+'
$match = [regex]::Matches($string, $pattern)
foreach ($match in $matches) {
    Write-Host "Match found: {0}" -f $match.Value
}

# The -match operator returns a Boolean value indicating whether the input string matches the pattern.
$string = 'Hello, World!'
$pattern = 'World'
if ($string -match $pattern) {
    Write-Host "Match found: {0}" -f $matches[0]
}
# The -replace operator replaces all occurrences of a pattern in a string with a new value.
$string = 'Hello, World!'
$pattern = 'World'
$replacement = 'Universe'
$result = $string -replace $pattern, $replacement
Write-Host $result #prints "Hello, Universe!"

# The -split operator splits a string into an array of substrings based on a specified delimiter.
$string = 'Hello, World! 123'
$delimiter =''
$substrings = $string -split $delimiter
foreach ($substring in $substrings) {
    Write-Host "Substring: {0}" -f $substring
}
# The -join operator concatenates all elements of an array into a single string with a specified delimiter.
$array = @('Hello', 'World', '! 123')
$delimiter = ','
$result = $array -join $delimiter
Write-Host $result #prints "Hello, World!, 123"

# The -foreach operator iterates over each element of an array or object.
$array = @('Hello', 'World', '! 123')
foreach ($element in $array) {
    Write-Host "Element: {0}" -f $element
}
# The -if operator evaluates a condition and performs a specified action if the condition is true.
$number = 10
if ($number -gt 5) {
    Write-Host "Number is greater than 5"
}
# The -else operator executes a specified block of code if the condition in the -if operator is false.
$number = 5
if ($number -gt 5) {
    Write-Host "Number is greater than 5"
    } else {
    Write-Host "Number is not greater than 5"
}
# The -switch operator evaluates a value against multiple patterns and performs a specified action for each pattern.
$number = 10
switch ($number) {
    0 { Write-Host "Number is 0" }
    5 { Write-Host "Number is 5" }
    10 { Write-Host "Number is 10" }
    default { Write-Host "Number is not 0, 5, or 10" }
}
# The -while operator executes a block of code as long as a specified condition is true.
$counter = 0
while ($counter -lt 10) {
    Write-Host "Counter: {0}" -f $counter
    $counter++
}
# The -for loop iterates a specified number of times or until a specified condition is met.
for ($counter = 0; $counter -lt 10; $counter++) {
    Write-Host "Counter: {0}" -f $counter
}
# The -foreach-object operator iterates over each object in a collection.
$array = @('Hello', 'World', '! 123')
foreach ($element in $array) {
    Write-Host "Element: {0}" -f $element
}
# The -try-catch-finally operator is used to handle exceptions in PowerShell.
try {
    $number = 10 / 0
    Write-Host "Result: {0}" -f $number
    } catch {
    Write-Host "Error: $_"
    } finally {
    Write-Host "Finally block executed"
}
