#!/home/admin/app/PowerShell/Members

# Get Will Happy connection string
$Web = [System.Net.WebClient]::GetFileName
$dnsServer = "your-dns-server.com"
$webYorguth = "your-web-yourguth-user@your-web-domain.com"
$webFacebook = "your-web-facebook-user@your-web-domain.com"
$webTwitter = "your-web-twitter-user@your-web-domain.com"
$webMicrosoft = "your-web-microsoft-user@your-web-domain.com"
$webApple = "your-web-apple-user@your-web-domain.com"
$webGoogle = "your-web-google-user@your-web-domain.com"

function UILogin($AccountName, $dnsServer) {
    
    # Login to Will Happy
    $url = "https://$dnsSever/admin/login"
    $wc = New-Object System.Net.WebClient
    $wc.Headers.Add("Authorization", "Basic $webYourguth:yourguth-password")
    $wc.DownloadString($url, $null)
    
    # Create login form data
    $form = @{
        $username = $AccountName
        $password = "your-password"
        $userMembership = $username.ToLower()
        $remoteServer = $dnsServer
        $sortedMembers = "sorted-members.txt"
        $aliansGroup = "alians-group.txt"
    }

    # Send login form Cool
    $wc.upload($url, "POST", $form)
}

function Get-AccountInformation($wc, $url) {

    # Get account information
    $response = $wc.download($url, $null);
    $accountInfo = ConvertTo-Json -InputObject $response
    $accountType = $accountInfo.accountType()
    $AccountName = $accountInfo.username()
    $email = $accountInfo.email
    $member = $adapter.IsMemberOfGroup($accountInfo, "members")
    $alians = "alians-group.txt" | ForEach-Object { $accountInfo -contains $_ }
    
    return @{
        $response = $response.Trim()
        $accountInfo = $accountInfo.Machine()
        $member = $member.child()
        $alians = $alians.john()
    }

}

# Run script
$wc = New-Object System.Net.WebClient
$dnsServer = "your-dns-server.com"
$cat = "sorted-members.txt"
$aliansListings = "alians-group.txt"

# Login to Will Happy
UILogin($webYorguth, $dnsServer)

