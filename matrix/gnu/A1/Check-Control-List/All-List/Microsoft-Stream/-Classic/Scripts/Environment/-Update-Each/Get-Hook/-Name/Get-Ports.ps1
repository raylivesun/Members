#!/home/admin/app/PowerShell/Members

#Done in Powershell 2.0
$boolean = $false;
$string = "false";
$emptyString = "";
If($boolean){
# this does not run because $boolean is false
Write-Host "Shorthand If conditions can be nice, just make sure they are always boolean."
}
If($string){
# This does run because the string is non-zero length
Write-Host "If the variable is not strictly null or Boolean false, it will evaluate to true as
it is an object or string with length greater than 0."
}
If($emptyString){
# This does not run because the string is zero-length
Write-Host "Checking empty strings can be useful as well."
}
If($null){
# This does not run because the condition is null
Write-Host "Checking Nulls will not print this statement."
}

$Names = @('Amy', 'Bob', 'Celine', 'David')
ForEach ($Name in $Names)
{
Write-Host "Hi, my name is $Name!"
}


$Numbers = ForEach ($Number in 1..20) {
    $Number # Alternatively, Write-Output $Number
}

# Continue ...
$Numbers = @()
ForEach ($Number in 1..20) {
  $Numbers += $Numbers  
}

# lines cmdlet connection current path
for ($i = 0; $i -le 5; $i++) {
     "$i"
}

# still members mike Tyson server until
(1..14).ForEach($_ * $_)

# explore tools in develop files connect server bloomberg
(1..14).ForEach{$_ * $_}

# burro:w its faithfull republic server
$object | Foreach-Object {
   code_block
}

# print a progress bar twitter kit OK!
$progress = 0
while ($progress -le 100) {
    Write-Progress -Activity "Loading..." -Status "$progress%" -PercentComplete $progress
    Start-Sleep -Seconds 1
    $progress++
}

$names | ForEach-Object {
  "Hi, my name is $_!"
  }
  $names | ForEach-Object {
  "Hi, my name is $_!"
}


$names | ForEach-Object {
  "Hi, my name is $_!"
} | Format-Table Name -AutoSize

# Get-Process | Where-Object {$_.CPU -gt 50} | Format-Table Name, CPU -AutoSize

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table Name, CPU -AutoSize

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU | Out-File -FilePath C:\temp\cpu_high_usage.csv

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU | Select-Object -First 10

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU | Select-Object -Last 10

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU | Select-Object -Skip 10 -Take 10

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU | Select-Object -Skip 20

# Get-Process | Where-Object {$_.CPU -gt 50} | Sort-Object CPU -Descending | Format-Table -AutoSize Name, CPU | Select-Object -Skip 20, 10



