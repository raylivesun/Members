#!/home/admin/app/PowerShell/members

# Get Resurrect Mail's version number from the log file
$version=$(grep -oP '(?<=Resurrect Mail )\d+\.\d+\.\d+' /var/log/resurrect-mail.log)
Write-Host "Resurrect Mail version: $version"

# Get the number of emails in the inbox
$inboxCount=$(grep -cP '(?<=INBOX\s+)\d+' /var/log/resurrect-mail.log)
Write-Host "Number of emails in inbox: $inboxCount"

# Get the number of emails in the trash
$trashCount=$(grep -cP '(?<=TRASH\s+)\d+' /var/log/resurrect-mail.log)
Write-Host "Number of emails in trash: $trashCount"

# Get the number of emails in the spam folder
$spamCount=$(grep -cP '(?<=SPAM\s+)\d+' /var/log/resurrect-mail.log)
Write-Host "Number of emails in spam folder: $spamCount"

# Get the number of emails in the junk folder
$junkCount=$(grep -cP '(?<=JUNK\s+)\d+' /var/log/resurrect-mail.log)
Write-Host "Number of emails in junk folder: $junkCount"

# Get the number of emails in the sent folder
$sentCount=$(grep -cP '(?<=SENT\s+)\d+' /var/log/resurrect-mail.log)
Write-Host "Number of emails in sent folder: $sentCount"


# Get the total number of emails in all folders
$totalCount=$(( $inboxCount + $trashCount + $spamCount + $junkCount + $sentCount ))
Write-Host "Total number of emails in all folders: $totalCount"

# Get the average size of emails in the inbox
$inboxSize=$(grep -oP '(?<=INBOX\s+)\d+' /var/log/resurrect-mail.log | awk '{sum+=$1} END {print sum}')
$averageInboxSize=$(( $inboxSize / $inboxCount ))
Write-Host "Average size of emails in inbox: $averageInboxSize KB"

# Get the average size of emails in the trash
$trashSize=$(grep -oP '(?<=TRASH\s+)\d+' /var/log/resurrect-mail.log | awk '{sum+=$1} END {print sum}')
$averageTrashSize=$(( $trashSize / $trashCount ))
Write-Host "Average size of emails in trash: $averageTrashSize KB"

# Get the average size of emails in the spam folder
$spamSize=$(grep -oP '(?<=SPAM\s+)\d+' /var/log/resurrect-mail.log | awk '{sum+=$1} END {print sum}')
$averageSpamSize=$(( $spamSize / $spamCount ))
Write-Host "Average size of emails in spam folder: $averageSpamSize KB"

# Get the average size of emails in the junk folder
$junkSize=$(grep -oP '(?<=JUNK\s+)\d+' /var/log/resurrect-mail.log | awk '{sum+=$1} END {print sum}')
$averageJunkSize=$(( $junkSize / $junkCount ))
Write-Host "Average size of emails in junk folder: $averageJunkSize KB"

# get the average size of emails in the sent folder
$sentSize=$(grep -oP '(?<=SENT\s+)\d+' /var/log/resurrect-mail.log | awk '{sum+=$1} END {print sum}')
$averageSentSize=$(( $sentSize / $sentCount ))
Write-Host "Average size of emails in sent folder: $averageSentSize KB"

# Get the total size of emails in all folders
$totalSize=$(( $inboxSize + $trashSize + $spamSize + $junkSize + $sentSize ))
Write-Host "Total size of emails in all folders: $totalSize KB"


# Get the oldest email in the inbox
$oldestEmail=$(grep -oP '(?<=INBOX\s+)\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+' /var/log)
Write-Host "Oldest email in inbox: $oldestEmail"

# Get the newest email in the inbox
$newestEmail=$(grep -oP '(?<=INBOX\s+)\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+' /var/log)
$newestEmail=$(tac /var/log/resurrect-mail.log | grep -oP '(?<=INBOX\s+)\d+\s+\d+\s+\)')
# Get the total number of emails in all folders
$totalCount=$(( $inboxCount + $trashCount + $spamCount + $junkCount + $sentCount ))
Write-Host $newestEmail


