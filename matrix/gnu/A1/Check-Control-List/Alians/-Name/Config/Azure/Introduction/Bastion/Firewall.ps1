#!/home/admin/app/PowerShell/Members

#  Alians Firewall Script for Alians members (PowerShell)
#  Version: 1.0.0
#  Author: Alians Firewall Team
#  Last updated: 2023-04-07

# Define variables
$firewallRulesFile = 'firewall_rules.txt'
$logFile = 'firewall_log.txt'
$blocklistFile = 'blocklist.txt'
$blocklistUrl = 'https://example.com/blocklist.txt'
$blocklistLastUpdated = (Get-Date).ToString('yyyy-MM-dd')

# Check if firewall rules file exists
if (!(Test-Path -Path $firewallRulesFile)) {
    Write-Error "Firewall rules file '$firewallRulesFile' not found."
    exit 1
}

# Check if blocklist file exists and update if necessary
if (!(Test-Path -Path $blocklistFile)) {
    Write-Host "Blocklist file '$blocklistFile' not found. Downloading..."
    (New-Object Net.WebClient).DownloadFile($blocklistUrl, $blocklistFile)
    Write-Host "Blocklist file updated to '$blocklistLastUpdated'."
    Write-Host "Firewall rules will be applied after blocklist update."
    exit 0
}

# Read firewall rules from file
$firewallRules = Get-Content -Path $firewallRulesFile

# Check if firewall rules are empty
if ($firewallRules.Count -eq 0) {
    Write-Error "Firewall rules file is empty."
    exit 1
}

# Read blocklist from file
$blocklist = Get-Content -Path $blocklistFile

# Check if blocklist is empty
if ($blocklist.Count -eq 0) {
    Write-Warning "Blocklist file is empty. Firewall rules will be applied without blocklist."
    $blocklist = $null
}

# Apply firewall rules
foreach ($rule in $firewallRules) {
    # Remove leading and trailing whitespace
    $rule = $rule.Trim()

    # Skip empty rules
    if ($rule -eq '') {
        continue
    }

    # Check if rule is a comment
    if ($rule.StartsWith('#')) {
        continue
    }

    # Split rule into action and IP address
    $parts = $rule.Split(' ')
    $action = $parts[0]
    $ipAddress = $parts[1]

    # Check if IP address is in blocklist
    if ($blocklist -contains $ipAddress) {
        # Log blocked IP address
        Write-Host "Blocked IP address: $ipAddress"
        Add-Content -Path $logFile -Value "$(Get-Date): $ipAddress blocked by blocklist"
        continue
    }

    # Apply firewall rule
    # Example: Add-Content -Path C:\Windows\System32\drivers\etc\hosts -Value "$ipAddress"
}

Write-Host "Firewall rules applied successfully."
Write-Host './-Authoring' ./Config $action ./packages.ps1

