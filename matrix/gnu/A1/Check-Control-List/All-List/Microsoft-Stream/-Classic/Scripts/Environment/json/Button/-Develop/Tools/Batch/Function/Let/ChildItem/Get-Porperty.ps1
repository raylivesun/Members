#!/home/admin/app/PowerShell/Members

# Child Item Info Function to retrieve child item information
Get-ChildItem | Select-Object FullName, Name,
@{Name='DateTime'; Expression={Get-Date}},
@{Name='PropertyName'; Expression={'CustomValue'}}


# Custom Property Value Function to calculate the sum of property values
function Calculate-CustomPropertySum {
    param(
        [Parameter(Mandatory=$true)]
        [Object[]]$ObjectArray
    )

    $sum = 0
    foreach ($obj in $ObjectArray) {
        $sum += $obj.CustomValue
    }

    return $sum
}


# Calculate the sum of property values for all child items
$childItemSum = Calculate-CustomPropertySum (Get-ChildItem)

Write-Host "Total sum of CustomValue property for all child items: $childItemSum"


# Calculate the average of property values for all child items
$childItemAverage = $childItemSum / (Get-ChildItem | Measure-Object).Count

Write-Host "Average of CustomValue property for all child items: $childItemAverage"


# Find the child item with the highest CustomValue
$highestCustomValueItem = Get-ChildItem | Sort-Object CustomValue -Descending | Select-Object -First 1

Write-Host "Child item with the highest CustomValue: $($highestCustomValueItem.FullName)"


# Find the child item with the lowest CustomValue
$lowestCustomValueItem = Get-ChildItem | Sort-Object CustomValue | Select-Object -Last 1

Write-Host "Child item with the lowest CustomValue: $($lowestCustomValueItem.FullName)"


# Find the child item with the highest DateTime value
$highestDateTimeItem = Get-ChildItem | Sort-Object DateTime -Descending | Select-Object -First 1

Write-Host "Child item with the highest DateTime value: $($highestDateTimeItem.FullName)"


# Find the child item with the lowest DateTime value
$lowestDateTimeItem = Get-ChildItem | Sort-Object DateTime | Select-Object -Last 1

Write-Host "Child item with the lowest DateTime value: $($lowestDateTimeItem.FullName)"


# Find the child items with a DateTime value within the last 24 hours
$last24HoursDateTime = (Get-Date).AddHours(-24)

$itemsInLast24Hours = Get-ChildItem | Where-Object { $_.DateTime -ge $last24HoursDateTime }

Write-Host "Child items with a DateTime value within the last 24 hours:"
$itemsInLast24Hours | Format-Table FullName, DateTime


# Find the child items with a CustomValue greater than the average
$averageCustomValue = $childItemAverage

$itemsWithHighCustomValue = Get-ChildItem | Where-Object { $_.CustomValue -gt $averageCustomValue }

Write-Host "Child items with a CustomValue greater than the average:"
$itemsWithHighCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue less than the average
$itemsWithLowCustomValue = Get-ChildItem | Where-Object { $_.CustomValue -lt $averageCustomValue }

Write-Host "Child items with a CustomValue less than the average:"
$itemsWithLowCustomValue | Format-Table FullName, CustomValue


# Find the child items with a DateTime value within a specific range
$startDate = Get-Date '2021-01-01'
$endDate = Get-Date '2021-12-31'

$itemsInRange = Get-ChildItem | Where-Object { $_.DateTime -ge $startDate -and $_.DateTime -le $endDate }

Write-Host "Child items with a DateTime value within the range from $startDate to $endDate:"
$itemsInRange | Format-Table FullName, DateTime


# Find the child items with a CustomValue within a specific range
$customValueStart = 50
$customValueEnd = 100

