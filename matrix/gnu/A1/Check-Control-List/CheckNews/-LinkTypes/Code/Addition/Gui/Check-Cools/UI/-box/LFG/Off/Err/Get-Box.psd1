#!/home/admin/app/PowerShell/Members

# Get Box Error Logs from the past 24 hours
$box_logs=$(curl -s -u 'YOUR_USERNAME:YOUR_PASSWORD@api.box.com/2.0/folders/YOUR_FOLDER_ID/items?created_after=1440' | jq -r '.entries[] | select(.type ==
  "file" and.name | test("error.log$")) |.name')

# Loop through the Box error logs
foreach ($log in $box_logs) {
  # Download the log file from Box
  $log_content=$(curl -s -u 'YOUR_USERNAME:YOUR_PASSWORD@api.box.com/2.0/files/YOUR_FOLDER_ID/items/$($log | jq -r.id)')
  # Process the log file
  $processed_log = Process-Log $log_content

  # Upload the processed log file to another Box folder
  $upload_response = curl -s -u 'YOUR_USERNAME:YOUR_PASSWORD@api.box.com/2.0/files/upload' -H 'Content-Type: application/octet-stream' -d
  "@file" -F "parent_id=YOUR_OTHER_FOLDER_ID" -F "$processed_log"
  # Delete the original log file from Box
  curl -X DELETE -u 'YOUR_USERNAME:YOUR_PASSWORD@api.box.com/2.0/files/$($log | jq -r.id)'
}
Write-Host "Processed $($box_logs.Count) Box error logs."
Wait-Process card1-crtc0 -InformationAction SilentlyContinue
Write-Host $upload_response

