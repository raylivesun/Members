#!/home/admin/app/PowerShell/Members

# Alians Namespaces and modules for easier use in the script
using namespace System.Management.Automation
using namespace System.Management.Automation.Runspaces

# Set the remote server
$remoteServer = 'your_remote_server'

# Set the remote username and password
$username = 'your_username'
$password = ConvertTo-SecureString 'your_password' -AsPlainText -Force
Write-Output $password
# Set the remote PowerShell script to be executed
$scriptPath = 'C:\path\to\your\script.ps1'

# Set the remote PowerShell script arguments
$arguments = @('-argument1', 'value1', '-argument2', 'value2')

try {
    # Create a remote PowerShell runspace connection
    $remoteRunspace = New-PSSessionConfiguration -Name 'DefaultRemoteRunspace' -ConnectionType RemoteDesktop -ComputerName $remoteServer -Credential $username -Authentication Password -Force

    $runspace = RunspaceFactory.CreateRunspace($remoteRunspace)
    $runspace.Open()

    # Execute the remote PowerShell script
    $command = New-PSScriptCommand -FilePath $scriptPath -ArgumentList $arguments
    $job = $runspace.InvokeCommand($command)

    # Wait for the job to complete
    $job.Wait()

    # Get the job results
    $jobResults = $job.JobStateInfo.StateDescription
    Write-Host "Job completed with state: $jobResults"

    # Close the remote PowerShell runspace
    $runspace.Close()
}
catch {
    Write-Host "Error occurred while executing remote PowerShell script: $_"
}

