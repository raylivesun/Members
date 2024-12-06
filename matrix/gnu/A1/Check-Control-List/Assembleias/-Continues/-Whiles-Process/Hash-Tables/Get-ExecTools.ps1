#!/home/admin/app/PowerShell/Members

# Get Exec tools directory path from environment variable
$EXEC_TOOLS_DIR="$(dirname "$(readlink -f "$0")")"

# Set PowerShell script path
$SCRIPT_PATH="$EXEC_TOOLS_DIR/Members.ps1"
Write-Debug "PowerShell script path: $SCRIPT_PATH"

# Check if PowerShell script exists
if (!(Test-Path -Path $SCRIPT_PATH)) {
    Write-Error "PowerShell script not found: $SCRIPT_PATH"
    exit 1
}

# Execute PowerShell script with provided parameters
& "$SCRIPT_PATH" @($args)

