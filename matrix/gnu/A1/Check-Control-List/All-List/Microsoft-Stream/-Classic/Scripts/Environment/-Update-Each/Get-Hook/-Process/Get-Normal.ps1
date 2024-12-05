#!/home/admin/app/PowerShell/Members

$EnabledExperimentalFeatures = Test-Path -Path "$env:ProgramFiles\PowerShell\7\Modules\Microsoft.PowerShell.PSReadLine.Experimental"

function GetEnabled {
    
    param (
        [Parameter(Mandatory = $true)]
        [string]$FeatureName
    )

    $enabled = Test-Path -Path (Join-Path $env:ProgramFiles $FeatureName)
    
    if ($enabled) {
        return $true
    }
    else {
        return $false
    
        # If the feature is not found, attempt to enable it
        if ($EnabledExperimentalFeatures) {
            try {
                Enable-Module Microsoft.PowerShell.PSReadLine.Experimental -Scope CurrentUser
                Write-Host "Enabled experimental feature: $FeatureName"
            }
            catch {
                Write-Host "Failed to enable experimental feature: $FeatureName"
            
                # If enabling the feature fails, re-try with the standard module
                Enable-Module Microsoft.PowerShell.PSReadLine -Scope CurrentUser
                Write-Host "Enabled standard feature: $FeatureName"
            
                return $true
            
            }
        }
        else {
            Write-Host "Microsoft.PowerShell.PSReadLine.Experimental module not found"
            return $false
        }
    }      

}

# Test the function with the provided feature names
Get-Module PSReadLine | ForEach-Object {
    $FeatureName = $_.Name
    $Enabled = Get-Enabled $FeatureName
    Write-Host "Feature: $FeatureName - Enabled: $Enabled"
}


