#!/home/admin/app/Powershell/Members

# Child Path for users (example: C:\Users)
$childPath = "C:\Users"

# Loop through each user in the child path
Get-ChildItem $childPath -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {
    # Get the username
    $username = $_.Name

    # Get the user's SID
    $sid = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'" -Property SID).SID

    # Get the user's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $username -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

    # Output the username, SID, and group memberships
    Write-Output "Username: $username"
    Write-Output "SID: $sid"
    Write-Output "Group Memberships:"
    foreach ($group in $groupMemberships) {
        Write-Output "- $group"
    }
    Write-Output ""
}


# Child Path for administrators (example: C:\Administrators)
$childPath = "C:\Administrators"

# Loop through each user in the child path
Get-ChildItem $childPath -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {
    # Get the username
    $username = $_.Name

    # Get the user's SID
    $sid = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'" -Property SID).SID

    # Get the user's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $username -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

    # Output the username, SID, and group memberships
    Write-Output "Username: $username"
    Write-Output "SID: $sid"
    Write-Output "Group Memberships:"
    foreach ($group in $groupMemberships) {
        Write-Output "- $group"

        # Get the administrator privileges for the user in the specified group
        $adminRights = Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:$group") -Quiet

        if ($adminRights) {
            Write-Output "- Administrator privileges: Yes"
        } else {
            Write-Output "- Administrator privileges: No"
        }
        Write-Output ""
    }

    # Check if the user is a member of the 'Domain Admins' group
    if (Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:Domain Admins")) {
        Write-Output "User is a member of the 'Domain Admins' group"
    } else {
        Write-Output "User is not a member of the 'Domain Admins' group"
    }
    Write-Output ""
}


# Child Path for local administrators (example: C:\Windows\System32\config\systemprofile)
$childPath = "C:\Windows\System32\config\systemprofile"

# Loop through each user in the child path
Get-ChildItem $childPath -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {
    # Get the username
    $username = $_.Name

    # Get the user's SID
    $sid = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'" -Property SID).SID

    # Get the user's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $username -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

    # Output the username, SID, and group memberships
    Write-Output "Username: $username"
    Write-Output "SID: $sid"
    Write-Output "Group Memberships:"
    foreach ($group in $groupMemberships) {
        Write-Output "- $group"

        # Get the administrator privileges for the user in the specified group
        $adminRights = Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:$group") -Quiet

        if ($adminRights) {
            Write-Output "- Administrator privileges: Yes"
        } else {
            Write-Output "- Administrator privileges: No"
        }
        Write-Output ""
    }

    # Check if the user is a member of the 'Administrators' group
    if (Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:Administrators")) {
        Write-Output "User is a member of the 'Administrators' group"
    } else {
        Write-Output "User is not a member of the 'Administrators' group"
    }
    Write-Output ""
}


# Child Path for domain admins (example: C:\Domain admins)
$childPath = "C:\Domain admins"

# Loop through each user in the child path
Get-ChildItem $childPath -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {
    # Get the username
    $username = $_.Name

    # Get the user's SID
    $sid = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'" -Property SID).SID

    # Get the user's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $username -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

    # Output the username, SID, and group memberships
    Write-Output "Username: $username"
    Write-Output "SID: $sid"
    Write-Output "Group Memberships:"
    foreach ($group in $groupMemberships) {
        Write-Output "- $group"

        # Get the administrator privileges for the user in the specified group
        $adminRights = Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:$group") -Quiet

        if ($adminRights) {
            Write-Output "- Administrator privileges: Yes"
        } else {
            Write-Output "- Administrator privileges: No"
        }
        Write-Output ""
    }

    # Check if the user is a member of the 'Domain Admins' group
    if (Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:Domain Admins")) {
        Write-Output "User is a member of the 'Domain Admins' group"
    } else {
        Write-Output "User is not a member of the 'Domain Admins' group"
    }
    Write-Output ""
}


# Child Path for domain controllers (example: C:\Domain controllers)
$childPath = "C:\Domain controllers"

