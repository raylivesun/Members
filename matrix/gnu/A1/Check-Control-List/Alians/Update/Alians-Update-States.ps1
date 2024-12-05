#!/home/admin/app/PowerShell/Members

# Alians Update Script for Alians Members - 2023-08-15
# This script updates the Alians members list based on a new CSV file.

# Define the path to the new CSV file
csv_file_path="/path/to/new_members_list.csv"

function PowerShellUpdateMembers  {
# Check if the CSV file exists
if (-f "$csv_file_path") {
    Write-Output "Error: CSV file not found at $csv_file_path"
    exit 1
fi
}
# Read the CSV file using the Import-Csv cmdlet
$members = Import-Csv -Path "$csv_file_path" -Header FirstName,LastName,Email

    # Define the Alians members list
    $alians_members = @("John Doe", "Jane Smith", "Alice Johnson")

    # Check if the Alians members list is empty
    if ($alians_members.Count -eq 0) {
        Write-Output "Error: Alians members list is empty"
        exit 1
    }
    # Update the Alians members list
    foreach ($member in $members) {
        if ($alians_members -contains "$($member.FirstName) $($member.LastName)") {
            # Update the member's email address
            $member.Email = $member.Email.Replace("@example.com", "@newdomain.com")
            # Save the updated member back to the CSV file
            $member | Export-Csv -Path "$csv_file_path" -NoTypeInformation -Append
        }
        else {
            Write-Output "Warning: Member $($member.FirstName) $($member.LastName) not found in Alians members list"
        }
    }
    Write-Output "Alians members list updated successfully"
}

# Call the PowerShellUpdateMembers function
PowerShellUpdateMembers

