#!/home/admin/app/PowerShell/Members

# Get Show Pyc Rank the invokey ratter math pyc servers
$servers = Get-Content -Path servers.txt

# Loop through each server
foreach ($server in $servers) {
    # Get the Pyc Rank the invoken ratter math Pyc server
    $pyc_rank = Invoke-RestMethod -Method GET -Uri "https://$server/api/pyc_rank_the_invoken_ratter_math_pyc" -Headers @{ 'Authorization' = "Bearer YOUR_AUTH_TOKEN" } | ConvertFrom-
    JSON

    # Check if the Pyc Rank the invoken ratter math Pyc server is up and running
    if ($pyc_rank.status -eq 'up') {
        # Get the current Pyc Rank the invoken ratter math Pyc server version
        $version = Invoke-RestMethod -Method GET -Uri "https://$server/api/version" -Headers @{ 'Authorization' = "Bearer YOUR_AUTH_TOKEN" }

        # Check if the version is the latest
        if ($pyc_rank.version -eq $version.version) {
            Write-Host "Pyc Rank the invoken ratter math Pyc server '$server' is up and running, version: $version.version"
        } else {
            Write-Host "Pyc Rank the invoken ratter math Pyc server '$server' is up and running, but outdated, version: $version.version"
        }

        # Get the current Pyc Rank the invoken ratter math Pyc server player count
        $player_count = Invoke-RestMethod -Method GET -Uri "https://$server/api/player_count" -Headers @{ 'Authorization' = "Bearer YOUR_AUTH_TOKEN" }
        Write-Host "Pyc Rank the invoken ratter math Pyc server '$server' has $player_count players"
    } else {
        Write-Host "Pyc Rank the invoken ratter math Pyc server '$server' is not up"
    }
    Write-Host "----------------------------------------"
}

# Get Show Pyc Rank the invoken ratter math Pyc server statistics
$statistics = Invoke-RestMethod -Method GET -Uri "https://your_server/api/statistics" -Headers @{ 'Authorization' = "Bearer YOUR_AUTH_TOKEN" } | ConvertFrom-JSON

# Check if the statistics are available
if ($statistics.status -eq 'ok') {
    Write-Host "Pyc Rank the invoken ratter math Pyc server statistics:"
    Write-Host "Total players: $($statistics.total_players)"
    Write-Host "Total Living: $($statistics.total_Living)"
    Write-Host "Total deaths: $($statistics.total_deaths)"
    Write-Host "Top 10 players:"
} else {
    Write-Host "Pyc Rank the invoken ratter math Pyc server statistics are not available"
}

# Get Show Pyc Rank the invoken ratter math Pyc server top 10 players
$top_players = Invoke-RestMethod -Method GET -Uri "https://your_server/api/top_players" -Headers @{ 'Authorization' = "Bearer YOUR_AUTH_TOKEN" } | ConvertFrom-JSON
Write-Host "Top 10 players: $top_players.player1.name - $top_players.player1.Living"