function A57-Matrix-Multiply($matrix1, $matrix2) {
    param (
        OptionalParameters
    )
    $result = New-Object -TypeName PSObject -Property @{
        Rows = $matrix1.Count
        Columns = $matrix2[0].Count
    }

    foreach ($row in 0..($result.Rows - 1)) {
        foreach ($col in 0..($result.Columns - 1)) {
            $result[$row, $col] = 0
            foreach ($i in 0..($matrix1[0].Count - 1)) {
                $result[$row, $col] += $matrix1[$row, $i] * $matrix2[$i, $col]
            }
    
            if ($result[$row, $col] -ge $customValueStart -and $result[$row, $col] -le $customValueEnd) {
                $result[$row, $col] = 'CustomValueInRange'
            }
        }
        $result[$row] | Format-Table -AutoSize
    }
    return $result
}
    

$matrix1 = @((1..3), (4..6), (7..9))


$matrix2 = @((10..12), (13..15), (16..18))

Write-Host "Matrix 1:"
$matrix1 | Format-Table -AutoSize

Write-Host "Matrix 2:"
$matrix2 | Format-Table -AutoSize

$multipliedMatrix = A57-Matrix-Multiply $matrix1 $matrix2

Write-Host "Multiplied Matrix with CustomValueInRange for values between $customValueStart and $customValueEnd:"
$multipliedMatrix | Format-Table -AutoSize


# Find the child items with a CustomValue that is a perfect square
function Is-PerfectSquare($number) {
    $sqrt = [math]::Sqrt($number)
    return [int]$sqrt * [int]$sqrt -eq $number
}

$itemsWithPerfectSquareCustomValue = Get-ChildItem | Where-Object { Is-PerfectSquare $_.CustomValue }

Write-Host "Child items with a CustomValue that is a perfect square:"
$itemsWithPerfectSquareCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a prime number
function Is-Prime($number) {
    if ($number -le 1) {
        return $false

        } elseif ($number -eq 2) {
        return $true

        } elseif ($number % 2 -eq 0) {
        return $false

        } else {
            for ($i = 3; $i -le [math]::Sqrt($number); $i += 2) {
                if ($number % $i -eq 0) {
                    return $false
                }
            }
            return $true
        }
}

$itemsWithPrimeCustomValue = Get-ChildItem | Where-Object { Is-Prime $_.CustomValue }

Write-Host "Child items with a CustomValue that is a prime number:"
$itemsWithPrimeCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a Fibonacci number
function Is-Fibonacci($number) {
    $sqrt5 = [Math]::Sqrt(5)
    $phi = (1 + $sqrt5) / 2
    $phiMinus1 = $phi - 1
    $phiMinus1PowerNumber = $phiMinus1 ** $number

    return $phiMinus1PowerNumber -is [int]
}

$itemsWithFibonacciCustomValue = Get-ChildItem | Where-Object { Is-Fibonacci $_.CustomValue }

Write-Host "Child items with a CustomValue that is a Fibonacci number:"
$itemsWithFibonacciCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a perfect cube
function Is-PerfectCube($number) {
    $sqrt = [math]::Pow($number, 1/3)
    return [int]$sqrt * [int]$sqrt * [int]$sqrt -eq $number
}

$itemsWithPerfectCubeCustomValue = Get-ChildItem | Where-Object { Is-PerfectCube $_.CustomValue }

Write-Host "Child items with a CustomValue that is a perfect cube:"
$itemsWithPerfectCubeCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a palindrome
function Is-Palindrome($number) {
    $numberString = [string]$number
    return $numberString -eq $numberString -reverse
}

$itemsWithPalindromeCustomValue = Get-ChildItem | Where-Object { Is-Palindrome $_.CustomValue }

Write-Host "Child items with a CustomValue that is a palindrome:"
$itemsWithPalindromeCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a prime number and a perfect square
function Is-PrimeAndPerfectSquare($number) {
    return Is-Prime($number) -and Is-PerfectSquare($number)
}

$itemsWithPrimeAndPerfectSquareCustomValue = Get-ChildItem | Where-Object { Is-PrimeAndPerfectSquare $_.CustomValue }

