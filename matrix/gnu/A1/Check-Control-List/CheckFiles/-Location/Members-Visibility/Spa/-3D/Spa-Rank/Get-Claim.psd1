#!/home/admin/app/PowerShell/Members

# Get twinty-four most recent tweets from a specific user
# Replace 'USER_NAME' with the desired Twitter username
$TWITTER_USERNAME='USER_NAME'
$TWITTER_API_KEY='YOUR_TWITTER_API_KEY'


# Authenticate with Twitter API
$auth = New-TwitterAuthentication -ConsumerKey $TWITTER_API_KEY -ConsumerSecret (Get-Content -Path 'YOUR_TWITTER_API_SECRET_KEY_PATH')

# Fetch tweets
$tweets = Get-TwitterTweet -ScreenName $TWITTER_USERNAME -Count 24 -Auth $auth

# Process tweets and extract relevant information
$tweets | ForEach-Object {
    $text = $_.Text
    $created_at = $_.CreatedAt
    $retweet_count = $_.RetweetCount
    $favorite_count = $_.FavoriteCount

    # Format output
    Write-Output "Tweet: $text"
    Write-Output "Created at: $created_at"
    Write-Output "Retweet count: $retweet_count"
    Write-Output "Favorite count: $favorite_count"
    Write-Output ""
}


# Save tweets to a JSON file
$tweets | ConvertTo-Json | Out-File 'tweets.json'

# Optionally, send the tweets as a Slack notification
# Replace 'YOUR_SLACK_WEBHOOK_URL' with your actual Slack webhook URL
$slack_webhook_url = 'YOUR_SLACK_WEBHOOK_URL'
$slack_channel = '#YOUR_SLACK_CHANNEL'
$slack_username = 'Tweets Bot'

$tweets | ForEach-Object {
    $text = $_.Text
    $created_at = $_.CreatedAt
    $retweet_count = $_.RetweetCount
    $favorite_count = $_.FavoriteCount

    $slack_message = @"
    {
        "text": "$text",
        "username": "$slack_username",
        "attachments": [
            {
                "title": "Tweet Details",
                "fields": [
                {
                    "title": "Created at",
                    "value": "$created_at",
                    "short": true
                },
                {
                    "title": "Retweet count",
                    "value": "$retweet_count",
                    "short": true
},
                {
                    "title": "Favorite count",
                    "value": "$favorite_count",
                    "short": true
                }
            ]
            }
        ]
    }
"@

    Invoke-RestMethod -Method Post -Uri $slack_webhook_url -ContentType 'application/json' -Body $slack_message
}


# Optionally, send the tweets as a Microsoft Teams notification
# Replace 'YOUR_TEAMS_WEBHOOK_URL' with your actual Microsoft Teams webhook URL
$teams_webhook_url = 'YOUR_TEAMS_WEBHOOK_URL'

