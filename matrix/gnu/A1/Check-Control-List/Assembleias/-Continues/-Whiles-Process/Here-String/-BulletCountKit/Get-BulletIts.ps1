#!/home/admin/app/PowerShell/Members

# Get Bullet Points from the JSON data and format them as Markdown
$bullet_points = @('
- First bullet point
- Second bullet point
- Third bullet point
')


# Join the bullet points into a single string
$bullet_points_string = $bullet_points -join "`n"


# Set the title of the markdown document
$title = "Markdown Document"


# Set the author of the markdown document
$author = "John Doe"


# Set the date of the markdown document
$date = Get-Date -Format "yyyy-MM-dd"


# Format the markdown document with the title, author, date, and bullet points
$markdown_document = @"
# $title

Author: $author

Date: $date

$bullet_points_string
"@


# Save the markdown document to a file
$markdown_document | Out-File markdown_document.md

