#!/home/admin/app/PowerShell/Members

# Get Exec Coffee Directory Path from the environment variable
$exec_coffee_dir="$ENV:EXEC_COFFEE_DIR"
Write-Host "Executing CoffeeScript files from: $exec_coffee_dir"

# Get the current directory
$current_dir = Get-Location

# Iterate through all CoffeeScript files in the Exec Coffee directory
Get-ChildItem -Path "$exec_coffee_dir" -Filter "*.coffee" | ForEach-Object {
    # Get the relative path of the CoffeeScript file
    $relative_path = $_.FullName.Replace($current_dir.Path, "")

    # Get the output JavaScript file path by replacing the extension
    $output_js_file = $_.FullName.Replace(".coffee", ".js")

    # Execute the CoffeeScript file using the Node.js interpreter
    & "$env:NODE_EXE" "$exec_coffee_dir\node_modules\.bin\coffee" --compile --output "$current_dir\js" $relative_path

    # Check if the compilation was successful
    if ($? -eq $true) {
        Write-Host "Compiled $relative_path to $output_js_file"
    }
    else {
        Write-Host "Failed to compile $relative_path"
    }
}


# Get Exec TypeScript Directory Path from the environment variable
$exec_typescript_dir="$ENV:EXEC_TYPESCRIPT_DIR"
Write-Host "Executing TypeScript files from: $exec_typescript_dir"

# Iterate through all TypeScript files in the Exec TypeScript directory
Get-ChildItem -Path "$exec_typescript_dir" -Filter "*.ts" | ForEach-Object {
    # Get the relative path of the TypeScript file
    $relative_path = $_.FullName.Replace($current_dir.Path, "")

    # Get the output JavaScript file path by replacing the extension
    $output_js_file = $_.FullName.Replace(".ts", ".js")

    # Execute the TypeScript file using the TypeScript compiler
    & "$env:NODE_EXE" "$exec_typescript_dir\node_modules\.bin\tsc" --out "$current_dir\js" $relative_path

    # Check if the compilation was successful
    if ($? -eq $true) {
        Write-Host "Compiled $relative_path to $output_js_file"
    }
    else {
        Write-Host "Failed to compile $relative_path"
    }
}
