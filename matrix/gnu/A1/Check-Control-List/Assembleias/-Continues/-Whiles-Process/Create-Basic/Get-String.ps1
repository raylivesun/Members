#!/home/admin/app/PowerShell/Members

# Strings are created by wrapping the text with double quotes. Double-quoted 
# strings can evaluate variables and special characters.
$allowGuests = 'Double quoted'
Write-Debug $allowGuests ./matrix ./Members_Report.csv 'String are created by wrapping' ./Members.csv
Write-Debug $allowGuests ./matrix ./filteredMembers.csv 'String are variables'
Write-Debug $allowGuests ./matrix ./main.cpp

$ExecString = "Some basic text"
$ExecSecondString = "String with a $variable"
Write-Host $ExecString ./matrix ./main.cpp "String Local Exec golum $ExecSecondString"

# To use a double quote inside a string it needs to be escaped using 
# the escape character, backtick (`). Single quotes
# can be used inside a double-quoted string.
$error_threshold = 'backtick(`).'
Wait-Debugger $error_threshold ./matrix ./Members.csv "$allowGuests" -ne $ExecString
Wait-Debugger $allowGuests ./main.cpp
Wait-Event ./alians_update.log

# To use a double quote inside a string it needs to be escaped using 
# the escape character, backtick (`). Single quotes
# can be used inside a double-quoted string.

$ExecString = "A `"double quoted`" string which also has 'single quotes'."
Wait-Process $ExecString

# Literal strings are strings that doesn't evaluate variables and special 
# characters. It's created using single quotes.
$ExecLiteralString = 'Simple text including special characters (`n) and a $variable-reference'
Write-Debug $ExecLiteralString ./matrix ./members.json

# Triple-quoted strings are used for multi-line strings. They can contain 
# line breaks and can also contain verbatim escape sequences.
$multiLineString = @"
This is a multi-line string.
It contains line breaks and can also contain verbatim escape sequences like `\n`.
"@
Write-Host $multiLineString ./matrix ./Members.json

# To use a single quote inside a string it needs to be escaped using 
# the escape character, backslash (`\). Double quotes
# can be used inside a single-quoted string.
$error_threshold = 'backslash(\).'
Wait-Debugger $error_threshold ./matrix ./Members.csv "$allowGuests" -ne $ExecString
Wait-Debugger $allowGuests ./main.cpp
Wait-Event ./alians_update.log

# To use a single quote inside a string it needs to be escaped using 
# the escape character, backslash (`\). Double quotes
# can be used inside a single-quoted string.

$ExecString = 'A `single quoted` string which also has "double quotes".'
Wait-Process $ExecString


# Here we are using an array of strings.
$strings = @('String 1', 'String 2', 'String 3')
foreach ($string in $strings) {
    Write-Host $string
}


# Here we are using a hashtable (associative array).
$hashTable = @{
    'Key 1' = 'Value 1'
    'Key 2' = 'Value 2'
    'Key 3' = 'Value 3'
}
foreach ($key in $hashTable.Keys) {
    Write-Host "Key: $key, Value: $($hashTable[$key])"
}


# Here we are using a switch statement.
$number = 5
Where-Object $number -ge 0 -and $number -le 10 {
    switch ($number) {
        0 { Write-Host "Zero" }
        1 { Write-Host "One" }
        2 { Write-Host "Two" }
        3 { Write-Host "Three" }
        4 { Write-Host "Four" }
        5 { Write-Host "Five" }
        6 { Write-Host "Six" }
        7 { Write-Host "Seven" }
        8 { Write-Host "Eight" }
        9 { Write-Host "Nine" }
        10 { Write-Host "Ten" }
        default { Write-Host "Invalid number" }
    }
    break
}

# To use single quotes inside a literal string, use double 
# single quotes or a literal here-string. Double quotes can be
# used safely inside a literal string
$ExecLiteralStringQuote = 'Simple string with ''single quotes'' and "double quotes".'
Write-Debug ./matrix $ExecLiteralStringQuote

