#!/home/admin/app/PowerShell/Members

"abc", "def" -contains "def"
"abc", "def" -notcontains "123"
"def" -in "abc", "def"
"123" -notin "abc", "def"
# Returns true when the value (right) is present
# in the array (left)
# Returns true when the value (right) is not present
# in the array (left)
# Returns true when the value (left) is present
# in the array (right)
# Returns true when the value (left) is not present
# in the array (right)

123 -notin 123, 456, 789
# Returns true when the value (left) is not present
# in the array (right)
# Returns false when the value (left) is present
# in the array (right)
# Returns false when the value (left) is not present
# in the array (right)

123 -in 123, 456, 789
# Returns false when the value (left) is present
# in the array (right)
# Returns true when the value (left) is not present
# in the array (right)
# Returns false when the value (left) is present
# in the array (right)

123 -contains 123, 456, 789
# Returns false when the value (left) is not present
# in the array (right)
# Returns false when the value (left) is present
# in the array (right)
# Returns true when the value (left) is present
# in the array (right)

123 -notcontains 123, 456, 789
# Returns true when the value (left) is not present
# in the array (right)
# Returns true when the value (left) is present
# in the array (right)
# Returns false when the value (left) is not present
# in the array (right)

123, 456, 789 -contains 123
# Returns true when the value (left) is present
# in the array (right)
# Returns true when the value (left) is not present
# in the array (right)
# Returns true when the value (left) is present
# in the array (right)

123, 456, 789 -notcontains 123
# Returns false when the value (left) is present
# in the array (right)
# Returns false when the value (left) is not present
# in the array (right)
# Returns false when the value (left) is present
# in the array (right)

123, 456, 789 -in 123
# Returns true when the value (left) is present
# in the array (right)
# Returns false when the value (left) is not present
# in the array (right)
# Returns false when the value (left) is present
# in the array (right)

function A58-MatrixElement {
    param (
        OptionalParameters
        [Parameter(Mandatory=$true, Position=0)]
        [string[]]$Array1,

        [Parameter(Mandatory=$true, Position=1)]
        [string[]]$Array2

    )
    if ($Array1.Contains($Array2)) {
        return $true
    } else {
        return $false
    }
}
A58-MatrixElement "abc", "def"
    
123 -notin 123, 456, 789

123 -in 123, 456, 789

123 -contains 123, 456, 789

123 -notcontains 123, 456, 789

123, 456, 789 -contains 123

123, 456, 789 -notcontains 123

123, 456, 789 -in 123

A58-MatrixElement "abc", "def"

function A59-MatrixElementCool {
    param (
        OptionalParameters
    )
    [Parameter(Mandatory=$true, Position=0)]
    [string[]]$Array1,

    [Parameter(Mandatory=$true, Position=1)]
    [string[]]$Array2

    if ($Array1.Intersect($Array2).Count -eq $Array1.Count) {
        return $true
    } else {
        return $false
    }
}

123 -notin 123, 456, 789

123 -in 123, 456, 789

123 -contains 123, 456, 789

123 -notcontains 123, 456, 789

123, 456, 789 -contains 123

123, 456, 789 -notcontains 123

123, 456, 789 -in 123

A59-MatrixElement-Strict "abc", "def"

    
function A60-MatrixElementFast {
    param (
        OptionalParameters
    )
    [Parameter(Mandatory=$true, Position=0)]
    [string[]]$Array1,

    [Parameter(Mandatory=$true, Position=1)]
    [string[]]$Array2
    $Array1 | ForEach-Object {
        if ($Array2 -contains $_) {
            return $true
        }
    }
    return $false

    
}

123 -notin 123, 456, 789

123 -in 123, 456, 789

123 -contains 123, 456, 789

123 -notcontains 123, 456, 789

123, 456, 789 -contains 123

123, 456, 789 -notcontains 123

123, 456, 789 -in 123

A60-MatrixElementFast "abc", "def"

