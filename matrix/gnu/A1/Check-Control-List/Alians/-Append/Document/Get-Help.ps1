#!/home/admin/app/PowerShell/Members

# Alians Document Library URL Get-Help Command
Get-Help Get-PnPListItemCollection -Online | Format-Table Name, Description, Aliases

# Alians Document Library Item Get-Help Command
Get-Help Get-PnPListItem -Online | Format-Table Name, Description, Aliases

# Alians Document Library Field Get-Help Command
Get-Help Get-PnPField -Online | Format-Table Name, Description, Aliases

# Alians Document Library Property Get-Help Command
Get-Help Get-PnPProperty -Online | Format-Table Name, Description, Aliases

# Alians Document Library Query Get-Help Command
Get-Help Get-PnPQuery -Online | Format-Table Name, Description, Aliases

# Alians Document Library View Get-Help Command
Get-Help Get-PnPView -Online | Format-Table Name, Description, Aliases

# Alians Document Library WebPart Get-Help Command
Get-Help Get-PnPWebPart -Online | Format-Table Name, Description, Aliases

# Alians Document Library WebPartProperty Get-Help Command
Get-Help Get-PnPWebPartProperty -Online | Format-Table Name, Description, Aliases

# Alians Document Library Taxonomy Get-Help Command
Get-Help Get-PnPTaxonomy -Online | Format-Table Name, Description, Aliases

# Alians Document Library TaxonomyGroup Get-Help Command
Get-Help Get-PnPTaxonomyGroup -Online | Format-Table Name, Description, Aliases

# Alians Document Library TaxonomyTerm Get-Help Command
Get-Help Get-PnPTaxonomyTerm -Online | Format-Table Name, Description, Aliases

# Alians Document Library TaxonomyTermSet Get-Help Command
Get-Help Get-PnPTaxonomyTermSet -Online | Format-Table Name, Description, Aliases

$Parms = @{
    Path = "./new.ps1"
    Version = "1.0"
    Author = "<email>"
    CompanyName = "<company>"
    Description = "Description"
  }
  New-ScriptFileInfo @Parms -PassThru
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Examples
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax, Remarks
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax, Remarks, Examples
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax, Remarks, Examples, ParameterSets
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax, Remarks, Examples, ParameterSets, Aliases
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax, Remarks, Examples, ParameterSets, Aliases, Examples
  Get-Help New-ScriptFileInfo -Online | Format-Table Name, Description, Aliases, Parameters, Examples, Syntax, Remarks, Examples, ParameterSets, Aliases, Examples
