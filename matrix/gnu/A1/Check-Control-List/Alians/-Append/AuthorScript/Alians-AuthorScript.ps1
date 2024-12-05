#!/home/admin/app/PowerShell/Members

# Alians Authorization Module for Active Directory (AD)
# Version: 1.0.0
# Author: 
# Contributors:
#
# This script provides a way to manage members in Active Directory (AD) using PowerShell cmdlets.
#
# Requirements:
# - PowerShell 5.1 or later
# - Active Directory module installed in your PowerShell environment
# - The necessary Active Directory permissions to perform the required operations
#
# Usage:
# 1. Copy this script to a location where it can be executed.
# 2. Update the variables at the top of the script according to your AD setup.
# 3. Run the script using the appropriate command-line arguments.
#
# Examples:
# 1. Add a new member to a group:
#   .\Members.ps1 -Action Add -Group "Domain Admins" -SamAccountName "newmember"
# 2. Remove a member from a group:
#   .\Members.ps1 -Action Remove -Group "Domain Admins" -SamAccountName "newmember"
# 3. List all members in a group:
#   .\Members.ps1 -Action List -Group "Domain Admins"

# Variables
$ADRoot = "DC=example,DC=com"  # Replace with your AD domain root
$AdminUsername = "administrator@example.com"  # Replace with your admin username
$AdminPassword = ConvertTo-SecureString "password123" -AsPlainText -Force  # Replace with your admin password
$UseSSL = $true  # Set to $true to use SSL/TLS for the connection

# Function to execute the desired action on a group
function PerformAction {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Action,

        [Parameter(Mandatory = $true)]
        [string]$Group,

        [Parameter(Mandatory = $true)]
        [string]$SamAccountName
    )
    # Connect to the AD
    Connect-AD -Server $ADRoot -Credential $AdminUsername $AdminPassword -UseSSL:$UseSSL

    try {
        switch ($Action) {
            "Add" {
                Add-ADGroupMember -Identity $Group -Members $SamAccountName
                Write-Host "Added $SamAccountName to group $Group."
            }
            "Remove" {
                Remove-ADGroupMember -Identity $Group -Members $SamAccountName
                Write-Host "Removed $SamAccountName from group $Group."
            }
            "List" {
                $members = Get-ADGroupMember -Identity $Group -Properties MemberSamAccountName | Select-Object MemberSamAccountName
                Write-Host "Members in group $Group"
                foreach ($member in $members) {
                    Write-Host $member.MemberSamAccountName
                }
            }
            default {
                Write-Host "Invalid action. Use Add, Remove, or List."
            }
        }
        # Disconnect from the AD
        Disconnect-AD -Force -ErrorAction SilentlyContinue
        exit 0
    } catch {
        Write-Host "An error occurred: $_"
        # Disconnect from the AD
        Disconnect-AD -Force -ErrorAction SilentlyContinue
        exit 1
    }
    finally {
        # Disconnect from the AD
        Disconnect-AD -Force -ErrorAction SilentlyContinue
    }
}

# Get the command-line arguments
param (
    [Parameter(Mandatory = $true)]
    [string]$Action,

    [Parameter(Mandatory = $true)]
    [string]$Group,

    [Parameter(Mandatory = $true)]
    [string]$SamAccountName
)

# Execute the desired action
Perform-Action -Action $Action -Group $Group -SamAccountName $SamAccountName