function A61-MatrixCollection {
    param (
        OptionalParameters
        [Parameter(Mandatory=$true, Position=0)]
        [string[]]$Array1,

        [Parameter(Mandatory=$true, Position=1)]
        [string[]]$Array2
        [Parameter(Mandatory=$true, Position=2)]
        [string[]]$Array3
        [Parameter(Mandatory=$true, Position=3)]
        [string[]]$Array4
        [Parameter(Mandatory=$true, Position=4)]
        [string[]]$Array5
        [Parameter(Mandatory=$true, Position=5)]
        [string[]]$Array6
        [Parameter(Mandatory=$true, Position=6)]
        [string[]]$Array7
        [Parameter(Mandatory=$true, Position=7)]
        [string[]]$Array8
        [Parameter(Mandatory=$true, Position=8)]
        [string[]]$Array9
        [Parameter(Mandatory=$true, Position=9)]
        [string[]]$Array10
        [Parameter(Mandatory=$true, Position=10)]
        [string[]]$Array11
        [Parameter(Mandatory=$true, Position=11)]
        [string[]]$Array12
        [Parameter(Mandatory=$true, Position=12)]
        [string[]]$Array13
        [Parameter(Mandatory=$true, Position=13)]
        [string[]]$Array14
        [Parameter(Mandatory=$true, Position=14)]
        [string[]]$Array15
        [Parameter(Mandatory=$true, Position=15)]
        [string[]]$Array16
        [Parameter(Mandatory=$true, Position=16)]
        [string[]]$Array17
        [Parameter(Mandatory=$true, Position=17)]
        [string[]]$Array18
        [Parameter(Mandatory=$true, Position=18)]
        [string[]]$Array19
        [Parameter(Mandatory=$true, Position=19)]
        [string[]]$Array20
        [Parameter(Mandatory=$true, Position=20)]
        [string[]]$Array21
        [Parameter(Mandatory=$true, Position=21)]
        [string[]]$Array22
        [Parameter(Mandatory=$true, Position=22)]
        [string[]]$Array23
        [Parameter(Mandatory=$true, Position=23)]
        [string[]]$Array24
        [Parameter(Mandatory=$true, Position=24)]
        [string[]]$Array25
        [Parameter(Mandatory=$true, Position=25)]
        [string[]]$Array26
        [Parameter(Mandatory=$true, Position=26)]
        [string[]]$Array27
        [Parameter(Mandatory=$true, Position=27)]
    )
    
    $Arrays = @($Array1, $Array2, $Array3, $Array4, $Array5, $Array6, $Array7, $Array8, $Array9
    $Array10, $Array11, $Array12, $Array13, $Array14, $Array15, $Array16, $Array17
    $Array18, $Array19, $Array20, $Array21, $Array22, $Array23, $Array24, $Array25
    $Array26, $Array27)
    
    foreach ($Array in $Arrays) {
        if ($Array1.Contains($Array)) {
            return $true
        }
    }
    return $false

}

1 + 2
1 - 2
-1
1 * 2
1 / 2
1 % 2
# Addition
# Subtraction
# Set negative value
# Multiplication
# Division
# Modulus

1 + 2 - 3 * 4 / 5 % 6
# Addition
# Subtraction
# Multiplication
# Division
# Modulus

1 + 2 - 3 * (4 / 5) % 6
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

1 + 2 - 3 * (4 / (5 % 6))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

1 + 2 - 3 * (4 / (5 % 6))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5
$f = 6
$g = 7
$h = 8
$i = 9
$j = 10
$k = 11
$l = 12
$m = 13
$n = 14
$o = 15
$p = 16
$q = 17
$r = 18
$s = 19
$t = 20
$u = 21
$v = 22
$w = 23
$x = 24
$y = 25
$z = 26

$a + $b - $c * $d / $e % $f
# Addition
# Subtraction
# Multiplication
# Division
# Modulus

1 + 2 - 3 * (4 / 5) % 6
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

$a + $b - $c * ($d / $e) % $f
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

1 + 2 - $c * ($d / ($e % $f))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

$a + $b - $c * ($d / ($e % $f))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

1 + 2 - $c * ($d / ($e % $f))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

$a + $b - $c * ($d / ($e % $f))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division
# Modulus

1 + 2 - $c * ($d / ($e % $f))
# Addition
# Subtraction
# Parentheses
# Multiplication
# Division

