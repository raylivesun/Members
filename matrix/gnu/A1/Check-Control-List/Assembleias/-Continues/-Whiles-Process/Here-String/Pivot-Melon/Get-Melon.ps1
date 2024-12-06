#!/home/admin/app/PowerShell/Members

# Get Key Unlock Password from Key Vault
$keyVaultUrl = "https://your-key-vault-name.vault.azure.net"
$keyVaultClientId = "your-client-id"
$keyVaultClientSecret = "your-client-secret"
$keyVaultSecretName = "your-secret-name"
$keyVaultKeyPath = "/secrets/$keyVaultSecretName"

$secureClient = New-Object System.Net.Http.HttpClient


# Authenticate with Key Vault
$authContext = New-Object Microsoft.Azure.Services.KeyVault.Authentication.AzureCliAuthentication
$authContext.Authenticate()

$keyVaultClient = New-Object Microsoft.Azure.Services.KeyVault.KeyVaultClient($authContext)

# Get the Key Unlock Password from Key Vault
$keyVaultSecret = $keyVaultClient.GetSecretAsync($keyVaultUrl, $keyVaultKeyPath).Result
$keyUnlockPassword = $keyVaultSecret.Value

# Set the Key Unlock Password in the environment variables
$env:KEY_UNLOCK_PASSWORD = $keyUnlockPassword

# Set the PowerShell execution policy to RemoteSigned
Set-ExecutionPolicy RemoteSigned

# Import the PowerShell Module
Import-Module.\Members.psm1

# Execute the PowerShell script to fetch and update members
.\Members.ps1

Write-Output $keyVaultClientId | Set-Content -Path.\clientId.txt
Write-Output $keyVaultClientSecret | Set-Content -Path.\clientSecret.txt
Write-Output $keyVaultClient | Set-Content -Path.\keyVaultClient.txt
Write-Output $secureClient | Set-Content -Path.\secureClient.txt
Write-Output $keyVaultUrl | Set-Content -Path.\keyVaultUrl.txt
Write-Output $keyVaultSecretName | Set-Content -Path.\keyVaultSecretName.txt
Write-Output $keyVaultKeyPath | Set-Content -Path.\keyVaultKeyPath.txt
Write-Output $env:KEY_UNLOCK_PASSWORD | Set-Content -Path.\keyUnlockPassword.txt

