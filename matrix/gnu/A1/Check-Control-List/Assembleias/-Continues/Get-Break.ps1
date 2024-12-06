#!/home/admin/app/PowerShell/Members

# Get Break and Reward Information
$breakAndRewardInfo = (Get-Content -Path "break_and_reward.txt" | Select-Object -First 1) -split '\t'
$break = $breakAndRewardInfo[0]
$reward = $breakAndRewardInfo[1]

# Get Current Date and Time
$currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Check if the current time is within the break window
if ($currentTime -ge $break -and $currentTime -lt $reward) {
    # Generate a random number between 1 and 100
    $randomNumber = Get-Random -Minimum 1 -Maximum 100

    # Check if the random number is less than or equal to 50
    if ($randomNumber -le 50) {
        # Send an email notification with the break and reward information
        $emailParams = @{
            From = "break@example.com"
            To = "reward@example.com"
            Subject = "Break Notification"
            Body = "Current Time: $currentTime
            Break: $break
            Reward: $reward"
        }
        Send-MailMessage @emailParams
    }
    else {
        # Send an email notification with the break and reward information
        $emailParams = @{
            From = "reward@example.com"
            To = "break@example.com"
            Subject = "Reward Notification"
            Body = "Current Time: $currentTime
            Break: $break
            Reward: $reward"
            Attachments = @("break_and_reward.txt")
        }
        Send-MailMessage @emailParams
    }
    Write-Host "Break and Reward Notification sent successfully."
}
else {
    Write-Host "Current time is outside the break window."
}

$i = 0
while ($i -lt 15) {
    $i++
if ($i -eq 7) {break}
    Write-Host $i
}