# Loop through each user in the child path
Get-ChildItem $childPath -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {
    # Get the username
    $username = $_.Name

    # Get the user's SID
    $sid = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'" -Property SID).SID

    # Get the user's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $username -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

    # Output the username, SID, and group memberships
    Write-Output "Username: $username"
    Write-Output "SID: $sid"
    Write-Output "Group Memberships:"
    foreach ($group in $groupMemberships) {
        Write-Output "- $group"

        # Get the administrator privileges for the user in the specified group
        $adminRights = Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:$group") -Quiet

        if ($adminRights) {
            Write-Output "- Administrator privileges: Yes"
        } else {
            Write-Output "- Administrator privileges: No"
        }
        Write-Output ""
    }

    # Check if the user is a member of the 'Domain Admins' group
    if (Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:Domain Admins")) {
        Write-Output "User is a member of the 'Domain Admins' group"
    } else {
        Write-Output "User is not a member of the 'Domain Admins' group"
    }
    Write-Output ""
}


# Child Path for domain controllers (example: C:\Domain controllers)
$childPath = "C:\Domain controllers"

# Loop through each user in the child path
Get-ChildItem $childPath -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object {
    # Get the username
    $username = $_.Name

    # Get the user's SID
    $sid = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'" -Property SID).SID

    # Get the user's group memberships
    $groupMemberships = Get-ADGroupMember -Identity $username -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name

    # Output the username, SID, and group memberships
    Write-Output "Username: $username"
    Write-Output "SID: $sid"
    Write-Output "Group Memberships:"
    foreach ($group in $groupMemberships) {
        Write-Output "- $group"

        # Get the administrator privileges for the user in the specified group
        $adminRights = Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:$group") -Quiet

        if ($adminRights) {
            Write-Output "- Administrator privileges: Yes"
        } else {
            Write-Output "- Administrator privileges: No"
        }
        Write-Output ""
    }

    # Check if the user is a member of the 'Domain Admins' group
    if (Test-Path -Path ("C:\Windows\System32\config\system.ini" | Select-String -Pattern "Group:Domain Admins")) {
        Write-Output "User is a member of the 'Domain Admins' group"
    } else {
        Write-Output "User is not a member of the 'Domain Admins' group"
    }
    Write-Output ""
}

"3" * 2
# Gives "33"
2 * "3"
# Gives 6
1,2,3 * 2 # Gives 1,2,3,1,2,3
2 * 1,2,3 # Gives an error op_Multiply is missing


# Addition of two integers
$a = 5
$b = 10
$result = $a + $b
$result

# Addition of two strings
$str1 = "Hello"
$str2 = "World"
$result = $str1 + $str2
$result

# Addition of an integer and a string
$num = 5
$str = "World"
$result = $num + $str
$result

# Addition of a string and an integer
$str = "Hello"
$num = 10
$result = $str + $num
$result

# Addition of a string and a string
$str1 = "Hello"
$str2 = "World"
$result = $str1 + $str2
$result

# Addition of an array and a string
$arr = @("apple", "banana", "cherry")
$str = "Fruit list:"
$result = $str + $arr
$result

# Addition of a string and an array
$str = "Hello"
$arr = @("apple", "banana", "cherry")
$result = $str + $arr
$result

# Addition of an array and an array
$arr1 = @("apple", "banana", "cherry")
$arr2 = @("date", "elderberry", "fig")
$result = $arr1 + $arr2
$result

$a = Read-Host "Enter a number"
Enter a number : 33
$a -gt 5
False

$b = Read-Host "Enter a number"
Enter a number : 7
$b -lt 5
False

$c = Read-Host "Enter a number"
Enter a number : 3
$c -eq 3
True

$d = Read-Host "Enter a number"
Enter a number : 3.5
$d -eq 3
False

$e = Read-Host "Enter a number"
Enter a number : 3.5
$e -eq 3.0
True

$f = Read-Host "Enter a string"
Enter a string : Hello
$f.Length
5

$g = Read-Host "Enter a string"
Enter a string : World
$g.Length
5

$h = Read-Host "Enter a string"
Enter a string : Hello World
$h.Length
11

$i = Read-Host "Enter a string"
Enter a string : Hello World
$i.Contains("World")
True

$j = Read-Host "Enter a string"
Enter a string : Hello World
$j.Contains("Universe")
False

$k = Read-Host "Enter a string"
Enter a string : Hello World
$k.Split(" ")[1]
World

$l = Read-Host "Enter a string"
Enter a string : Hello World
$l.Split(" ")[0]
Hello

$m = Read-Host "Enter a string"
Enter a string : Hello World
$m.ToLower()
hello world

$n = Read-Host "Enter a string"
Enter a string : Hello World
$n.ToUpper()
HELLO WORLD

