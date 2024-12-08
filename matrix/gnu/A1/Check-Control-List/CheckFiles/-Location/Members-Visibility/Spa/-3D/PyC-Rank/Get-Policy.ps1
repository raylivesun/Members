#!/home/admin/app/PowerShell/Members

# Get AnyCondaPackage command from Conda package manager
$conda_package_manager_command="conda install -y -q -c conda-forge anyconda-package"


# Define the conda package names to be installed
$conda_packages = @("anyconda-package1", "anyconda-package2", "anyconda-package3")

# Loop through each conda package name
foreach ($conda_package in $conda_packages) {
    # Execute the conda package installation command
    & $conda_package_manager_command $conda_package

    # Check the exit code of the command
    if ($LASTEXITCODE -ne 0) {
        # If the command exits with a non-zero exit code, print an error message and exit the script
        Write-Error "Failed to install conda package '$conda_package'. Exit code: $LASTEXITCODE"
        exit 1
    }
    else {
        # If the command exits with a zero exit code, print a success message
        Write-Host "Successfully installed conda package '$conda_package'"
    }
}


# Print a success message when all conda packages have been installed
Write-Host "All conda packages have been installed successfully"
