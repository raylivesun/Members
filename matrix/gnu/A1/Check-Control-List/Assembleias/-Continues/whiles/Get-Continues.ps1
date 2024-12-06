#!/home/admin/app/PowerShell/Members

# Get Continues Integration (CI) build status
$buildStatus = (Invoke-RestMethod -Method Get -Uri "https://api.travis-ci.com/repos/example/repo-name/builds?limit=1" -Headers @{Authorization=("token $env:TRAVIS_API_TOKEN")}) |
    Select-Object -ExpandProperty build |
    Select-Object -ExpandProperty status

# Get Slack webhook URL
$slackWebhookUrl = $env:SLACK_WEBHOOK_URL

# Format status message
$statusMessage = "Build Status: $buildStatus"

# Send status message to Slack
Invoke-RestMethod -Method POST -Uri $slackWebhookUrl -Body @{
    text="$statusMessage"
}

$i = 10
while($i -ge 0){
      $i
      $i--
}