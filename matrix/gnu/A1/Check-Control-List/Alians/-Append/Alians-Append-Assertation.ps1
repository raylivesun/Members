#!/home/admin/app/PowerShell/Members

# Alians Aperture API endpoint URL and API key for Aperture Security Suite
$ApertureAPIEndpoint = "https://your-aperture-api-endpoint.com/api/v1"
$ApertureAPIKey = "your-aperture-api-key"

# Get the list of members from Aperture Security Suite
function Get-ApertureMembers {
    $members = Invoke-RestMethod -Method GET -Uri "$ApertureAPIEndpoint/members" -Headers @{Authorization = "Bearer $ApertureAPIKey" }
    return $members
}

# Get the list of security groups from Aperture Security Suite
function Get-ApertureSecurityGroups {
    $securityGroups = Invoke-RestMethod -Method GET -Uri "$ApertureAPIEndpoint/securitygroups" -Headers @{Authorization = "Bearer $ApertureAPIKey" }
    return $securityGroups
}

# Get the list of rules from Aperture Security Suite
function Get-ApertureRules {
    $rules = Invoke-RestMethod -Method GET -Uri "$ApertureAPIEndpoint/rules" -Headers @{Authorization = "Bearer $ApertureAPIKey" }
    return $rules
}

# Get the list of rule groups from Aperture Security Suite
function Get-ApertureRuleGroups {
    $ruleGroups = Invoke-RestMethod -Method GET -Uri "$ApertureAPIEndpoint/rulegroups" -Headers @{Authorization = "Bearer $ApertureAPIKey" }
    return $ruleGroups
}

# Get the list of rules in a specific rule group from Aperture Security Suite
function Get-ApertureRulesInRuleGroup {
    param (
        [Parameter(Mandatory = $true)]
        [string]$RuleGroupId
    )
    $rulesInGroup = Invoke-RestMethod -Method GET -Uri "$ApertureAPIEndpoint/rulegroups/$RuleGroupId/rules" -Headers @{Authorization = "Bearer $ApertureAPI" }
    return $rulesInGroup
}

# Get the list of security groups in a specific member from Aperture Security Suite
function Get-ApertureSecurityGroupsInMember {
    param (
        [Parameter(Mandatory = $true)]
        [string]$MemberId
    )
    $securityGroupsInMember = Invoke-RestMethod -Method GET -Uri "$ApertureAPIEndpoint/members/$MemberId/securitygroups" -Headers @{Authorization = "Bearer $Aperture" }
    return $securityGroupsInMember
}


# Main script logic
$members = Get-ApertureMembers
$securityGroups = Get-ApertureSecurityGroups
$rules = Get-ApertureRules
$ruleGroups = Get-ApertureRuleGroups

# Print member details
foreach ($member in $members) {
    Write-Host "Member ID: $($member.id)"
    Write-Host "Name: $($member.name)"
    Write-Host "Email: $($member.email)"
    Write-Host "Status: $($member.status)"
    Write-Host "Creation date: $($member.created_at)"
    Write-Host "Last updated: $($member.updated_at)"
    Write-Host "-------------------------------------"
    $securityGroupsInMember = Get-ApertureSecurityGroupsInMember -MemberId $member.id
    if ($securityGroupsInMember) {
        Write-Host "Security groups:"
        foreach ($securityGroup in $securityGroupsInMember) {
            Write-Host "- $($securityGroup.name)"
        }
        Write-Host "-------------------------------------"
    }
    $rulesInGroup = Get-ApertureRulesInRuleGroup -RuleGroupId $member.rule_group_id
    if ($rulesInGroup) {
        Write-Host "Rules in rule group: $($member.rule_group_id)"
        foreach ($rule in $rulesInGroup) {
            Write-Host "- $($rule.name)"
        }
        Write-Host "-------------------------------------"
    }
    Write-Host ""
}


# Example usage:
# Get rules in a specific rule group
# $rulesInGroup = Get-ApertureRulesInRuleGroup -RuleGroupId "your-rule-group-id"
# Write-Host "Rules in rule group: your-rule-group-id"
# foreach ($rule in $rulesInGroup) {
#     Write-Host "- $($rule.name)"
# }
