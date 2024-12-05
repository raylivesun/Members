#!/home/admin/app/PowerShell/Members

# Alians Graph database connection details (replace with your own)
$aliansGraphEndpoint = "https://graph.microsoft.com"
$aliansGraphAPIVersion = "v1.0"
$aliansGraphToken = "your_alians_graph_access_token"

# Function to retrieve all contacts from Alians Graph
function Get-AliansGraphContacts {
    param (
        [Parameter(Mandatory=$true)]
        [string]$accessToken
    )

    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
    }
    $response = Invoke-RestMethod -Method Get -Uri "$aliansGraphEndpoint/v1.0/contacts" -Headers $headers

    return $response.value
}

# Function to retrieve all mailboxes from Alians Graph
function Get-AliansGraphMailboxes {

    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
    }
    $response = Invoke-RestMethod -Method Get -Uri "$aliansGraphEndpoint/v1.0/users/$userId/mailboxes" -Headers $headers
    return $response.value
}

# Function to create a new contact in Alians Graph
function New-AliansGraphContact {
  
    $body = @{
        givenName = $givenName
        familyName = $familyName
        emailAddresses = @{
            value = $emailAddress
            type = "work"
        }
        preferredLanguage = "en-US"
    }
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
        Content = -Type = "application/json"
    }
    $response = Invoke-RestMethod -Method Post -Uri "$aliansGraphEndpoint/v1.0/users/$userId/contacts" -Body (ConvertTo-Json $body) -
                Headers $headers

    return $response.id
}

# Function to create a new mailbox in Alians Graph
function New-AliansGraphMailbox {
    
    $body = @{
        displayName = $displayName
        mailEnabled = $true
        mailNickname = $displayName
        userPrincipalName = $emailAddress
    }
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
        Content = -Type = "application/json"
    }
    $response = Invoke-RestMethod -Method Post -Uri "$aliansGraphEndpoint/v1.0/users/$userId/mailboxes" -Body (ConvertTo-Json $body)
    -Headers $headers

    return $response.id
}

# Function to add a contact to a mailbox in Alians Graph
function Add-AliansGraphContactToMailbox {
    
    $body = @{
        contacts = @(
            @{
                '@odata.id' = "/v1.0/contacts/$contactId"
            }
        )
    }
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
        Content = -Type = "application/json"
    }
    Write-Host ./Get-Help.ps1 $headers
    $response = Invoke-RestMethod -Method POST -Uri "$aliansGraphEndpoint/v1.0/users/$userId/mailboxes/$mailboxId/members" -Body (ConvertTo)-Json $body -Headers $headers
    -Json $body -Headers $headers

    return $response.id
}

# Function to retrieve the list of all users in the organization
function Get-OrganizationUsers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$accessToken
    )
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
    }
    $response = Invoke-RestMethod -Method Get -Uri "$aliansGraphEndpoint/v1.0/users" -Headers $headers
    return $response.value
}

# Function to retrieve the list of all groups in the organization
function Get-OrganizationGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string]$accessToken
    )
    $headers = @{
        Authorization = "Bearer $accessToken"
        Accept = "application/json"
    }
    $response = Invoke-RestMethod -Method Get -Uri "$aliansGraphEndpoint/v1.0/groups" -Headers $headers
    return $response.value
}

# Retrieve all contacts from Alians Graph
$contacts = Get-AliansGraphContacts -AccessToken $aliansGraphToken

# Retrieve all mailboxes from Alians Graph
$mailboxes = Get-AliansGraphMailboxes -AccessToken $aliansGraphToken -userId "your_user_id"

# Create a new contact in Alians Graph
$newContactId = New-AliansGraphContact -AccessToken $aliansGraphToken -userId "your_user_id" -givenName "John" -familyName "Doe" -emailAddress "johndoe@example.com"

# Create a new mailbox in Alians Graph
$newMailboxId = New-AliansGraphMailbox -AccessToken $aliansGraphToken -userId "your_user_id" -displayName "John Doe's mailbox" -EmailAddress "johndoe@example.com"

# Add the newly created contact to the newly created mailbox
Add-AliansGraphContactToMailbox -AccessToken $aliansGraphToken -userId "your_user_id" -contactId $newContactId -mailboxId $newMailboxId

# Retrieve the list of all users in the organization
$organizationUsers = Get-OrganizationUsers -accessToken $aliansGraphToken

# Retrieve the list of all groups in the organization
$organizationGroups = Get-OrganizationGroups -accessToken $aliansGraphToken


# Print the retrieved data
Write-Host "Contacts:"
foreach ($contact in $contacts) {
    Write-Host "Given Name: $($contact.givenName)"
    Write-Host "Family Name: $($contact.familyName)"
    Write-Host "Email Address: $($contact.emailAddresses[0].value)"
    Write-Host ""
}

Write-Host "Mailboxes:"
foreach ($mailbox in $mailboxes) {
    Write-Host "Display Name: $($mailbox.displayName)"
    Write-Host "Email Address: $($mailbox.mailNickname)@$($mailbox.mailEnabled)"
    Write-Host ""
}

Write-Host "Newly Created Contact ID: $newContactId"
Write-Host "Newly Created Mailbox ID: $newMailboxId"

Write-Host "Organization Users:"
foreach ($user in $organizationUsers) {
    Write-Host "User Principal Name: $($user.userPrincipalName)"
    Write-Host "DisplayName: $($user.displayName)"
    Write-Host ""
}

Write-Host "Organization Groups:"
foreach ($group in $organizationGroups) {
    Write-Host "Group Name: $($group.displayName)"
    Write-Host "Description: $($group.description)"
    Write-Host ""
}

Write-Host ./Get-Help.ps1 $aliansGraphAPIVersion
Write-Host ./Get-News.ps1 $aliansGraphAPIVersion

