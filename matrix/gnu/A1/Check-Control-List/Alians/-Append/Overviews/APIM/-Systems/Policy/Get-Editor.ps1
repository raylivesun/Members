#!/home/admin/app/PowerShell/Members

# Alians script to manage PowerShell aliases and functions

# Function to list all PowerShell aliases
list-aliases | Format-Table Name, Definition

# Function to list all PowerShell functions
Get-Command | Where-Object {$_.CommandType -eq "Function"} | Format-Table Name, Definition

# Function to add a new PowerShell alias
add-alias -Name alias_name -Value command_name

# Function to remove a PowerShell alias
remove-alias -Name alias_name


# Function to add a new PowerShell function
function function_name {
    param (
        [Parameter(Mandatory=$true)]
        [string]$command
    )
    # Your function implementation here
}

# Function to remove a PowerShell function
Remove-Command -Name function_name -Force
