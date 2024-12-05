#!/home/admin/app/PowerShell/Members

# Alians Identifiers (AI) and Name Servers (NS) for the domain
$aliases = @{
    'example.com' = @('ns1.example.com', 'ns2.example.com')
}

# Domain Name (DN) of the domain
$domain = 'example.com'

# Zone File Path
$zoneFilePath = "$env:SystemRoot\System32\drivers\etc\hosts"

# Function to add or update a DNS alias
function AddOrUpdateAlias {
    param (
        [Parameter(Mandatory=$true)]
        [string]$alias,
        [Parameter(Mandatory=$true)]
        [string[]]$ns
    )

    # Remove existing alias
    Remove-Content $zoneFilePath -Filter "$alias"
    
    # Add or update new alias
    foreach ($nsServer in $ns) {
        Add-Content $zoneFilePath -Value "$nsServer $alias"
    }
}

# Function to check if the domain is already registered
function IsDomainRegistered {
    param (
        [Parameter(Mandatory=$true)]
        [string]$domain
    )

    # Use nslookup to check if the domain is registered
    $nslookupOutput = nslookup $domain -type=ns
    $isRegistered = $nslookupOutput -notmatch "No answer"

    return $isRegistered
}

# Check if the domain is already registered
if (IsDomainRegistered -domain $domain) {
    Write-Host "Domain '$domain' is already registered."
    exit 0
}

# Check if the aliases and NS servers are provided
if ($aliases.ContainsKey($domain)) {
    $nsServers = $aliases[$domain]
} else {
    Write-Host "No aliases or NS servers provided for domain '$domain'."
    exit 1
}

# Add or update the DNS aliases
foreach ($alias in $aliases.Keys) {
    AddOrUpdateAlias -alias $alias -ns $nsServers
}

Write-Host "DNS aliases for domain '$domain' have been added or updated successfully."
