#!/home/admin/app/PowerShell/members

# Set name cool nerdy shark for the fish
$sharkName = "Sharky"

# Set fish species
$fishSpecies = "NerdyShark"

# Set fish color
$fishColor = "Orange"

# Set fish size
$fishSize = "Large"

# Set fish habitat
$fishHabitat = "Deep Sea"

# Display fish information
Write-Host "Name: $sharkName"
Write-Host "Species: $fishSpecies"
Write-Host "Color: $fishColor"
Write-Host "Size: $fishSize"
Write-Host "Habitat: $fishHabitat"


class Person {
    [string] $FirstName
    [string] $LastName
    [string] Greeting() {
    return "Greetings, {0} {1}!" -f $this.FirstName, $this.LastName
    }
    }
    $x = [Person]::new()
    $x.FirstName = "Jane"
    $x.LastName = "Doe"
    $greeting = $x.Greeting() # "Greetings, Jane Doe!"
    Write-Host $greeting

    # Function to calculate the area of a circle
    function CalculateCircleArea([double]$radius) {
        if ($radius -lt 0) {
            throw "Radius must be a non-negative number."
        }
        return [Math]::PI * $radius * $radius
    }
    # Test the function
    try {
        $area = CalculateCircleArea(5)
        Write-Host "Area of a circle with radius 5: $area"
    } catch {
        Write-Host $_
    }

    # Function to convert temperature from Celsius to Fahrenheit
    function ConvertTemperature([double]$celsius) {
        if ($celsius -lt -273.15) {
            throw "Temperature must be above absolute zero in Celsius."
        }
        return [Math]::Round(($celsius * 9/5) + 32, 2)
    }
    # Test the function
    try {
        $fahrenheit = ConvertTemperature(25)
        Write-Host "Temperature in Fahrenheit: $fahrenheit"
    } catch {
        Write-Host $_
    }

    # Function to calculate the volume of a sphere
    function CalculateSphereVolume([double]$radius) {
        if ($radius -lt 0) {
            throw "Radius must be a non-negative number."
        }
        return (4/3) * [Math]::PI * $radius
    }
    # Test the function
    try {
        $volume = CalculateSphereVolume(5)
        Write-Host "Volume of a sphere with radius 5: $volume"
    } catch {
        Write-Host $_
    }

    # Function to calculate the area of a rectangle
    function CalculateRectangleArea([double]$length, [double]$width) {
        if ($length -lt 0) {
            throw "Length must be a non-negative number."
        }
        if ($width -lt 0) {
            throw "Width must be a non-negative number."
        }
        return $length * $width
    }
    # Test the function
    try {
        $area = CalculateRectangleArea(5, 10)
        Write-Host "Area of a rectangle with length 5 and width 10: $area"
        } catch {
        Write-Host $_
    }

    # Function to calculate the perimeter of a triangle
    function CalculateTrianglePerimeter([double]$side1, [double]$side2, [double]$side3) {
        if ($side1 -lt 0) {
            throw "Side 1 must be a non-negative number."
        }
        if ($side2 -lt 0) {
            throw "Side 2 must be a non-negative number."
        }
        if ($side3 -lt 0) {
            throw "Side 3 must be a non-negative number."
        }
        if (($side1 + $side2) -lt $side3) {
            throw "The given sides do not form a valid triangle."
        }
        return $side1 + $side2 + $side3
    }
    # Test the function
    try {
        $perimeter = CalculateTrianglePerimeter(3, 4, 5)
        Write-Host "Perimeter of a triangle with sides 3, 4, and 5: $perimeter"
        } catch {
        Write-Host $_
    }

    # Function to calculate the area of a trapezoid
    function CalculateTrapezoidArea([double]$base1, [double]$base2, [double]$height) {
        if ($base1 -lt 0) {
            throw "Base 1 must be a non-negative number."
        }
        if ($base2 -lt 0) {
            throw "Base 2 must be a non-negative number."
        }
        if ($height -lt 0) {
            throw "Height must be a non-negative number."
        }
        return ($base1 + $base2) / 2 * $height
    }
    # Test the function
    try {
        $area = CalculateTrapezoidArea(5, 10, 3)
        Write-Host "Area of a trapezoid with bases 5 and 10 and height 3: $area"
        } catch {
        Write-Host $_
    }
    