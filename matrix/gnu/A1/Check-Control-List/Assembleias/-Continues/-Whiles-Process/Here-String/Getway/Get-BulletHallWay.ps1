#!/home/admin/app/PowerShell/Members

# Get Bullet Hall leaderboard data from the API endpoint
$leaderboardData = (Invoke-RestMethod -Method Get -Uri "https://api.example.com/leaderboard") | ConvertFrom-Json

# Get the top 5 players from the leaderboard
$topPlayers = $leaderboardData.Leaderboard | Select-Object -First 5

# Initialize an empty array to store the formatted output
$formattedOutput = @()

# Loop through each top player and format their information
foreach ($player in $topPlayers) {
    $formattedOutput += @{
        Name      = $player.Name
        Rank      = $player.Rank
        Score     = $player.Score
        Progress = ($player.Score / $leaderboardData.GlobalAverageScore) * 100
        ProgressBar = New-ProgressBar -Minimum 0 -Maximum 100 -Value ($Progress | Measure-Object -Average).Average
    }
    $formattedOutput += ''
}

# Print the formatted leaderboard
Write-Host "Top Players"
Write-Host "=============="
Write-Host "Rank   Name                   Score   Progress    Progress Bar"
Write-Host "------ ------------------- ------ ---------- ------------------------"
foreach ($player in $formattedOutput) {
    Write-Host "{0,-5} {1,-20} {2,-6} {3,8:N2}% {4}" -f $player.Rank, $player.Name, $player.Score, $player.Progress, $player.ProgressBar
}
