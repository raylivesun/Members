#!/home/admin/app/PowerShell/Members

# Alians Grayson and Evelyn's aliases for PowerShell and .NET
Set-Alias ps 'C:\Program Files\PowerShell\7\pwsh.exe'
Set-Alias dotnet 'C:\Program Files\dotnet\dotnet.exe'

# Load the aliases for PowerShell and .NET
Import-Module Aliases.ps1

# Check if the PowerShell version is at least 7.0.0
$psVersion = (Get-Command pwsh).Version
if ($psVersion -lt [Version]'7.0.0') {
    Write-Host "Error: PowerShell version 7.0.0 or later is required."
    exit 1
}

# Check if the .NET Core SDK is installed
if (!(Test-Path -Path 'C:\Program Files\dotnet\dotnet.exe')) {
    Write-Host "Error: .NET Core SDK is not installed. Please download and install it from https://dotnet.microsoft.com/download."
    exit 1
}

# Check if the required tools are installed
function CheckTool {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ToolName,

        [Parameter(Mandatory=$true)]
        [string]$DownloadUrl
    )

    $toolPath = Get-Command $ToolName.Split()[0]
    if (!(Test-Path -Path $toolPath)) {
        Write-Host "Error: $ToolName is not installed. Downloading and installing it from $DownloadUrl."
        Start-Process -FilePath (New-Object System.Net.WebClient).DownloadString($DownloadUrl) -Wait
    }
    else {
        Write-Host "$ToolName is already installed."
    }
}


# Check for required tools
Check-Tool 'dotnet-ef' 'https://aka.ms/dotnet-ef-core-download'
Check-Tool 'dotnet-aspnet-codegenerator' 'https://docs.microsoft.com/aspnet/core/fundamentals/tools/dotnet-aspnet-codegenerator'
Check-Tool 'dotnet-sql-cache' 'https://github.com/aspnet/Caching/tree/master/src/Microsoft.Extensions.Caching.SqlServer'
Check-Tool 'dotnet-aspnet-identity-entity-framework' 'https://github.com/aspnet/Identity/tree/master/src/Microsoft.AspNetCore.Identity.EntityFrameworkCore'

# Restore the project
dotnet restore

# Scaffold the Identity and SQL Server cache
dotnet aspnet-codegenerator identity -f -p WebApp.csproj -d WebApp.Data.csproj -o Identity
dotnet aspnet-codegenerator cache -f -p WebApp.csproj -d WebApp.Data.csproj -o Identity/Services

# Build the project
dotnet build

# Run the project
dotnet run