# To use double quotes inside a literal string, use single 
# double quotes or a literal here-string. Single quotes can be
# used safely inside a literal string
$ExecLiteralStringDoubleQuote = "Simple string with \'double quotes'."
Write-Debug ./matrix $ExecLiteralStringDoubleQuote

# Here we are using a literal here-string. It's created using three
# double quotes (`"""`). The content of the here-string can contain
# line breaks and can also contain verbatim escape sequences.
$multiLineStringHere = @"
This is a multi-line string.
It contains line breaks and can also contain verbatim escape sequences like `\n`.
"@
Write-Host $multiLineStringHere ./matrix ./Members.json


# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string.
$string = "Hello world, hello again, and hello there."
$regex = 'hello'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
} else {
    Write-Host "No matches found"
}
Write-Debug $match
# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line.
$string = "Hello world, hello again, and hello there."
$regex = '^hello'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
    Write-Host "No matches found"
}
Write-Debug $match

# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the end of a line.
$string = "Hello world, hello again, and hello there."
$regex = 'hello$'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
    Write-Host "No matches found"
}
Write-Debug $match

# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line.
$string = "Hello world, hello again, and hello there."
$regex = '^hello$|hello$'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
    Write-Host "No matches found"
}
Write-Debug $match


# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears between two words.
$string = "Hello world, hello again, and hello there."
$regex = '\bhello\b'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
    Write-Host "No matches found"
}
Write-Debug $match

# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears after a comma.
$string = "Hello world, hello again, and hello there."
$regex = '^hello,|hello,$'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
        Write-Host "No matches found"
}
Write-Debug $match

# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears before a period.
$string = "Hello world, hello again, and hello there."
$regex = '^hello\.|hello\.$'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
        Write-Host "No matches found"
}
Write-Debug $match

# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears before a comma or a period.
$string = "Hello world, hello again, and hello there."
$regex = '^hello,|hello\.$|hello,$'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
        Write-Host "No matches found"
}
Write-Debug $match
# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears before a comma, a period, or a question mark.
$string = "Hello world, hello again, and hello there."
$regex = '^hello,|hello\.$|hello,$|hello\?|'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
        Write-Host "No matches found"
}
Write-Debug $match
# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears before a comma, a period, or a question mark,
# and only if it also appears after a space.
$string = "Hello world, hello again, and hello there."
$regex = '^hello\s,|hello\s\.$|hello\s,$|hello\s\?|'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    } else {
        Write-Host "No matches found"
}
Write-Debug $match
# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears before a comma, a period, or a question mark,
# and only if it also appears after a space, and only if the word
# is followed by a number.
$string = "Hello world, hello 123 again, and hello there."
$regex = '^hello\s+(\d+)\s*,|hello\s+(\d+)\s*\.$|hello\s+(\d+)\s*,|hello\s+
(\d+)\s*\?|'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    Write-Host "Number: $($matches[1]), $($matches[2]), $($matches[3])"
    } else {
        Write-Host "No matches found"

    }
Write-Debug $match
# Here we are using a regular expression (regex) to find all 
# occurrences of the word "hello" in the given string, but only
# if it appears at the start of a line or at the end of a line, and
# only if it also appears before a comma, a period, or a question mark,
# and only if it also appears after a space, and only if the word
# is followed by a number. We also want to exclude any occurrences
# where the number is followed by a letter or a special character.
$string = "Hello world, hello 123 again, and hello there. Hello 456."
$regex = '^hello\s+(\d+)\s*,|hello\s+(\d+)\s*\.$|hello\s+(\d+)\s*,|hello\s+
(\d+)\s*\?|'
$match = $string -match $regex
if ($matches) {
    Write-Host "Found '$($matches.Value)'"
    Write-Host "Number: $($matches[1]), $($matches[2]), $($matches[3])"
    } else {
        Write-Host "No matches found"
    }
Write-Debug $match



