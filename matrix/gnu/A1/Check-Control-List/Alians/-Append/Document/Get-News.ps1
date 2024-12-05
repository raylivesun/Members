#!/home/admin/app/PowerShell/Members

<#PSScriptInfo

    .VERSION 1.0

    .GUID <a unique GUID>

    .AUTHOR <email>

    .COMPANYNAME <company>

    .COPYRIGHT

    .TAGS the tags you want, comma separated

    .LICENSEURI https://mit-license.org

    .PROJECTURI link to for example github, if that's where you store the code

    .ICONURI

    .EXTERNALMODULEDEPENDENCIES 

    .REQUIREDSCRIPTS

    .EXTERNALSCRIPTDEPENDENCIES

    .RELEASENOTES


    .PRIVATEDATA

    #>

    <# 

    .DESCRIPTION 
     Description 

    #> 

    # Here's the rest of your script
    param(
        [Parameter(Mandatory=$true)]
        [string]$username,

        [Parameter(Mandatory=$true)]
        [SecureString]$password,

        [Parameter(Mandatory=$true)]
        [string]$domain
    )

    # Replace these placeholders with your actual credentials
    $domain = "your_domain"
    $username = "your_username"
    $password = ConvertTo-SecureString -String "your_password" -AsPlainText -Force
    $securePassword = ConvertTo-SecureString -AsPlainText -Force

    # Set up the context
    $ctx = New-Object System.Management.Automation.RunspaceContext -Property @{
        Username = $username;
        Password = $securePassword;
        Domain = $domain
    }

    # Create the runspace
    $runspace = RunspaceFactory.CreateRunspace($ctx)

    # Open the runspace
    $runspace.Open()

    # Import the Active Directory module
    $runspace.SessionState.ImportModule('PSModule.ActiveDirectory')

    # Authenticate with the domain
    $runspace.InvokeCommand.NewScriptBlock({
        $global| ADUser = Get-ADUser -Identity $args[0]
    }) 

    # Get the user's groups
    $groups = Get-ADUser -Identity $username -Properties MemberOf | Select-Object -ExpandProperty MemberOf

    # Print the user's groups
    Write-Host "Groups for $username"
    foreach ($group in $groups) {
        Write-Host $group.Name
        Write-Host ""
    }

    # Close the runspace
    $runspace.Close()
    $runspace.Dispose()
    # End of script
    # Replace the placeholders with your actual credentials and domain
