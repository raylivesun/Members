#!/home/admin/app/PowerShell/Members

# Check Types of PowerShell Version Installed
if ((Get-Host).Version.Major -lt 6) {
    Write-Error "PowerShell version 6 or higher is required."
    exit 1
}

# Check if the user has the required permissions
if (!(Test-Path -Path "$PSScriptRoot\powershell.exe")) {
    Write-Error "PowerShell is not installed or not in the expected location."
    exit 1
}

# Check if the required modules are installed
Get-Module -Name PsWindowsUpdate, ActiveDirectory, ActiveDirectoryDsc, ExchangeOnlineManagement, AzureAD, AzureADPreview, AzureADPreview.GraphAPI, AzureADPreview.ServiceManagement, AzureADPreview.Storage, AzureADPreview.WebApps, AzureADPreview
if ($LastExitCode -ne 0) {
    Write-Error "Required PowerShell modules are not installed."
    exit 1
}


# Import required modules
Import-Module ActiveDirectory
Import-Module ActiveDirectoryDsc
Import-Module ExchangeOnlineManagement
Import-Module AzureAD


# Validate parameters
if ($null -eq $tenant -or $null -eq $username -or $null -eq $password -or $null -eq $domain -or $null -eq $ou) {
    Write-Error "Missing required parameter(s)."
    exit 1
}

# Validate the domain
if (!(Test-Connection -ComputerName $domain -Count 1 -Quiet)) {
    Write-Error "Invalid domain."
    exit 1
}


# Set the Exchange Online URL
Set-Variable -Name ExchangeOnlineUrl -Value $exchangeOnlineUrl -Scope Local:Script -PassThru

# Connect to Active Directory
Write-Host "Connecting to Active Directory..."
$credential = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString -AsPlainText -Force $password -Force))
Connect-AD -Credential $credential -ErrorAction Stop
if ($LastExitCode -ne 0) {
    Write-Error "Failed to connect to Active Directory."
    exit 1
}
                                                    

# Set variables
$tenant = $PSScriptRoot.Parameters.Get_Item('tenant').Value
$username = $PSScriptRoot.Parameters.Get_Item('username').Value
$password = $PSScriptRoot.Parameters.Get_Item('password').Value
$domain = $PSScriptRoot.Parameters.Get_Item('domain').Value
$ou = $PSScriptRoot.Parameters.Get_Item('ou').Value
$exchangeOnlineUrl = "https://outlook.office365.com/ews/exchange.asmx"


# Connect to Exchange Online
Write-Host "Connecting to Exchange Online..."
$credential = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString -AsPlainText -Force $password -Force))
Connect-ExchangeOnline -UserPrincipalName $username -Password $credential -ErrorAction Stop
if ($LastExitCode -ne 0) {
    Write-Error "Failed to connect to Exchange Online."
    exit 1
}

# Get the list of mailboxes in the specified organizational unit
Write-Host "Getting mailboxes in the specified organizational unit..."
$mailboxes = Get-ADUser -Filter {Enabled -eq $true -And ObjectClass -eq "user" -And OrganizationalUnit -eq "$ou" } -Properties Name
if ($null -eq $mailboxes) {
    Write-Error "No mailboxes found in the specified organizational unit."
    exit 1
}

# Get the list of mailboxes in the specified domain
Write-Host "Getting mailboxes in the specified domain..."
$mailboxesInDomain = Get-ADUser -Filter {Enabled -eq $true -And ObjectClass -eq "user" -And Domain -eq "$domain" } -Properties Name
if ($null -eq $mailboxesInDomain) {
    Write-Error "No mailboxes found in the specified domain."
    exit 1
}

# Compare the two lists and find the common mailboxes
Write-Host "Comparing mailboxes..."
$commonMailboxes = $mailboxes | Where-Object { $mailboxesInDomain.Name -contains $_.Name }
if ($null -eq $commonMailboxes) {
    Write-Host "No common mailboxes found."
    exit 0
}

# Download and send the common mailboxes' mail logs to Exchange Online
Write-Host "Downloading and sending mail logs..."
foreach ($mailbox in $commonMailboxes) {
    $mailboxName = $mailbox.Name
    $mailboxDisplayName = $mailbox.Name.Split('@')[0]

    # Download the mail logs
    $mailLogPath = Join-Path -Path $PSScriptRoot -ChildPath "maillogs"
    New-Item -ItemType Directory -Path $mailLogPath -Force | Out-Null
    $mailLogFilePath = Join-Path -Path $mailLogPath -ChildPath "$mailboxName.eml"
    Get-MailboxLog -Identity $mailboxName -LogFolderPath $mailLogPath -LogFileName "$mailboxName.eml" -ResultSize Unlimited
    if ($LastExitCode -ne 0) {
        Write-Warning "Failed to download mail log for mailbox $mailboxName."
        continue
    }

    # Send the mail logs to Exchange Online
    Write-Host "Sending mail log for mailbox $mailboxDisplayName..."
    $mailLogContent = Get-Content -Path $mailLogFilePath
    $mailItem = New-Object -TypeName Microsoft.Exchange.WebServices.Data.EmailMessage
    $mailItem.Subject = "Mail Log for $mailboxDisplayName"
    $mailItem.Body = New-Object -TypeName Microsoft.Exchange.WebServices.Data.BodyContent -Value $mailLogContent
    $mailItem.ToRecipients.Add($mailbox.PrimarySmtpAddress)
    $mailItem.Send()
    if ($LastExitCode -ne 0) {
        Write-Warning "Failed to send mail log for mailbox $mailboxDisplayName."
        continue
    }
    Remove-Item -Path $mailLogFilePath
}

Write-Host "Finished."
