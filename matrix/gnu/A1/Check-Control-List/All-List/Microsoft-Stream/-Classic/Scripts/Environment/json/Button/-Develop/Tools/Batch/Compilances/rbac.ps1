#!/home/admin/app/PowerShell/Members

# Compilances 
$compliances = Get-Content -Path "./compliances.txt"

# Get the current date and time
$dateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Get the current user
$currentUser = Get-ADUser -Identity $env:USERNAME -Properties displayName, samAccountName, lastLogonDate

# Check if the user has logged in before
if ($currentUser.LastLogonDate -lt (Get-Date).AddDays(-1)) {
    # Send email notification
    $subject = "User Login Alert"
    $body = "User $($currentUser.DisplayName) has not logged in for more than 24 hours."
    $body += "Username: $($currentUser.SamAccountName)"
    $body += "Last Logon Date: $($currentUser.LastLogonDate.ToString('yyyy-MM-dd HH:mm:ss'))"
    $body += "Current Date and Time: $dateTime"
    $to = "admin@example.com"
    $from = "alert@example.com"
    Send-MailMessage -To $to -From $from -Subject $subject -Body $body
}

# Check if the user has not logged in for more than 24 hours
if ($currentUser.LastLogonDate -lt (Get-Date).AddDays(-1)) {
    # Check if the user has failed more than 5 login attempts
    if ($currentUser.FailedLogonCount -gt 5) {
        # Send email notification
        $subject = "User Login Failure Alert"
        $body = "User $($currentUser.DisplayName) has failed more than 5 login attempts."
        $body += "Username: $($currentUser.SamAccountName)"
        $body += "Failed Login Count: $($currentUser.FailedLogonCount)"
        $body += "Current Date and Time: $dateTime"
        $to = "admin@example.com"
        $from = "alert@example.com"
        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
    }

    # Check if the user's account is disabled
    if ($currentUser.AccountEnabled -eq $false) {
        # Send email notification
        $subject = "User Account Disabled Alert"
        $body = "User $($currentUser.DisplayName) has disabled their account."
        $body += "Username: $($currentUser.SamAccountName)"
        $body += "Current Date and Time: $dateTime"
        $to = "admin@example.com"
        $from = "alert@example.com"
        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
    }

    # Check if the user's account is locked out
    if ($null -ne $currentUser.LockoutTime) {
        # Send email notification
        $subject = "User Account Locked Out Alert"
        $body = "User $($currentUser.DisplayName) has locked their account out."
        $body += "Username: $($currentUser.SamAccountName)"
        $body += "Lockout Time: $($currentUser.LockoutTime.ToString('yyyy-MM-dd HH:mm:ss'))"
        $body += "Current Date and Time: $dateTime"
        $to = "admin@example.com"
        $from = "alert@example.com"
        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
    }

    # Check if the user's password has expired
    if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
        # Send email notification
        $subject = "User Password Expired Alert"
        $body = "User $($currentUser.DisplayName) has expired their password."
        $body += "Username: $($currentUser.SamAccountName)"
        $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
        $body += "Current Date and Time: $dateTime"
        $to = "admin@example.com"
        $from = "alert@example.com"
        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
    }
    # Check if the user's password is in a compliance list
    foreach ($compliance in $compliances) {
        if ($currentUser.Password -match $compliance) {
            # Send email notification
            $subject = "User Password Compliance Alert"
            $body = "User $($currentUser.DisplayName) has a password that matches the compliance list."
            $body += "Username: $($currentUser.SamAccountName)"
            $body += "Password: $($currentUser.Password)"
            $body += "Compliance: $compliance"
            $body += "Current Date and Time: $dateTime"
            $to = "admin@example.com"
            $from = "alert@example.com"
            Send-MailMessage -To $to -From $from -Subject $subject -Body $body
        }
        # Check if the user's password has expired
        if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
            # Send email notification
            $subject = "User Password Expired Alert"
            $body = "User $($currentUser.DisplayName) has expired their password."
            $body += "Username: $($currentUser.SamAccountName)"
            $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
            $body += "Current Date and Time: $dateTime"
            $to = "admin@example.com"
            $from = "alert@example.com"
            Send-MailMessage -To $to -From $from -Subject $subject -Body $body
        }
        # Check if the user's password is in a compliance list
        foreach ($compliance in $compliances) {
            if ($currentUser.Password -match $compliance) {
                # Send email notification
                $subject = "User Password Compliance Alert"
                $body = "User $($currentUser.DisplayName) has a password that matches the compliance list."
                $body += "Username: $($currentUser.SamAccountName)"
                $body += "Password: $($currentUser.Password)"
                $body += "Compliance: $compliance"
                $body += "Current Date and Time: $dateTime"
                $to = "admin@example.com"
                $from = "alert@example.com"
                Send-MailMessage -To $to -From $from -Subject $subject -Body $body
            }
            # Check if the user's password has expired
            if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
                # Send email notification
                $subject = "User Password Expired Alert"
                $body = "User $($currentUser.DisplayName) has expired their password."
                $body += "Username: $($currentUser.SamAccountName)"
                $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
                $body += "Current Date and Time: $dateTime"
                $to = "admin@example.com"
                $from = "alert@example.com"
                Send-MailMessage -To $to -From $from -Subject $subject -Body $body
            }
            # Check if the user's password is in a compliance list
            foreach ($compliance in $compliances) {
                if ($currentUser.Password -match $compliance) {
                    # Send email notification
                    $subject = "User Password Compliance Alert"
                    $body = "User $($currentUser.DisplayName) has a password that matches the compliance list."
                    $body += "Username: $($currentUser.SamAccountName)"
                    $body += "Password: $($currentUser.Password)"
                    $body += "Compliance: $compliance"
                    $body += "Current Date and Time: $dateTime"
                    $to = "admin@example.com"
                    $from = "alert@example.com"
                    Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                }
                # Check if the user's password has expired
                if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
                    # Send email notification
                    $subject = "User Password Expired Alert"
                    $body = "User $($currentUser.DisplayName) has expired their password."
                    $body += "Username: $($currentUser.SamAccountName)"
                    $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
                    $body += "Current Date and Time: $dateTime"
                    $to = "admin@example.com"
                    $from = "alert@example.com"
                    Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                }
                # Check if the user's password is in a compliance list
                foreach ($compliance in $compliances) {
                    if ($currentUser.Password -match $compliance) {
                        # Send email notification
                        $subject = "User Password Compliance Alert"
                        $body = "User $($currentUser.DisplayName) has a password that matches the compliance list."
                        $body += "Username: $($currentUser.SamAccountName)"
                        $body += "Password: $($currentUser.Password)"
                        $body += "Compliance: $compliance"
                        $body += "Current Date and Time: $dateTime"
                        $to = "admin@example.com"
                        $from = "alert@example.com"
                        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                    }
                    # Check if the user's password has expired
                    if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
                        # Send email notification
                        $subject = "User Password Expired Alert"
                        $body = "User $($currentUser.DisplayName) has expired their password."
                        $body += "Username: $($currentUser.SamAccountName)"
                        $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
                        $body += "Current Date and Time: $dateTime"
                        $to = "admin@example.com"
                        $from = "alert@example.com"
                        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                    }
                    # Check if the user's password is in a compliance list
                    foreach ($compliance in $compliances) {
                        if ($currentUser.Password -match $compliance) {
                            # Send email notification
                            $subject = "User Password Compliance Alert"
                            $body = "User $($currentUser.DisplayName) has a password that matches the compliance list."
                            $body += "Username: $($currentUser.SamAccountName)"
                            $body += "Password: $($currentUser.Password)"
                            $body += "Compliance: $compliance"
                            $body += "Current Date and Time: $dateTime"
                            $to = "admin@example.com"
                            $from = "alert@example.com"
                            Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                        }
                        # Check if the user's password has expired
                        if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
                            # Send email notification
                            $subject = "User Password Expired Alert"
                            $body = "User $($currentUser.DisplayName) has expired their password."
                            $body += "Username: $($currentUser.SamAccountName)"
                            $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
                            $body += "Current Date and Time: $dateTime"
                            $to = "admin@example.com"
                            $from = "alert@example.com"
                            Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                        }
                        # Check if the user's password is in a compliance list
                        foreach ($compliance in $compliances) {
                            if ($currentUser.Password -match $compliance) {
                                # Send email notification
                                $subject = "User Password Compliance Alert"
                                $body = "User $($currentUser.DisplayName) has a password that matches the compliance list."
                                $body += "Username: $($currentUser.SamAccountName)"
                                $body += "Password: $($currentUser.Password)"
                                $body += "Compliance: $compliance"
                                $body += "Current Date and Time: $dateTime"
                                $to = "admin@example.com"
                                $from = "alert@example.com"
                                Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                            }
                        }
                    }
                    # Check if the user's password has expired
                    if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
                        # Send email notification
                        $subject = "User Password Expired Alert"
                        $body = "User $($currentUser.DisplayName) has expired their password."
                        $body += "Username: $($currentUser.SamAccountName)"
                        $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
                        $body += "Current Date and Time: $dateTime"
                        $to = "admin@example.com"
                        $from = "alert@example.com"
                        Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                    }
                }
                # Check if the user's password has expired
                if ($currentUser.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
                    # Send email notification
                    $subject = "User Password Expired Alert"
                    $body = "User $($currentUser.DisplayName) has expired their password."
                    $body += "Username: $($currentUser.SamAccountName)"
                    $body += "Password Last Set: $($currentUser.PasswordLastSet.ToString('yyyy-MM-dd HH:mm:ss'))"
                    $body += "Current Date and Time: $dateTime"
                    $to = "admin@example.com"
                    $from = "alert@example.com"
                    Send-MailMessage -To $to -From $from -Subject $subject -Body $body
                }
            }
            Write-Host "Compliance checks completed."
        }
        catch {
            Write-Error "An error occurred while checking compliance for users: $_"
        }
    }
    Write-Host "Script execution completed."
}


