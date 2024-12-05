#!/home/admin/app/PowerShell/Members

<#
.SYNOPSIS

Retrieves a planet

.DESCRIPTION

A command that retrieves a planet by id

.PARAMETER Id
Specifies the record you want back

.INPUTS

Id

.OUTPUTS

Object. 

.EXAMPLE

PS> Get-Help 1

#>
Function Get-Help {
    implementation...
  }

  param(
    [Parameter(Mandatory=$true)]
    [int]$Id
  )
  
  $help = Get-HelpById $Id
  
  if ($help) {
    Write-Object $help
    return
  }

  Write-Error "Help with id $Id not found"


Get-Help -Action Get-HelpById | Format-Table Id, Name, Category, Tags, Synopsis, Description, Examples