$o = Read-Host "Enter a string"
Enter a string : Hello World
$o.Substring(0, 5)
Hello

$p = Read-Host "Enter a string"
Enter a string : Hello World
$p.Substring(6)
World

$q = Read-Host "Enter a string"
Enter a string : Hello World
$q.IndexOf("o")
4

$r = Read-Host "Enter a string"
Enter a string : Hello World
$r.LastIndexOf("o")
7

$s = Read-Host "Enter a string"
Enter a string : Hello World
$s.Replace("o", "a")
Hella WaRLd

$t = Read-Host "Enter a string"
Enter a string : Hello World
$t.Remove(5, 5)
HeLlo

$u = Read-Host "Enter a string"
Enter a string : Hello World
$u.Insert(5, " Universe")
Hello Universe World

$v = Read-Host "Enter a string"
Enter a string : Hello World
$v.Split(" ")[0]
Hello

$w = Read-Host "Enter a string"
Enter a string : Hello World
$w.Split(" ")[1]
World

$x = Read-Host "Enter a string"
Enter a string : Hello World
$x.Split(" ")[2]

$y = Read-Host "Enter a string"
Enter a string : Hello World
$y.Split(" ")[3]

$z = Read-Host "Enter a string"
Enter a string : Hello World
$z.Split(" ")[4]

$aa = Read-Host "Enter a string"
Enter a string : Hello World
$aa.Split(" ")[5]

$bb = Read-Host "Enter a string"
Enter a string : Hello World
$bb.Split(" ")[6]

$cc = Read-Host "Enter a string"
Enter a string : Hello World
$cc.Split(" ")[7]

$dd = Read-Host "Enter a string"
Enter a string : Hello World
$dd.Split(" ")[8]

$ee = Read-Host "Enter a string"
Enter a string : Hello World
$ee.Split(" ")[9]

$ff = Read-Host "Enter a string"
Enter a string : Hello World
$ff.Split(" ")[10]

$gg = Read-Host "Enter a string"
Enter a string : Hello World
$gg.Split(" ")[11]

$hh = Read-Host "Enter a string"
Enter a string : Hello World
$hh.Split(" ")[12]

$ii = Read-Host "Enter a string"
Enter a string : Hello World
$ii.Split(" ")[13]

$jj = Read-Host "Enter a string"
Enter a string : Hello World
$jj.Split(" ")[14]

$kk = Read-Host "Enter a string"
Enter a string : Hello World
$kk.Split(" ")[15]

$ll = Read-Host "Enter a string"
Enter a string : Hello World
$ll.Split(" ")[16]

$mm = Read-Host "Enter a string"
Enter a string : Hello World
$mm.Split(" ")[17]

$nn = Read-Host "Enter a string"
Enter a string : Hello World
$nn.Split(" ")[18]

$oo = Read-Host "Enter a string"
Enter a string : Hello World
$oo.Split(" ")[19]

$pp = Read-Host "Enter a string"
Enter a string : Hello World
$pp.Split(" ")[20]

$qq = Read-Host "Enter a string"
Enter a string : Hello World
$qq.Split(" ")[21]

$rr = Read-Host "Enter a string"
Enter a string : Hello World
$rr.Split(" ")[22]

$ss = Read-Host "Enter a string"
Enter a string : Hello World
$ss.Split(" ")[23]

$tt = Read-Host "Enter a string"
Enter a string : Hello World
$tt.Split(" ")[24]

$uu = Read-Host "Enter a string"
Enter a string : Hello World
$uu.Split(" ")[25]

$vv = Read-Host "Enter a string"
Enter a string : Hello World
$vv.Split(" ")[26]

$ww = Read-Host "Enter a string"
Enter a string : Hello World
$ww.Split(" ")[27]

$xx = Read-Host "Enter a string"
Enter a string : Hello World
$xx.Split(" ")[28]

$yy = Read-Host "Enter a string"
Enter a string : Hello World
$yy.Split(" ")[29]

$zz = Read-Host "Enter a string"
Enter a string : Hello World
$zz.Split(" ")[30]


# Concatenation of two strings
$str1 = "Hello"
$str2 = "World"
$result = $str1 + $str2
$result

# Concatenation of an integer and a string
$num = 5
$str = "World"
$result = $num + $str
$result

# Concatenation of a string and an integer
$str = "Hello"
$num = 10
$result = $str + $num
$result

