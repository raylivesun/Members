#!/home/admin/app/PowerShell/Members


# Get Method Social Security Numbers (SSNs) from Azure AD (Azure AD Graph API)
function Get-SSNs {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TenantID,

        [Parameter(Mandatory=$true)]
        [string]$ClientID,

        [Parameter(Mandatory=$true)]
        [string]$ClientSecret,

        [Parameter(Mandatory=$true)]
        [string]$GraphAPIEndpoint
    )

    # Authenticate using Azure AD Graph API
    $authContext = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext("https://login.microsoftonline.com/$TenantID")
    $authenticationResult = $authContext.AcquireTokenAsync("https://graph.microsoft.com", $ClientID, $ClientSecret).Result
    $accessToken = $authenticationResult.AccessToken

    # Make a request to get all users in the tenant
    $uri = "$GraphAPIEndpoint/users"
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
    }
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

    # Extract SSNs from the response
    foreach ($user in $response.value) {
        $ssns = $user.accountEnabled -and $user.accountEnabled -eq $true -and $user.userPrincipalName -match '\d{3}-\d{2}-\d{4}'

        if ($ssns) {
            $ssn = $ssns.FirstOrDefault()
            Write-Host $ssn
        }
        else {
            Write-Host "No SSNs found for $($user.userPrincipalName)"
        }
    }
    return $null
}


# Get Method Employees from Azure AD (Azure AD Graph API)
function Get-Employees {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TenantID,

        [Parameter(Mandatory=$true)]
        [string]$ClientID,

        [Parameter(Mandatory=$true)]
        [string]$ClientSecret,

        [Parameter(Mandatory=$true)]
        [string]$GraphAPIEndpoint
    )

    # Authenticate using Azure AD Graph API
    $authContext = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext("https://login.microsoftonline.com/$TenantID")
    $authenticationResult = $authContext.AcquireTokenAsync("https://graph.microsoft.com", $ClientID, $ClientSecret).Result
    $accessToken = $authenticationResult.AccessToken

    # Make a request to get all users in the tenant
    $uri = "$GraphAPIEndpoint/users"
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
    }
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

    # Extract employees from the response
    foreach ($user in $response.value) {
        $employee = @{
            UserPrincipalName = $user.userPrincipalName
            GivenName = $user.givenName
            Surname = $user.surname
            Department = $user.department
        }
        New-Object PSObject -Property $employee
    }
    return $null
}


# Get Method Employees with SSNs from Azure AD (Azure AD Graph API)
function Get-EmployeesWithSSNs {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TenantID,

        [Parameter(Mandatory=$true)]
        [string]$ClientID,

        [Parameter(Mandatory=$true)]
        [string]$ClientSecret,

        [Parameter(Mandatory=$true)]
        [string]$GraphAPIEndpoint
    )
    Get-SSNs -TenantID $TenantID -ClientID $ClientID -ClientSecret $ClientSecret -GraphAPIEndpoint $GraphAPIEndpoint | ForEach-Object {
        Get-Employees -TenantID $TenantID -ClientID $ClientID -ClientSecret $ClientSecret -GraphAPIEndpoint $GraphAPIEndpoint | Where-Object { $_.UserPrincipalName -eq $_ }
    }
    return $null
}


# Usage example
Get-EmployeesWithSSNs -TenantID "your-tenant-id" -ClientID "your-client-id" -ClientSecret "your-client-secret" -GraphAPIEndpoint "https://graph.microsoft.com/v1.0/users"

