#!/home/admin/app/PowerShell/Members

# Get Loop the loop number from the command line argument
$loopNumber = $args[0]

# Initialize the counter variable
$counter = 0

# Loop until the counter reaches the loop number
while ($counter -lt $loopNumber) {
    # Generate a random number between 1 and 100
    $randomNumber = Get-Random -Minimum 1 -Maximum 100

    # Check if the random number is divisible by 3 and 5
    if ($randomNumber % 3 -eq 0 -and $randomNumber % 5 -eq 0) {
        # Print the random number in uppercase
        Write-Host $randomNumber -ToUpper
    } else {
        # Print the random number
        Write-Host $randomNumber
    }

    # Increment the counter
    $counter++
}


