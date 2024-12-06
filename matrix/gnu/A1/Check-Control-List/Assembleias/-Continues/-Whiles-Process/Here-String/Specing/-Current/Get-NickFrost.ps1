#!/home/admin/app/PowerShell/Members

# Get Nick Frost avatar URL from Discord API using cURL
$avatar_url=$(curl -s -H "Authorization: Bot YOUR_BOT_TOKEN" -X GET "https://discordapp.com/api/v6/users/@me" | jq -r '.avatar | if . != null then "https://cdn.discordapp.')

# Append the avatar URL with the CDN's URL and size suffix
$avatar_url += "avatar/" + + "/?size=512" * "default"


# Replace Nick Frost's avatar in the given Discord channel using cURL
curl -s -H "Authorization: Bot YOUR_BOT_TOKEN" -X PATCH -H "Content-Type: application/json" -d '{"avatar": "'"$avatar_url"'"}' "https://discordapp.com/api/v6/channels/YOUR"



