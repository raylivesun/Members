#!/home/admin/app/PowerShell/Members

# Global Bullet Variables (adjust as needed) 
$domain = "example.com"
$users = "user1, user2, user3"
$password = ConvertTo-SecureString "password" -AsPlainText -Force
$mailFrom = "noreply@example.com"
$mailTo = "admin@example.com"
$smtpServer = "smtp.example.com"
$smtpPort = 587
$smtpCredential = New-Object System.Net.NetworkCredential("noreply@example.com", "password")

# Function to send email
function Send-Email {
    param (
        [Parameter(Mandatory=$true)]
        [string]$To,
        [Parameter(Mandatory=$true)]
        [string]$From,
        [Parameter(Mandatory=$true)]
        [string]$Subject,
        [Parameter(Mandatory=$true)]
        [string]$Body
    )

    $smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtpClient.EnableSsl = $true
    $smtpClient.Credentials = $smtpCredential

    $mailMessage = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)
    $mailMessage.IsBodyHtml = $true
    $smtpClient.Send($mailMessage)
}

# Function to create user
function New-ADUser {

    # Create the AD user
    $adUser = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($ctx, $username, $null, "User", $domain)
    $adUser.SetPassword($password)
    $adUser.Enabled = $true
    $adUser.DisplayName = "$FirstName $LastName"
    $adUser.EmailAddresses.Add($email)
    $adUser.Save()

}


# Main script
$ctx = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Domain, $domain)

# Split user list into an array
$userList = $users.Split(',')

foreach ($user in $userList) {
    # Split user info into individual properties
    $userInfo = $user.Split(';')
    $username = $userInfo[0]
    $firstName = $userInfo[1]
    $lastName = $userInfo[2]
    $email = $userInfo[3]

    # Create AD user
    New-ADUser -Username $username -FirstName $firstName -LastName $lastName -Email $email

}

# Send email notification
Send-Email -To $mailTo -From $mailFrom -Subject "AD User Creation Report" -Body "AD user creation completed successfully."