# Concatenation of a string and a string
$str1 = "Hello"
$str2 = "World"
$result = $str1 + $str2
$result

# Concatenation of an array and a string
$arr = @("apple", "banana", "cherry")
$str = "Fruit list:"
$result = $str + $arr
$result

# Concatenation of a string and an array
$str = "Hello"
$arr = @("apple", "banana", "cherry")
$result = $str + $arr
$result

# Concatenation of an array and an array
$arr1 = @("apple", "banana", "cherry")
$arr2 = @("date", "elderberry", "fig")
$result = $arr1 + $arr2
$result

# Concatenation of a string and a boolean
$str = "Hello"
$bool = $true
$result = $str + $bool
$result

# Concatenation of a boolean and a string
$bool = $true
$str = "World"
$result = $bool + $str
$result

# Concatenation of a boolean and a boolean
$bool1 = $true
$bool2 = $false
$result = $bool1 + $bool2
$result

# Concatenation of a null and a string
$nullVar = $null
$str = "Hello"
$result = $nullVar + $str
$result

# Concatenation of a string and a null
$str = "World"
$nullVar = $null
$result = $str + $nullVar
$result

# Concatenation of a null and a null
$nullVar1 = $null
$nullVar2 = $null
$result = $nullVar1 + $nullVar2
$result

# Concatenation of a custom object and a string
$obj = New-Object PSObject -Property @{ Name = "John Doe"; Age = 30 }
$str = "Hello"
$result = $obj + $str
$result

# Concatenation of a string and a custom object
$str = "World"
$obj = New-Object PSObject -Property @{ Name = "John Doe"; Age = 30 }
$result = $str + $obj
$result

# Concatenation of a custom object and a custom object
$obj1 = New-Object PSObject -Property @{ Name = "John Doe"; Age = 30 }
$obj2 = New-Object PSObject -Property @{ Name = "Jane Doe"; Age = 28 }
$result = $obj1 + $obj2
$result


# Escape sequences
$str = "Hello\tWorld"
$result = $str
$result

$str = "Hello\nWorld"
$result = $str
$result

$str = "Hello\rWorld"
$result = $str
$result

$str = "Hello\fWorld"
$result = $str
$result

$str = "Hello\vWorld"
$result = $str
$result

$str = "Hello\aWorld"
$result = $str
$result

$str = "Hello\bWorld"
$result = $str
$result

$str = "Hello\0World"
$result = $str
$result


# Formatting strings
$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result

$str = "Hello {Name}, welcome to {Place}!"
$result = Format-String -StringFormat $str -ArgumentList @{Name="World"; Place="PowerShell"}
$result

$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result

$str = "Hello {Name}, welcome to {Place}!"
$result = Format-String -StringFormat $str -ArgumentList @{Name="World"; Place="PowerShell"}
$result

$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result

$str = "Hello {Name}, welcome to {Place}!"
$result = Format-String -StringFormat $str -ArgumentList @{Name="World"; Place="PowerShell"}
$result

$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result

$str = "Hello {Name}, welcome to {Place}!"
$result = Format-String -StringFormat $str -ArgumentList @{Name="World"; Place="PowerShell"}
$result

$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result

$str = "Hello {Name}, welcome to {Place}!"
$result = Format-String -StringFormat $str -ArgumentList @{Name="World"; Place="PowerShell"}
$result

$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result

$str = "Hello {Name}, welcome to {Place}!"
$result = Format-String -StringFormat $str -ArgumentList @{Name="World"; Place="PowerShell"}
$result

$str = "Hello {0}, welcome to {1}!"
$result = Format-String -StringFormat $str -ArgumentList "World", "PowerShell"
$result


# Regular expressions
$str = "Hello World"
$pattern = "World"
$result = [regex]::IsMatch($str, $pattern)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Matches($str, $pattern)
$result.Count

$str = "Hello World"
$pattern = "World"
$result = [regex]::Replace($str, $pattern, "Universe")
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, [regexsplitoptions]::IgnoreCase)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::IgnoreCase)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::Multiline)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::Multiline, [regex]::RightToLeft)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regex]::IgnoreCase)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regex]::IgnoreCase, [regex]::Singleline)
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
$result = [regex]::Split($str, $pattern, 2, [regexsplitoptions]::RightToLeft, [regexsplitoptions]::IgnoreCase, [regexsplitoptions]::Singleline
$result

$str = "Hello World"
$pattern = "World"
