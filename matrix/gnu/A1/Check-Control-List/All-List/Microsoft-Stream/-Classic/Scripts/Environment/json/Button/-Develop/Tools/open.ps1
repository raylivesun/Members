#!/home/admin/app/PowerShell/Members

# All-List Tools for PowerShell Core (ALTT)
# Author: @MichaBauer
# GitHub: https://github.com/MichaBauer/All-List-Tools-PowerShell-Core

# Import required modules
Import-Module ActiveDirectory
Import-Module ActiveDirectory.Management
Import-Module ActiveDirectory.Tools
Import-Module ActiveDirectory.Exchange.PowerShell
Import-Module ActiveDirectory.PSDrive
Import-Module ActiveDirectory.PSProvider
Import-Module ActiveDirectory.WsMan
Import-Module ActiveDirectory.Tools.ADSync

# Define variables
$domainController = "dc.domain.com"
$domain = "domain.com"
$domainAdminUsername = "domain\administrator"
$domainAdminPassword = ConvertTo-SecureString -String "password" -AsPlainText -Force
$outputFolder = "C:\output"
$logFile = "$outputFolder\all-list-tools-powershell-core.log"

# Create output folder if it doesn't exist
if (!(Test-Path -Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder -Force
    Write-Host "Created output folder: $outputFolder"
}

# Log start time
Write-Host "All-List-Tools PowerShell Core started at $(Get-Date)" | Out-File -FilePath $logFile -Append

# Connect to the domain controller
try {
    Connect-ADDomainController -Server $domainController -Credential $domainAdminUsername -Password $domainAdminPassword
    Write-Host "Connected to domain controller: $domainController"
    Write-Host "Logged in as: $($domainAdminUsername)"
    Write-Host ""
} catch {
    Write-Host "Failed to connect to domain controller: $($_.Exception.Message)"
    Write-Host "Check the domain controller's availability and try again."
    Write-Host ""
    exit 1
}

# Function to export AD objects to CSV
function Export-ADObjectCSV {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$CsvFileName
    )

    # Check if the CSV file already exists
    if (Test-Path -Path "$outputFolder\$CsvFileName") {
        Remove-Item -Path "$outputFolder\$CsvFileName" -Force
    }

    # Export AD objects to CSV
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Select-Object -Property * | Format-Table | ConvertTo-Csv -NoTypeInformation | Out-File -FilePath "$outputFolder\$CsvFileName" -Append
    Write-Host "Exported $ObjectClass objects to $CsvFileName"
}

# Export AD objects to CSV
Export-ADObjectCSV -ObjectClass "User" -CsvFileName "users.csv"
Export-ADObjectCSV -ObjectClass "Group" -CsvFileName "groups.csv"
Export-ADObjectCSV -ObjectClass "Computer" -CsvFileName "computers.csv"

# Function to export AD objects to JSON
function Export-ADObjectJSON {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$JsonFileName
    )

    # Check if the JSON file already exists
    if (Test-Path -Path "$outputFolder\$JsonFileName") {
        Remove-Item -Path "$outputFolder\$JsonFileName" -Force
    }

    # Export AD objects to JSON
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | ConvertTo-Json | Out-File -FilePath "$outputFolder\$JsonFileName" -Append
    Write-Host "Exported $ObjectClass objects to $JsonFileName"
}

# Export AD objects to JSON
Export-ADObjectJSON -ObjectClass "User" -JsonFileName "users.json"
Export-ADObjectJSON -ObjectClass "Group" -JsonFileName "groups.json"
Export-ADObjectJSON -ObjectClass "Computer" -JsonFileName "computers.json"

# Function to export AD objects to EXCEL
function Export-ADObjectExcel {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$ExcelFileName
    )

    # Check if the Excel file already exists
    if (Test-Path -Path "$outputFolder\$ExcelFileName") {
        Remove-Item -Path "$outputFolder\$ExcelFileName" -Force
    }

    # Export AD objects to Excel
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Export-Excel -Path "$outputFolder\$ExcelFileName" -AutoSize -ShowHeaders
    Write-Host "Exported $ObjectClass objects to $ExcelFileName"
}

# Export AD objects to Excel
Export-ADObjectExcel -ObjectClass "User" -ExcelFileName "users.excel"
Export-ADObjectExcel -ObjectClass "Group" -ExcelFileName "groups.excel"
Export-ADObjectExcel -ObjectClass "Computer" -ExcelFileName "computers.excel"

