#!/home/admin/app/PowerShell/Members

# FQDNS Allowlist for Active Directory Domain Controllers
function AD_DC_FQDNS_ALLOWLIST {
    "dc1.example.com"
    "dc2.example.com"
}


# Function to check if a given FQDN is in the allowlist
function Is_FQDN_In_Allowlist {
    param (
        [Parameter(Mandatory=$true)]
        [string]$fqdn
    )

    $allowlist = AD_DC_FQDNS_ALLOWLIST
    return ($allowlist -contains $fqdn)
}