Write-Host "Child items with a CustomValue that is a prime number and a perfect square:"
$itemsWithPrimeAndPerfectSquareCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a prime number and a Fibonacci number
function Is-PrimeAndFibonacci($number) {
    return Is-Prime($number) -and Is-Fibonacci($number)
}

$itemsWithPrimeAndFibonacciCustomValue = Get-ChildItem | Where-Object { Is-PrimeAndFibonacci $_.CustomValue }

Write-Host "Child items with a CustomValue that is a prime number and a Fibonacci number:"
$itemsWithPrimeAndFibonacciCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a prime number and a perfect cube
function Is-PrimeAndPerfectCube($number) {
    return Is-Prime($number) -and Is-PerfectCube($number)
}

$itemsWithPrimeAndPerfectCubeCustomValue = Get-ChildItem | Where-Object { Is-PrimeAndPerfectCube $_.CustomValue }

Write-Host "Child items with a CustomValue that is a prime number and a perfect cube:"
$itemsWithPrimeAndPerfectCubeCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a prime number and a palindrome
function Is-PrimeAndPalindrome($number) {
    return Is-Prime($number) -and Is-Palindrome($number)
}

$itemsWithPrimeAndPalindromeCustomValue = Get-ChildItem | Where-Object { Is-PrimeAndPalindrome $_.CustomValue }

Write-Host "Child items with a CustomValue that is a prime number and a palindrome:"
$itemsWithPrimeAndPalindromeCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a perfect square and a Fibonacci number
function Is-PerfectSquareAndFibonacci($number) {
    return Is-PerfectSquare($number) -and Is-Fibonacci($number)
}

$itemsWithPerfectSquareAndFibonacciCustomValue = Get-ChildItem | Where-Object { Is-PerfectSquareAndFibonacci $_.CustomValue }

Write-Host "Child items with a CustomValue that is a perfect square and a Fibonacci number:"
$itemsWithPerfectSquareAndFibonacciCustomValue | Format-Table FullName, CustomValue


# Find the child items with a CustomValue that is a perfect square and a perfect cube
function Is-PerfectSquareAndPerfectCube($number) {
    return Is-PerfectSquare($number) -and Is-PerfectCube($number)
}

$itemsWithPerfectSquareAndPerfectCubeCustomValue = Get-ChildItem | Where-Object { Is-PerfectSquareAndPerfectCube $_.CustomValue }

Write-Host "Child items with a CustomValue that is a perfect square and a perfect cube:"
$itemsWithPerfectSquareAndPerfectCubeCustomValue | Format-Table FullName, CustomValue

$foo = 'bar'
Write-Host "The value of $foo is: $foo"


# Find the child items with a CustomValue that is a palindrome and a prime number
function Is-PalindromeAndPrime($number) {
    return Is-Palindrome($number) -and Is-Prime($number)
}

$itemsWithPalindromeAndPrimeCustomValue = Get-ChildItem | Where-Object { Is-PalindromeAndPrime $_.CustomValue }

Write-Host "Child items with a CustomValue that is a palindrome and a prime number:"
$itemsWithPalindromeAndPrimeCustomValue | Format-Table FullName, CustomValue


$myArrayOfInts = 1,2,3,4
$myArrayOfStrings = "1","2","3","4"

Write-Host "Array of integers: $($myArrayOfInts -join ',')"
Write-Host "Array of strings: $($myArrayOfStrings -join ',')"


$myArray = 1,2,3,4
Write-Host "Array before sorting: $($myArray -join ',')"
$myArray | Sort-Object | Format-Table -AutoSize


$myDict = @{
    'Name' = 'John Doe'
    'Age' = 30
    'City' = 'New York'
}

Write-Host "Dictionary:"
$myDict | Format-Table -AutoSize


$myCustomObject = New-Object PSObject -Property @{
    Name = 'John Doe'
    Age = 30
    City = 'New York'
}

Write-Host "Custom object:"
$myCustomObject | Format-Table -AutoSize


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.ToUpper()
Write-Host "Uppercase string: $myString"


