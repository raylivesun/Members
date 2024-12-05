#!/home/admin/app/PowerShell/Members

# Alians Summary Convert script for Alians summary CSV files
#
# This script reads a CSV file containing Alians summary data and converts it to a
# JSON format. The input CSV file should have the following columns:
#
# - Alians Name
# - Total Memberships
# - Memberships in Active Status
# - Memberships in Inactive Status
# - Memberships in Pending Status
# - Memberships in Expired Status
# - Memberships in Suspended Status
# - Memberships in Terminated Status
# - Memberships in Grace Period Status
# - Memberships in Deceased Status
# - Memberships in Archived Status
# - Memberships in Unpaid Status
# - Memberships in Cancelled Status
# - Memberships in Renewed Status
# - Memberships in Expired Renewal Status
# - Memberships in Suspended Renewal Status
# - Memberships in Terminated Renewal Status
# - Memberships in Grace Period Renewal Status
# - Memberships in Deceased Renewal Status
# - Memberships in Archived Renewal Status
# - Memberships in Unpaid Renewal Status
# - Memberships in Cancelled Renewal Status
# - Memberships in Renewed Renewal Status
# - Memberships in Expired Renewal Renewal Status
# - Memberships in Suspended Renewal Renewal Status
# - Memberships in Terminated Renewal Renewal Status
# - Memberships in Grace Period Renewal Renewal Status
# - Memberships in Deceased Renewal Renewal Status
# - Memberships in Archived Renewal Renewal Status
# - Memberships in Unpaid Renewal Renewal Status
# - Memberships in Cancelled Renewal Renewal Status
# - Memberships in Renewed Renewal Renewal Status
# - Memberships in Expired Renewal Renewal Renewal Status
# - Memberships in Suspended Renewal Renewal Status
# - Memberships in Terminated Renewal Renewal Status
# - Memberships in Grace Period Renewal Renewal Status
# - Memberships in Deceased Renewal Renewal Status
# - Memberships in Archived Renewal Renewal Status
# - Memberships in Unpaid Renewal Renewal Status
# - Memberships in Cancelled Renewal Renewal Status
# - Memberships in Renewed Renewal Renewal Status
# - Memberships in Expired Renewal Renewal Renewal Status
# - Memberships in Suspended Renewal Renewal Status
# - Memberships in Terminated Renewal Renewal Status
# - Memberships in Grace Period Renewal Renewal Status


# Read the input CSV file
read -ra CSV_DATA (tail -n +2 "$1")

# Initialize an empty JSON object
JSON_DATA='{'

# Loop through each row in the CSV data
for (ROW in "${CSV_DATA[@]}"){
    # Split the row into columns using commas as separators
    IFS=',' read -ra COLS "$ROW"

    # Extract the Alians Name and Total Memberships
    ALIANS_NAME="${COLS[0]}"
    TOTAL_MEMBERSHIPS="${COLS[1]}"

    # Initialize an empty object for the Alians data
    ALIANS_DATA='{'
}
    # Loop through the remaining columns in the row
    for ((i = 2 i ${#COLS[@]} i++)) {
        # Extract the status and membership count
        STATUS="${COLS[i]}"
        MEMBERSHIP_COUNT="${COLS[i+1]}"

        # Check if the status is not empty
        if (-n "$STATUS") {
            # Add the status and membership count to the Alians data object
            ALIANS_DATA+="\"$STATUS\": $MEMBERSHIP_COUNT,"
        fi
        ((i++))
        }
        # Add the Alians data object to the JSON data object
        JSON_DATA+="\"$ALIANS_NAME\": $ALIANS_DATA},"
    }

    # Remove the trailing comma and closing curly brace from the JSON data object
    JSON_DATA="${JSON_DATA%,}"
    JSON_DATA+="}"
    # Add the JSON data object to the JSON data array
    JSON_DATA+=","

# Remove the trailing comma from the JSON data array
JSON_DATA="${JSON_DATA%,}"


# Print the final JSON data
Write-Host "$JSON_DATA}"