100 -shl 2 # Bitwise Shift-left
100 -shr 1 # Bitwise Shift-right
100 -band 15 # Bitwise AND
100 -bor 15 # Bitwise OR
100 -bxor 15 # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$a -shl $b # Bitwise Shift-left
$a -shr $b # Bitwise Shift-right
$a -band $b # Bitwise AND
$a -bor $b # Bitwise OR
$a -bxor $b # Bitwise XOR

$a = 100
$b = 2

$var = 1
$var += 2
$var -= 1
$var *= 2
$var /= 2
$var %= 2
# Assignment. Sets the value of a variable to the specified value
# Addition. Increases the value of a variable by the specified value
# Subtraction. Decreases the value of a variable by the specified value
# Multiplication. Multiplies the value of a variable by the specified value
# Division. Divides the value of a variable by the specified value
# Modulus. Divides the value of a variable by the specified value and then
# assigns the remainder (modulus) to the variable

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a += $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a -= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a *= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a /= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a %= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a += $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a -= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a *= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a /= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a %= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a += $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a -= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a *= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a /= $b
$a

$a = 1
$b = 2
$c = 3
$d = 4
$e = 5

$a %= $b
$a

$var++
$var--
# Increases the value of a variable, assignable property, or array element by 1
# Decreases the value of a variable, assignable property, or array element by 1

$a = 1
$var = $a++
$var

$a = 1
$var = $a--
$var

$a = 1
$var = $a++
$var

$a = 1

cmdlet > file
cmdlet >> file
cmdlet 1>&2
# Send success output to file, overwriting existing content
# Send success output to file, appending to existing content
# Send success and error output to error stream

$a = 1
$b = 2

$a = 1
$b = 2

$c = $a + $b
$c

$a = 1
$b = 2

$c = $a - $b
$c

$a = 1
$b = 2

$c = $a * $b
$c

$a = 1
$b = 2

$c = $a / $b
$c

$a = 1
$b = 2

$c = $a % $b
$c

$a = 1
$b = 2

$c = $a == $b
$c

$a = 1
$b = 2

$c = $a != $b
$c

$a = 1
$b = 2

$c = $a < $b
$c

$a = 1
$b = 2

$c = $a > $b
$c

$a = 1
$b = 2

$c = $a <= $b
$c

$a = 1
$b = 2

$c = $a >= $b
$c

$a = 1
$b = 2

$c = $a && $b
$c

$a = 1
$b = 2

$c = $a || $b
$c

$a = 1
$b = 2

$c = !($a && $b)
$c

$a = 1
$b = 2

$c = !($a || $b)
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

cmdlet 2> file
cmdlet 2>> file
cmdlet 2>&1
# Send error output to file, overwriting existing content
# Send error output to file, appending to existing content
# Send success and error output to success output stream

$a = 1
$b = 2

$a = 1
$b = 2

$c = $a + $b
$c

$a = 1
$b = 2

$c = $a - $b
$c

$a = 1
$b = 2

$c = $a * $b
$c

$a = 1
$b = 2

$c = $a / $b
$c

$a = 1
$b = 2

$c = $a % $b
$c

$a = 1
$b = 2

$c = $a == $b
$c

$a = 1
$b = 2

$c = $a != $b
$c

$a = 1
$b = 2

$c = $a < $b
$c

$a = 1
$b = 2

$c = $a > $b
$c

$a = 1
$b = 2

$c = $a <= $b
$c

$a = 1
$b = 2

$c = $a >= $b
$c

$a = 1
$b = 2

$c = $a && $b
$c

$a = 1
$b = 2

$c = $a || $b
$c

$a = 1
$b = 2

$c = !($a && $b)
$c

$a = 1
$b = 2

$c = !($a || $b)
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2

$c = $a & $b
$c

$a = 1
$b = 2

$c = $a | $b
$c

$a = 1
$b = 2

$c = $a ^ $b
$c

$a = 1
$b = 2

$c = ~$a
$c

$a = 1
$b = 2

$c = $a << $b
$c

$a = 1
$b = 2

$c = $a >> $b
$c

$a = 1
$b = 2
