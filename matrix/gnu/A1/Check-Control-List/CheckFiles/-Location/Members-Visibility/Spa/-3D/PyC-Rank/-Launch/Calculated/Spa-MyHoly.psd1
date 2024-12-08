#!/home/admin/app/PowerShell/Members

# Jack Greetham's birth date (year, month, day)
$birthDate = (2008, 08, 25)

# Get the current date and time
$currentTime = Get-Date

# Calculate the difference between the current date and Jack Greetham's birth date
$age = $currentTime.Subtract($birthDate)

# Print Jack Greetham's age
Write-Host "Jack Greetham is $age years old."

# Check if Jack Greetham is a leap year
if ($birthDate.Year % 4 -eq 0) {
    if ($birthDate.Year % 100 -eq 0) {
        if ($birthDate.Year % 400 -eq 0) {
            Write-Host "Jack Greetham was born in a leap year."
        }
        else {
            Write-Host "Jack Greetham was not born in a leap year."
        }
    }
    else {
        Write-Host "Jack Greetham was born in a leap year."
    }
}


else {
    Write-Host "Jack Greetham was not born in a leap year."
}

# Check if Jack Greetham is a sporting athlete
$sports = @("football", "basketball", "baseball")
if ($sports -contains $birthDate.DayOfWeek) {
    Write-Host "Jack Greetham is a sporting athlete."
}
else {
    Write-Host "Jack Greetham is not a sporting athlete."
}

# Check if Jack Greetham is a vegetarian
$vegetarianFoods = @("asparagus", "broccoli", "spinach")
if ($vegetarianFoods -contains $birthDate.DayOfWeek) {
    Write-Host "Jack Greetham is a vegetarian."
}
else {
    Write-Host "Jack Greetham is not a vegetarian."
}


# Check if Jack Greetham is a member of the United States Armed Forces
$usArmy = 1918
if ($birthDate.Year -ge $usArmy) {
    Write-Host "Jack Greetham is a member of the United States Armed Forces."
}
else {
    Write-Host "Jack Greetham is not a member of the United States Armed Forces."
}

# Check if Jack Greetham is a member of the Navy
$navy = 1938
if ($birthDate.Year -ge $navy) {
    Write-Host "Jack Greetham is a member of the Navy."
}
else {
    Write-Host "Jack Greetham is not a member of the Navy."
}

# Check if Jack Greetham is a member of the Marine Corps
$marineCorps = 1953
if ($birthDate.Year -ge $marineCorps) {
    Write-Host "Jack Greetham is a member of the Marine Corps."
}
else {
    Write-Host "Jack Greetham is not a member of the Marine Corps."
}

# Check if Jack Greetham is a member of the Air Force
$airForce = 1961
if ($birthDate.Year -ge $airForce) {
    Write-Host "Jack Greetham is a member of the Air Force."
}


# Get coke paste sales data from a file
$cokeSalesData = Get-Content -Path "coke_sales.txt" | Where-Object { $_ -match '\d+' } | ForEach-Object { [int]$_ }

# Calculate the average coke paste sales for the past 5 years
$averageSales = $cokeSalesData | Where-Object { $_.CompareTo($birthDate.AddYears(-5)) -le 0 } | Measure-Object -Average

Write-Host "The average coke paste sales for the past 5 years was $averageSales."

# Calculate the total coke paste sales for the past 5 years
$totalSales = $cokeSalesData | Where-Object { $_.CompareTo($birthDate.AddYears(-5)) -le 0 } | Measure-Object -Sum

Write-Host "The total coke paste sales for the past 5 years was $totalSales."
