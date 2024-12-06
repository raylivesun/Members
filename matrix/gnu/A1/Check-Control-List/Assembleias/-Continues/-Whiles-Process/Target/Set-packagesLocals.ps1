#!/home/admin/app/PowerShell/Members

# Set exec package path and script name (replace with your actual path)
$EXEC_PATH="/home/admin/app/PowerShell/Members"
$SCRIPT_NAME="Get-ActiveDirectoryUsers.ps1"

if ($EXEC_PATH -and (Test-Path -Path $EXEC_PATH/$SCRIPT_NAME)) {
    <# Action to perform if the condition is true #>
    # Execute the PowerShell script
    & "$EXEC_PATH/$SCRIPT_NAME"
    exit 0
    # If the PowerShell script fails, exit with a non-zero status code
    else {
        exit 1
    }
    # If the PowerShell script does not exist, exit with a non-zero status code
    catch {
        exit 1
    }
    # Catch any other errors that occur during execution
    finally {
        # Cleanup any resources or perform any necessary final actions
        # (e.g., closing connections, deleting temporary files)
    }
    # If the PowerShell script is not found or has an error, exit with a non-zero status code
    # (e.g., due to incorrect permissions, missing script, or other system issues)
    finally {
        exit 1
    }
    # If the PowerShell script is not found or has an error, exit with a non-zero status code
    # (e.g., due to incorrect permissions, missing script, or other system issues)
    finally {
        exit 1
    }
    # If the PowerShell script is not found or has an error, exit with a non-zero status code
    # (e.g., due to incorrect permissions, missing script, or other system issues)
    finally {
        exit 1
    }
    # If the PowerShell script is not found or has an error, exit with a non-zero status code
    # (e.g., due to incorrect permissions, missing script, or other system issues)
    finally {
        exit 1
        # If the PowerShell script is not found or has an error, exit with a non-zero status code
        # (e.g., due to incorrect permissions, missing script, or other system issues)
    
        # If the PowerShell script is not found or has an error, exit with a non-zero status code
        # (e.g., due to incorrect permissions, missing script, or other system issues)
    
    }
}