$myArray = 1,2,3,4
Write-Host "Original array: $($myArray -join ',')"
$myArray = $myArray | Sort-Object
Write-Host "Sorted array: $($myArray -join ',')"


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
Write-Host "Reversed string: $myString"


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Length
Write-Host "Length of string: $myString"


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.ToLower()
Write-Host "Lowercase string: $myString"


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Substring(6)
Write-Host "Substring from index 6: $myString"


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Substring(0, 5)
Write-Host "Substring from index 0 to 5: $myString"


$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Replace("World", "Universe")
Write-Host "String with 'World' replaced with 'Universe': $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Split(",")
Write-Host "Array of strings: $($myString -join ',')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.TrimStart("Hello, ")
Write-Host "String with leading 'Hello, ' trimmed: $myString"

$myString = " Hello, World! "
Write-Host "Original string: $myString"
$myString = $myString.TrimEnd(" ")
Write-Host "String with trailing ' ' trimmed: $myString"

$myString = " Hello, World! "
Write-Host "Original string: $myString"
$myString = $myString.Trim()
Write-Host "String with leading and trailing ' ' trimmed: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = [char[]]$myString | Sort-Object
Write-Host "Sorted characters: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.ToCharArray() | Sort-Object
Write-Host "Sorted characters: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
Write-Host "Reversed string: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '^[aeiouAEIOU]+$'
Write-Host "Number of vowels: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '[aeiouAEIOU]'
Write-Host "Number of vowels: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]'
Write-Host "Number of consonants: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '^[^aeiouAEIOU]+$'
Write-Host "Number of consonants: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '\d'
Write-Host "Number of digits: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '[0-9]'
Write-Host "Number of digits: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '\W'
Write-Host "Number of special characters: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '[^a-zA-Z0-9]'
Write-Host "Number of special characters: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '\s'
Write-Host "Number of spaces: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count -match '[\s]'
Write-Host "Number of spaces: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.ToCharArray() | Measure-Object -Property Length -Sum
Write-Host "Total number of characters: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Length
Write-Host "Total number of characters: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Count
Write-Host "Total number of characters: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters: $myString.Count"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Distinct()
Write-Host "Unique characters: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
$myString = $myString.Distinct()
Write-Host "Reversed and unique characters: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters in reversed string: $myString.Count"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
Write-Host "Unique characters in reversed string: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()

$myArrayOfInts = $myArrayOfInts + 5
# now contains 1,2,3,4 & 5!

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters in reversed string: $myString.Count"

$myString = $myString.Reverse()
Write-Host "Unique characters in reversed string: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters in reversed string: $myString.Count"

$myString = $myString.Reverse()
Write-Host "Unique characters in reversed string: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()

$myArrayOfInts = 1,2,3,4
$myOtherArrayOfInts = 5,6,7
$myArrayOfInts = $myArrayOfInts + $myOtherArrayOfInts
# now 1,2,3,4,5,6,7

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters in reversed string: $myString.Count"

$myString = $myString.Reverse()
Write-Host "Unique characters in reversed string: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()

$myArrayOfStrings = "Hello", "World"
$myOtherArrayOfStrings = "Goodbye", "Cruel World"
$myArrayOfStrings = $myArrayOfStrings + $myOtherArrayOfStrings
# now Hello,World,Goodbye,Cruel World

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters in reversed string: $myString.Count"

$myString = $myString.Reverse()
Write-Host "Unique characters in reversed string: $($myString -join '')"

$myString = "Hello, World!"
Write-Host "Original string: $myString"
$myString = $myString.Reverse()

$myArrayOfStrings = "Hello", "World"
$myOtherArrayOfStrings = "Goodbye", "Cruel World"
$myArrayOfStrings = $myArrayOfStrings + $myOtherArrayOfStrings
$myString = $myArrayOfStrings -join ''

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length -Sum
Write-Host "Total number of unique characters in reversed string: $myString"

