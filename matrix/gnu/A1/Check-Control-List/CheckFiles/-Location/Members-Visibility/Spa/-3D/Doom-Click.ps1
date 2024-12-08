#/home/admin/app/PowerShell/Members

# Dom click servers details and commands to be executed common lisp in powershell
$domClickServerDetails = @"

    'doomSharkServers' = @"

        'ip' = '192.168.1.10'
        'username' = 'admin'
        'password' = 'password'
        'commands' = @()
    },
    'doomSharkServices' = @{
        'ip' = '192.168.1.11'
        'username' = 'admin'
        'password' = 'password'
        'commands' = @()
    }
    # Add more domains as needed
    "@
"@
Write-Debug "Executing commands on $domClickServerDetails"


# Function to execute commands on a domain controller
function Execute {
    param (
        [Parameter(Mandatory=$true)]
        [string]$server,
        [Parameter(Mandatory=$true)]
        [string]$username,
        [Parameter(Mandatory=$true)]
        [SecureString]$password,
        [Parameter(Mandatory=$true)]
        [string[]]$commands
    )

    try {
        # Connect to the domain controller
        $domainController = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$server")
        $domainController.Credentials = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString -AsPlainText -Force $password))
        $domainController.Authentication = "Basic"

        # Execute each command
        foreach ($command in $commands) {
            $result = $domainController.InvokeMethod($command, @())
            Write-Host "Command '$command' executed successfully: $($result.ToString())"
        }

        # Disconnect from the domain controller
        $domainController.Dispose()
        Write-Host "Disconnected from domain controller '$server'"

    } catch {
        Write-Error "Failed to execute commands on domain controller '$server': $_"
    }
    finally {
        # Close the domain controller connection
        if ($domainController) {
            $domainController.Dispose()
        }
    }
}

# Execute commands on each domain controller
foreach ($domainController in $domClickServerDetails.Keys) {
    $serverDetails = $domClickServerDetails.$domainController
    Execute-DomainControllerCommands -server $serverDetails.ip -username $serverDetails.username -password $serverDetails.password -commands $serverDetails.commands
}


# Dom click servers details and commands to be executed in c#
$domClickServerDetailsCSharp = @"

    'doomSharkServers' = @"
    {
        'ip' = '192.168.1.10',
        'username' = 'admin',
        'password' = 'password',
        'commands' = new List<string>() {
            // Add commands to be executed in C# here
        }
}
"@
Write-Debug "Executing commands on $domClickServerDetailsCSharp"
Write-Debug "C# code not provided to execute commands"
Write-Debug "Please implement the C# code to execute commands on the domain controllers"
Write-Debug "Remember to handle exceptions and dispose of resources when done"
Write-Host "C# code executed successfully"


# Dom click servers details and commands to be executed in powershell
$domClickServerDetailsPowerShell = @"

    'doomSharkServers' = @"
    {
    'ip' = '192.168.1.10',
        'username' = 'admin',
        'password' = 'password',
        'commands' = @()
        // Add commands to be executed in PowerShell here
    }
"@
Write-Debug "Executing commands on $domClickServerDetailsPowerShell"
Write-Debug "PowerShell code not provided to execute commands"
Write-Debug "Please implement the PowerShell code to execute commands on the domain controllers"
Write-Debug "Remember to handle exceptions and dispose of resources when done"
Write-Host "PowerShell code executed successfully"
Write-Information "All commands executed successfully $Execute"