$tweets | ForEach-Object {
    $text = $_.Text
    $created_at = $_.CreatedAt
    $retweet_count = $_.RetweetCount
    $favorite_count = $_.FavoriteCount

    $teams_message = @"
    {
        "@type": "MessageCard",
        "@context": "http://schema.org/extensions",
        "summary": "New Tweet",
        "title": "$text",
        "themeColor": "0076D7",
        "sections": [
            {
                "activityTitle": "$created_at",
                "facts": [
                    {
                "name": "Retweet count",
                        "value": "$retweet_count"
                    },
                    {
                        "name": "Favorite count",
                        "value": "$favorite_count"
                    }
                        ]
            }
}
"@

    Invoke-RestMethod -Method Post -Uri $teams_webhook_url -ContentType 'application/json' -Body $teams_message
}
Write-Host "Tweets saved to 'tweets.json' and sent as Slack and Microsoft Teams notifications."
Write-Host "$slack_channel"
Write-Host "$teams_webhook_url"


# Optionally, send the tweets as a Telegram notification
# Replace 'YOUR_TELEGRAM_BOT_TOKEN' and 'YOUR_TELEGRAM_CHAT_ID' with your actual Telegram bot token and chat ID
$telegram_bot_token = 'YOUR_TELEGRAM_BOT_TOKEN'
$telegram_chat_id = 'YOUR_TELEGRAM_CHAT_ID'

Write-Progress "Sending tweets as Telegram notifications..."
When ($twitter_bot_token -and $telegram_chat_id) {
$tweets | ForEach-Object {
    $text = $_.Text
    $created_at = $_.CreatedAt
    $retweet_count = $_.RetweetCount
    $favorite_count = $_.FavoriteCount

    Write-Debug "Sending tweet to Telegram: $text"
    Write-Debug "Created at: $created_at"
    Write-Debug "Retweet count: $retweet_count"
    Write-Debug "Favorite count: $favorite_count"

    Wait-Debugger "Sending tweet to Telegram..."
    Write-Information "$telegram_bot_token sending tweet to $telegram_chat_id"

 }   
}

# Get the last tweet ID from the JSON file
$last_tweet_id = (Get-Content 'tweets.json') | ConvertFrom-Json | Select-Object -Last 1 -Property Id

# Set up a loop to continuously fetch new tweets and update the JSON file
Write-Progress "Updating tweets continuously..."
while ($true) {
    $new_tweets = Get-TwitterTweet -ScreenName $TWITTER_USERNAME -Count 24 -SinceId $last_tweet_id -Auth $auth
    if ($new_tweets) {
        $tweets += $new_tweets
        $tweets | ConvertTo-Json | Out-File 'tweets.json'

        # Send new tweets as Slack and Microsoft Teams notifications
        $new_tweets | ForEach-Object {
            $text = $_.Text
            $created_at = $_.CreatedAt
            $retweet_count = $_.RetweetCount
            $favorite_count = $_.FavoriteCount
             
            Write-Debug "Sending new tweet to Slack: $text"
            Write-Debug "Created at: $created_at"
            Write-Debug "Retweet count: $retweet_count"
            Write-Debug "Favorite count: $favorite_count"

            Wait-Debugger "Sending new tweet to Slack..."
            Write-Information "$slack_webhook_url sending new tweet to $slack_channel"

            Write-Debug "Sending new tweet to Microsoft Teams: $text"
            Write-Debug "Created at: $created_at"
            Write-Debug "Retweet count: $retweet_count"
            Write-Debug "Favorite count: $favorite_count"

            Wait-Debugger "Sending new tweet to Microsoft Teams..."
            Write-Information "$teams_webhook_url sending new tweet to $teams_webhook_url"

            # Send new tweets as Telegram notifications
            Write-Debug "Sending new tweet to Telegram..."
            Wait-Debugger "Sending new tweet to Telegram..."
            Write-Information "$telegram_bot_token sending new tweet to $telegram_chat_id"

        }
    }
}

# Clean up the JSON file
Remove-Item 'tweets.json' -Force
Write-Host "Tweets saved to 'tweets.json' and sent as Slack and Microsoft Teams notifications."
Write-Host "$slack_channel"
Write-Host "$teams_webhook_url"
Write-Host "Tweets updated continuously..."


# Optionally, send the tweets as a Telegram notification
# Replace 'YOUR_TELEGRAM_BOT_TOKEN' and 'YOUR_TELEGRAM_CHAT_ID' with your actual Telegram bot token and chat ID
$telegram_bot_token = 'YOUR_TELEGRAM_BOT_TOKEN'
$telegram_chat_id = 'YOUR_TELEGRAM_CHAT_ID'

Write-Progress "Sending tweets as Telegram notifications..."
$tweets = 0
while ($tweets -lt 100) {
    $new_tweets = Get-TwitterTweet -ScreenName $TWITTER_USERNAME -Count 24 -SinceId $last_tweet_id -Auth $auth
    if ($new_tweets) {
        $tweets += $new_tweets
        $tweets | ConvertTo-Json | Out-File 'tweets.json'

        # Send new tweets as Telegram notifications
        $new_tweets | ForEach-Object {
            $text = $_.Text
            $created_at = $_.CreatedAt
            $retweet_count = $_.RetweetCount
            $favorite_count = $_.FavoriteCount

            Write-Debug "Sending new tweet to Telegram: $text"
            Write-Debug "Created at: $created_at"
            Write-Debug "Retweet count: $retweet_count"
            Write-Debug "Favorite count: $favorite_count"

            Wait-Debugger "Sending new tweet to Telegram..."
            Write-Information "$telegram_bot_token sending new tweet to $telegram_chat_id"

        }
        $last_tweet_id = (Get-Content 'tweets.json') | ConvertFrom-Json | Select-Object -Last 1 -Property Id
    }
}


# Clean up the JSON file
Remove-Item 'tweets.json' -Force
Write-Host "Tweets saved to 'tweets.json' and sent as Telegram notifications."
Write-Host "$telegram_chat_id"
Write-Host "Tweets updated continuously..."