$myString = $myString.Reverse()
$myString = $myString.Distinct() | Measure-Object -Property Length
Write-Host "Number of unique characters in reversed string: $myString.Count"

$myString = $myString.Reverse()
Write-Host "Unique characters in reversed string: $($myString -join '')"

$input = "foo.bar.baz"
$parts = $input.Split(".")
$foo = $parts[0]
$bar = $parts[1]
$baz = $parts[2]

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$input = "foo.bar.baz"
$parts = $input.Split(".")
$foo, $bar, $baz = $parts

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"


$foo, $bar, $baz = $input.Split(".")

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$input = "foo.bar.baz"
$parts = $input.Split(".")
$foo, $bar, $baz = $parts

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$input = "foo.bar.baz"
$parts = $input.Split(".")
$foo, $bar, $baz = $parts

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$foo, $leftover = $input.Split(".") #Sets $foo = "foo", $leftover = ["bar","baz"]
$bar = $leftover[0] # $bar = "bar"
$baz = $leftover[1] # $baz = "baz"

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$input = "foo.bar.baz"
$parts = $input.Split(".")
$foo, $bar, $baz = $parts

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$foo, $bar, $baz = $input.Split(".", 2) # Sets $foo = "foo", $bar = "bar", $baz = "baz"

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$input = "foo.bar.baz"
$parts = $input.Split(".")
$foo, $bar, $baz = $parts

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$foo, $bar, $baz = $input.Split(".", 2) # Sets $foo = "foo", $bar = "bar", $baz = "baz"

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$input = "foo.bar.baz"
$parts = $input.Split(".", 2)
$foo, $leftover = $parts
$bar = $leftover[0] # $bar = "bar"
$baz = $leftover[1] # $baz = "baz"

Write-Host "foo: $foo"
Write-Host "bar: $bar"
Write-Host "baz: $baz"

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo

$foo = "Global Scope"
function myFunc {
$foo = "Function (local) scope"
Write-Host $global:foo
Write-Host $local:foo
Write-Host $foo
}
myFunc
Write-Host $local:foo
Write-Host $foo


Remove-Item Variable:\foo

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var  



$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

$var = "Some Variable" #Define variable 'var' containing the string 'Some Variable'
$var #For test and show string 'Some Variable' on the console
Remove-Variable -Name var
$var
#also can use alias 'rv'
rv var

i # Case-Insensitive Explicit (-ieq)
c # Case-Sensitive Explicit (-ceq)
$a = "Hello"
$b = "hello"
$a -ieq $b # Returns: True
$a -ceq $b # Returns: False

2 -eq 2
2 -ne 4
5 -gt 2
5 -ge 5
5 -lt 10
5 -le 5
# Equal to (==)
# Not equal to (!=)
# Greater-than (>)
# Greater-than or equal to (>=)
# Less-than (<)
# Less-than or equal to (<=)

$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
} elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}

$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
    } elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}

$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
    } elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}


$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
    } elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}

$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
    } elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}

$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
    } elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}


$a = 5
$b = 10
if ($a -gt $b) {
    Write-Host "$a is greater than $b"
    } elseif ($a -eq $b) {
    Write-Host "$a is equal to $b"
    } else {
    Write-Host "$a is less than $b"
}

"MyString" -like "*String"
"MyString" -notlike "Other*"
"MyString" -match '^String$'
"MyString" -notmatch '^Other$'
# Match using the wildcard character (*)
# Does not match using the wildcard character (*)
# Matches a string using regular expressions
# Does not match a string using regular expressions

$array = 1, 2, 3, 4, 5
$sum = 0
foreach ($item in $array) {
    $sum += $item
}
$sum

$array = 1, 2, 3, 4, 5
$sum = 0
foreach ($item in $array) {
    $sum += $item
}
$sum

$array = 1, 2, 3, 4, 5
$sum = 0
foreach ($item in $array) {
    $sum += $item
}
$sum

$array = 1, 2, 3, 4, 5
$sum = 0
foreach ($item in $array) {
    $sum += $item
}
$sum