# Example usage:
# Check compliance for users in the "Users" OU and send email notifications
Check-UserCompliance -OUPath "OU=Users,DC=example,DC=com" -Compliances @("password123", "P@ssw0rd")


# Example usage:
# Check compliance for users in the "Users" OU and send email notifications using a different SMTP server
Check-UserCompliance -OUPath "OU=Users,DC=example,DC=com" -Compliances @("password123", "P@ssw0rd") -SMTPServer "smtp.example.com" -SMTPPort 587 -SMTPUsername
"example@example.com" 
-SMTPPassword "examplePassword"


# Example usage:
# Check compliance for users in the "Users" OU and send email notifications using a custom email template
Check-UserCompliance -OUPath "OU=Users,DC=example,DC=com" -Compliances @("password123", "P@ssw0rd") -EmailTemplatePath "C:\path\to\email_template.txt"


# Example usage:
# Check compliance for users in the "Users" OU and send email notifications using a custom email template and custom SMTP server
Check-UserCompliance -OUPath "OU=Users,DC=example,DC=com" -Compliances @("password123", "P@ssw0rd") -EmailTemplatePath "C:\path\to\email_template.txt" -SMTPServer
"smtp.example.com" 
"example@example.com" 
-SMTPPassword "examplePassword"



# Example usage:
# Check compliance for users in the "Users" OU and send email notifications using a custom email template, custom SMTP server, and custom SMTP port
Check-UserCompliance -OUPath "OU=Users,DC=example,DC=com" -Compliances @("password123", "P@ssw0rd") -EmailTemplatePath "C:\path\to\email_template.txt" -SMTPServer
"smtp.example.com" 
-SMTPPort 587 
"example@example.com" 
-SMTPUsername "example@example.com"
-SMTPPassword "examplePassword"


# Example usage:
# Check compliance for users in the "Users" OU and send email notifications using a custom email template, custom SMTP server, custom SMTP port, and custom sender email address
Check-UserCompliance -OUPath "OU=Users,DC=example,DC=com" -Compliances @("password123", "P@ssw0rd") -EmailTemplatePath "C:\path\to\email_template.txt" -SMTPServer
"smtp.example.com" 
-SMTPPort 587 
"example@example.com" 
-SMTPUsername "example@example.com"
-SMTPPassword "examplePassword" 
-FromEmailAddress "admin@example.com"


