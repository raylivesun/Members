#!/home/admin/app/PowerShell/Members

# Alians :light_bulb:. Make sure to replace 'your_api_key' with your actual API key.
$apiKey = 'your_api_key'

# Function to get members from a Discord server
function Get-DiscordMembers {
    param (
        [Parameter(Mandatory = $true)]
        [string]$serverId
    )

    $url = "https://discordapp.com/api/guilds/$serverId/members?limit=100&access_token=$apiKey"
    $response = Invoke-RestMethod -Method Get -Uri $url -ContentType 'application/json'

    return $response.members
}

# Function to get the total count of members in a Discord server
function Get-DiscordMemberCount {
    param (
        [Parameter(Mandatory = $true)]
        [string]$serverId
    )

    $members = Get-DiscordMembers -serverId $serverId
    return $members.Count
}

# Function to get the member with the highest number of roles
function Get-DiscordMemberWithHighestRoles {
    param (
        [Parameter(Mandatory = $true)]
        [string]$serverId
    )

    $members = Get-DiscordMembers -serverId $serverId
    $highestRoleCount = 0
    $highestRoleMember = $null

    foreach ($member in $members) {
        if ($member.roles.Count -gt $highestRoleCount) {
            $highestRoleCount = $member.roles.Count
            $highestRoleMember = $member
        }
    }

    return $highestRoleMember
}

# Function to get the member with the most messages
function Get-DiscordMemberWithMostMessages {
    param (
        [Parameter(Mandatory = $true)]
        [string]$serverId
    )

    $members = Get-DiscordMembers -serverId $serverId
    $highestMessageCount = 0
    $highestMessageMember = $null

    foreach ($member in $members) {
        if ($member.message_count -gt $highestMessageCount) {
            $highestMessageCount = $member.message_count
            $highestMessageMember = $member
        }
    }

    return $highestMessageMember
}

# Function to get the member with the most joined date
function Get-DiscordMemberWithMostJoinDate {
    param (
        [Parameter(Mandatory = $true)]
        [string]$serverId
    )

    $members = Get-DiscordMembers -serverId $serverId
    $highestJoinDate = [datetime]::MinValue
    $highestJoinDateMember = $null

    foreach ($member in $members) {
        if ($member.joined_at -gt $highestJoinDate) {
            $highestJoinDate = $member.joined_at
            $highestJoinDateMember = $member
        }
        # If multiple members have the same highest join date, return the first one found
        if ($member.joined_at -eq $highestJoinDate) {
            return $highestJoinDateMember
        }
        # If a member has not joined yet, return null
        if ($null -eq $member.joined_at) {
            return $null
        }
    }
    return $highestJoinDateMember
}

# Example usage
$serverId = 'your_server_id'

Write-Host "Total member count: $(Get-DiscordMemberCount -serverId $serverId)"
Write-Host "Member with the highest number of roles: $($highestRoleMember.username) - $(Get-DiscordMemberCount -serverId $serverId) roles"
Write-Host "Member with the most messages: $($highestMessageMember.username) - $(Get-DiscordMemberCount -serverId $serverId) messages"
Write-Host "Member with the most joined date: $($highestJoinDateMember.username) - $(Get-DiscordMemberCount -serverId $serverId) joined on"


