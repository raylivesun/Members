#!/home/admin/app/PowerShell/Members

# Set exec package path and filename items for the execution
$EXEC_PACKAGE_PATH="/home/admin/app/PowerShell/Members"
$EXEC_FILENAME="Members.ps1"

# Construct the full path to the execution script
$EXEC_SCRIPT_PATH = Join-Path $EXEC_PACKAGE_PATH $EXEC_FILENAME

# Execute the PowerShell script
& $EXEC_SCRIPT_PATH

