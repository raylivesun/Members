#!/home/admin/app/PowerShell/Members

# fp foreach-object: Process each object in the pipeline
# -File: Specifies the input file
# -ReadCount: Specifies the maximum number of objects to read at once (default is 1000)
# -ErrorAction Stop: Specifies that if an error occurs, stop processing the entire pipeline
# -Parallel: Enables parallel processing for faster processing

Get-Content -Path 'path/to/your/large/csv/file.csv' -ReadCount 1000 |
foreach-object {
    # Perform your custom processing here
    # For example, you can extract specific columns, perform calculations, or save the results to a new CSV file
    # Replace 'your_column1', 'your_column2', and 'your_new_column' with your actual column names and desired new column names
    $processedObject = @{
        'ProcessedColumn1' = $_.your_column1
        'ProcessedColumn2' = $_.your_column2
        'NewColumn' = $_.your_column1 + $_.your_column2
    }
    $processedObject | Add-Member -MemberType NoteProperty -Name 'ID' -Value $_.ID

    # Save the processed object to a new CSV file
    $processedObject | ConvertTo-Csv -NoTypeInformation | Out-File 'path/to/your/output/directory/output.csv' -Append
}
