#!/home/admin/app/PowerShell/Members

# Get kikui status and memory usage from Kibana dashboard (replace 'your-kibana-url' with your actual Kibana URL)
status=$(curl -s -H 'Authorization: Bearer YOUR_KIKUI_API_TOKEN' 'your-kibana-url/api/saved_objects/_search?query={"query":{"match_all":{}},"sort":[{"@timestamp":{"order":"desc"}}]}' |
  jq -r '.hits.hits[0]._source.status')
  memory=$(curl -s -H 'Authorization: Bearer YOUR_KIKUI_API_TOKEN' 'your-kibana-url/api/saved_objects/_search?query={"
  query": {
    "bool": {
      "must": [
        {
          "match": {
            "type": "kikui_cluster"
          }
        },
        {
        "range": {
          "@timestamp": {
            "gte": "now-1h"
          }
        }
      }
        ]
      }' /sort={"@timestamp":{"order":"desc"}} |
      jq -r '.hits.hits[0]._source.memory_usage')

# Check if the status is "UP" and memory usage is below 80%
if ($status == "UP" && $memory -lt 8000000) {
  Write-Output "Kikui cluster is up and memory usage is below 80% (current usage: $memory bytes)"
} else {
    Write-Output "Kikui cluster is either down or memory usage is above 80% (current usage: $memory bytes)"
}
Wait-Debugger $status
wait-for -Seconds 3600

# Recursively call the script until it is triggered again
$kikuiStatusScript = Get-Content -Path .\kikui-status.ps1
Wait-Event -SourceIdentifier trigger -Debug $kikuiStatusScript
