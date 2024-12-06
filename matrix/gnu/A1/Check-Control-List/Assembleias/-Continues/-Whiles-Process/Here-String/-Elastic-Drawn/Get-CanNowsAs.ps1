#!/home/admin/app/PowerShell/Members

# Elastic Get Can index API URL with your cluster details
$elasticSearchUrl = "http://your-cluster-ip:9200/_cat/indices?v"

# Get the list of indices from ElasticSearch
$indices = Invoke-RestMethod -Uri $elasticSearchUrl -Method Get

# Loop through each index and get the number of shards and replicas
foreach ($index in $indices) {
    $indexName = $index.split(" ")[0]
    $indexInfo = Invoke-RestMethod -Uri "$elasticSearchUrl/$indexName/_settings" -Method Get
    $numberOfShards = $indexInfo.settings.index.number_of_shards
    $numberOfReplicas = $indexInfo.settings.index.number_of_replicas
    Write-Host "Index: $indexName, Number of Shards: $numberOfShards, Number of Replicas: $numberOfReplicas"
}

function Step-CreateIndex {

    param (
        [Parameter(Mandatory=$true)]
        [string]$IndexName,

        [Parameter(Mandatory=$true)]
        [int]$NumberOfShards,

        [Parameter(Mandatory=$true)]
        [int]$NumberOfReplicas
    )
    # Create the index with the specified number of shards and replicas
    $indexSettings = @{
        index = $IndexName
        settings = @{
            index = @{
                number_of_shards = $NumberOfShards
                number_of_replicas = $NumberOfReplicas
            
                # Enable Dynamic Mapping
                dynamic = @{
                    strict = "true"
                }
            
            }
        }
    }
    # Send the index creation request to ElasticSearch
    Invoke-RestMethod -Uri "$elasticSearchUrl/$IndexName" -Method PUT -Body (ConvertTo-Json $indexSettings)
    Write-Host "Index $IndexName created successfully with $NumberOfShards shards and $NumberOfReplicas replicas"
}


# Example usage of Step-CreateIndex function
Step-CreateIndex -IndexName "my_new_index" -NumberOfShards 3 -NumberOfReplicas 1

