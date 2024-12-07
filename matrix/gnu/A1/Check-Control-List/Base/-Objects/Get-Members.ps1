#!/home/admin/app/PowerShell/Members

# Get Members from Active Directory (AD)
$domain = 'domain.com'
$userName = 'username'
$password = ConvertTo-SecureString 'password' -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($userName, $password)
$adGroup = 'Domain Admins'
$members = Get-ADGroupMember -Identity $adGroup -Credential $cred -SearchBase 'DC=domain,DC=com' -Filter 'Enabled -eq $true' -
                 Properties MemberSamAccountName, MemberDisplayName, MemberDescription, MemberUserPrincipalName
                 | Where-Object { $_.MemberUserPrincipalName -notlike '*@domain.com' }
                 | Sort-Object MemberSamAccountName
                 | Select-Object MemberSamAccountName, MemberDisplayName, MemberDescription, @{Name='Email';Expression={$_.MemberUserPrincipalName.Split('@')[1]}}
                 | Format-Table -AutoSize
                 | Out-String
                 | Out-File -FilePath 'domain_admins.txt'
                 | Out-Null

# Get Members from Azure AD
$azureAdUrl = 'https://login.microsoftonline.com/your_tenant_id/oauth2/token'
$clientId = 'your_client_id'
$clientSecret = ConvertTo-SecureString 'your_client_secret' -AsPlainText -Force
$grantType = 'client_credentials'
$scope = 'https://graph.microsoft.com/.default'


$tokenResponse = Invoke-RestMethod -Method Post -Uri $azureAdUrl -ContentType 'application/x-www-form-urlencoded' -Body @"
grant_type=$grantType
client_id=$clientId
client_secret=$clientSecret
scope=$scope
"@ | ConvertFrom-Json

$accessToken = $tokenResponse.access_token
$azureAdGraphUrl = 'https://graph.microsoft.com/v1.0/users'
$membersAzureAd = Invoke-RestMethod -Method Get -Uri $azureAdGraphUrl -Headers @{Authorization="Bearer $accessToken"} -Filter "roleMemberof/id eq 'your'"


# Combine both lists and export to CSV
$combinedMembers = $members.Split('`n') + $membersAzureAd.value | ConvertFrom-Json
$combinedMembers | Select-Object MemberSamAccountName, MemberDisplayName, MemberDescription, Email, @{Name='Azure AD Role';Expression={$_.roleMemberof.id}} | Format-Table -AutoSize | Out-String | Out-File -FilePath 'domain_admins_combined.txt' | Out-Null
$combinedMembers | Export-Csv -Path 'domain_admins_combined.csv' -NoTypeInformation


# Send email notification with attachment
$smtpServer = 'your_smtp_server'
$fromEmail = 'your_email_address'
$toEmail = 'recipient_email_address'
$subject = 'Domain Admins Report'
$body = 'Please find attached the domain admins report.'

$attachmentPath = 'domain_admins_combined.csv'

$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer)
$mailMessage = New-Object System.Net.Mail.MailMessage($fromEmail, $toEmail, $subject, $body)
$attachment = New-Object System.Net.Mail.Attachment($attachmentPath)
$mailMessage.Attachments.Add($attachment)
$smtpClient.Send($mailMessage)


# Clean up temporary files
Remove-Item -Path 'domain_admins.txt' -Force
Remove-Item -Path 'domain_admins_combined.csv' -Force


Write-Host "Domain admins report has been generated and sent to $toEmail."
Write-Host "Temporary files have been cleaned up."
Write-Output $domain
