#!/home/admin/app/PowerShell/Members

# Check Files Existence and Permissions
$clown = Test-Path -Path './clown.jpg' -PathType Leaf
$mask = Test-Path -Path './mask.png' -PathType Leaf
$background = Test-Path -Path './background.jpg' -PathType Leaf

if (!$clown -or !$mask -or !$background) {
    Write-Host "One or more files are missing or have incorrect permissions."
    exit 1
}

# Resize Clown Image
$clownResized = Get-ResizeImage -Path './clown.jpg' -Width 1000 -Height 1000

# Resize Mask Image
$maskResized = Get-ResizeImage -Path './mask.png' -Width 500 -Height 500

# Merge Clown and Mask Images
$mergedImage = Merge-Images -ClownImage $clownResized -MaskImage $maskResized

# Resize Merged Image
$mergedImageResized = Get-ResizeImage -Image $mergedImage -Width 1200 -Height 600

# Apply Blur Filter to Merged Image
$blurredImage = Apply-BlurFilter -Image $mergedImageResized -Radius 5

# Overlay Blurred Image on Background Image
$finalImage = Overlay-Images -BackgroundImage './background.jpg' -BlurredImage $blurredImage

# Save Final Image
$finalImage.Save('output.jpg')

Write-Host "Output image saved as 'output.jpg'."


# Function to Resize Images
function Get-ResizeImage {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,

        [Parameter(Mandatory=$true)]
        [int]$Width,

        [Parameter(Mandatory=$true)]
        [int]$Height
    )
    Add-Type -AssemblyName System.Drawing

    $image = New-Object System.Drawing.Bitmap($Path)
    $resizedImage = New-Object System.Drawing.Bitmap($Width, $Height)

    $graphics = [System.Drawing.Graphics]::FromImage($resizedImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, $Width, $Height)
    $graphics.Dispose()

    return $resizedImage
}


# Function to Merge Images
function Merge-Images {
    param (
        [Parameter(Mandatory=$true)]
        [System.Drawing.Image]$ClownImage,

        [Parameter(Mandatory=$true)]
        [System.Drawing.Image]$MaskImage
    )
    Add-Type -AssemblyName System.Drawing

    $width = [Math]::Max($ClownImage.Width, $MaskImage.Width)
    $height = [Math]::Max($ClownImage.Height, $MaskImage.Height)
    $mergedImage = New-Object System.Drawing.Bitmap($width, $height)

    $graphics = [System.Drawing.Graphics]::FromImage($mergedImage)
    $graphics.DrawImage($ClownImage, 0, 0)
    $graphics.DrawImage($MaskImage, 0, 0)
    $graphics.Dispose()

    return $mergedImage
}


# Function to Apply Blur Filter
function ApplyBlurFilter {
    param (
        [Parameter(Mandatory=$true)]
        [System.Drawing.Image]$Image,

        [Parameter(Mandatory=$true)]
        [int]$Radius
    )
    Add-Type -AssemblyName System.Drawing

    $bitmap = [System.Drawing.Bitmap]$Image
    $blurBitmap = New-Object System.Drawing.Bitmap($bitmap.Width, $bitmap.Height)
    $graphics = [System.Drawing.Graphics]::FromImage($blurBitmap)

    $graphics.Dispose()

    return $blurBitmap
}


# Function to Overlay Images
function OverlayImages {
    param (
        [Parameter(Mandatory=$true)]
        [System.Drawing.Image]$BackgroundImage,

        [Parameter(Mandatory=$true)]
        [System.Drawing.Image]$BlurredImage
    )
    Add-Type -AssemblyName System.Drawing

    $width = [Math]::Max($BackgroundImage.Width, $BlurredImage.Width)
    $height = [Math]::Max($BackgroundImage.Height, $BlurredImage.Height)
    $finalImage = New-Object System.Drawing.Bitmap($width, $height)

    $graphics = [System.Drawing.Graphics]::FromImage($finalImage)
    $graphics.DrawImage($BackgroundImage, 0, 0)
    $graphics.DrawImage($BlurredImage, 0, 0)
    $graphics.Dispose()

    return $finalImage
}


# Example usage
# $clown = Test-Path -Path './clown.jpg' -PathType Leaf
# $mask = Test-Path -Path './mask.png' -PathType Leaf
# $background = Test-Path -Path './background.jpg' -PathType Leaf

# if (!$clown -or !$mask -or !$background) {
#     Write-Host "One or more files are missing or have incorrect permissions."
#     exit 1
# }

# $clownResized = Get-ResizeImage -Path './clown.jpg' -Width 1000 -Height 1000
# $maskResized = Get-ResizeImage -Path './mask.png' -Width 500 -Height 500
# $mergedImage = Merge-Images -ClownImage $clownResized -MaskImage $maskResized
# $mergedImageResized = Get-ResizeImage -Image $mergedImage -Width 1200 -Height 600
# $blurredImage = Apply-BlurFilter -Image $mergedImageResized -Radius 5
# $finalImage = Overlay-Images -BackgroundImage './background.jpg' -BlurredImage $blurredImage
# $finalImage.Save('output.jpg')
# Write-Host "Output image saved as 'output.jpg'."