# Function to export AD objects to PDF
function Export-ADObjectPDF {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$PdfFileName
    )

    # Check if the PDF file already exists
    if (Test-Path -Path "$outputFolder\$PdfFileName") {
        Remove-Item -Path "$outputFolder\$PdfFileName" -Force
    }

    # Export AD objects to PDF
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Export-Pdf -Path "$outputFolder\$PdfFileName" -AutoSize
    Write-Host "Exported $ObjectClass objects to $PdfFileName"
}

# Export AD objects to PDF
Export-ADObjectPDF -ObjectClass "User" -PdfFileName "users.pdf"


# Function to export AD objects to Word
function Export-ADObjectWord {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$WordFileName
    )
    # Check if the Word file already exists
    if (Test-Path -Path "$outputFolder\$WordFileName") {
        Remove-Item -Path "$outputFolder\$WordFileName" -Force
    }
    # Export AD objects to Word
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Export-Word -Path "$outputFolder\$WordFileName" -AutoSize
    Write-Host "Exported $ObjectClass objects to $WordFileName"
}

# Export AD objects to Word
Export-ADObjectWord -ObjectClass "User" -WordFileName "users.docx"
Export-ADObjectWord -ObjectClass "Group" -WordFileName "groups.docx"
Export-ADObjectWord -ObjectClass "Computer" -WordFileName "computers.docx"

# Function to export AD objects to HTML
function Export-ADObjectHTML {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$HtmlFileName
    )
    # Check if the HTML file already exists
    if (Test-Path -Path "$outputFolder\$HtmlFileName") {
        Remove-Item -Path "$outputFolder\$HtmlFileName" -Force
    }
    # Export AD objects to HTML
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Export-HTML -Path "$outputFolder\$HtmlFileName" -AutoSize
    Write-Host "Exported $ObjectClass objects to $HtmlFileName"
}

# Export AD objects to HTML
Export-ADObjectHTML -ObjectClass "User" -HtmlFileName "users.html"
Export-ADObjectHTML -ObjectClass "Group" -HtmlFileName "groups.html"
Export-ADObjectHTML -ObjectClass "Computer" -HtmlFileName "computers.html"

# Function to export AD objects to Markdown
function Export-ADObjectMarkdown {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$MarkdownFileName
    )
    # Check if the Markdown file already exists
    if (Test-Path -Path "$outputFolder\$MarkdownFileName") {
        Remove-Item -Path "$outputFolder\$MarkdownFileName" -Force
    }
    # Export AD objects to Markdown
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Export-Markdown -Path "$outputFolder\$MarkdownFileName" -AutoSize
    Write-Host "Exported $ObjectClass objects to $MarkdownFileName"
}

# Export AD objects to Markdown
Export-ADObjectMarkdown -ObjectClass "User" -MarkdownFileName "users.md"
Export-ADObjectMarkdown -ObjectClass "Group" -MarkdownFileName "groups.md"
Export-ADObjectMarkdown -ObjectClass "Computer" -MarkdownFileName "computers.md"

# Function to export AD objects to TSV
function Export-ADObjectTSV {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ObjectClass,
        [Parameter(Mandatory=$true)]
        [string]$TsvFileName
    )
    # Check if the TSV file already exists
    if (Test-Path -Path "$outputFolder\$TsvFileName") {
        Remove-Item -Path "$outputFolder\$TsvFileName" -Force
    }
    # Export AD objects to TSV
    Get-ADObject -Filter "objectClass -eq '$ObjectClass'" | Export-TSV -Path "$outputFolder\$TsvFileName" -AutoSize
    Write-Host "Exported $ObjectClass objects to $TsvFileName"
}

# Export AD objects to TSV
Export-ADObjectTSV -ObjectClass "User" -TsvFileName "users.tsv"
Export-ADObjectTSV -ObjectClass "Group" -TsvFileName "groups.tsv"
Export-ADObjectTSV -ObjectClass "Computer" -TsvFileName "computers.tsv"

# Log end time
Write-Host "All-List-Tools PowerShell Core completed at $(Get-Date)" | Out-File -FilePath $logFile -Append

# Clean up temporary files
Get-ChildItem -Path "$outputFolder" -Filter "*.tmp" | Remove-Item -Force
Write-Host "Temporary files cleaned up"

Write-Host "All-List-Tools PowerShell Core completed successfully"
Write-Host ./.local.csv $domain
Write-Host ".local.json $domain"
Write-Host ".local.excel $domain"
Write-Host ".local.pdf $domain"
Write-Host ".local.docx $domain"
Write-Host ".local.html $domain"
Write-Host ".local.md $domain"
Write-Host ".local.tsv $domain"
Write-Host "Log file: $logFile"


