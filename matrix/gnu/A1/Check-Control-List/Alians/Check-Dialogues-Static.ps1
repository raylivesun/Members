#!/home/admin/app/PowerShell/Members

# connection string to the Azure Cosmos DB instance
function Get-CosmosDBData {
$connectionString = "AccountEndpoint=https://yourcosmosdbinstance.documents.azure.com:443/;AccountKey=yourcosmosdbkey;"

 # name of the database
 $databaseName = "yourdatabasename"

 # name of the container
 $containerName = "yourcontainername"

 # query to fetch data
 $query = "SELECT * FROM c"

 # create a Cosmos DB client
 $client = New-Object Microsoft.Azure.Cosmos.CosmosClient($connectionString)

 # get the database
 $database = $client.GetDatabase($databaseName)
 # get the container
 $container = $database.GetContainer($containerName)

 # execute the query
 $queryResult = $container.Items.Query($query)
 $results = @()

 # iterate over the query results and add them to the results array
 foreach ($item in $queryResult) {
 $results += $item.Properties
 }

 # return the results
 return $results
}

# get the Cosmos DB data
$data = Get-CosmosDBData

# write the data to a JSON file
$outputPath = "output.json"
$jsonData = ConvertTo-Json -InputObject $data -Depth 10

# check if the output path already exists
if (Test-Path $outputPath) {
 # if it does, append the data to the existing file
 Add-Content -Path $outputPath -Value $jsonData
 } else {
 # if it doesn't, create a new file and write the data to it
 New-Item -ItemType File -Path $outputPath -Value $jsonData

 # add a header to the PowerShell script
 Add-Content -Path $outputPath -Value '# PowerShell script to fetch data from Azure Cosmos DB'

 # add a header to the JSON file
 Add-Content -Path $outputPath -Value '# JSON data fetched from Azure Cosmos DB'
 }
 Write-Host "Data written to '$outputPath'"
 Write-Host "Data fetched from Azure Cosmos DB:"
 Write-Host $jsonData
 Write-Host "To view the data, open '$outputPath' in a text editor."
 Write-Host "To automate the script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell."
 Write-Host "Note: Replace 'yourcosmosdbinstance', 'yourdatabasename', 'yourcontainername', and 'yourcosmosdbkey' with your actual Cosmos DB instance details."
 Write-Host "To customize the query, modify the 'query' variable in the script."
 Write-Host "To customize the output file path, modify the 'outputPath' variable in the script."
 Write-Host "To customize the JSON depth, modify the '-Depth 10' parameter in the 'ConvertTo-Json' cmdlet."
 Write-Host "To customize the PowerShell script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell."
 Write-Host "To automate the script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell."
 Write-Host "To customize the query, modify the 'query' variable in the script."
 Write-Host "To customize the output file path, modify the 'outputPath' variable in the script."
 Write-Host "To customize the JSON depth, modify the '-Depth 10' parameter in the 'ConvertTo-Json' cmdlet."
 Write-Host "To customize the PowerShell script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell."
 # to automate the script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell.
 # to customize the query, modify the 'query' variable in the script.
 # to customize the output file path, modify the 'outputPath' variable in the script.
 # to customize the JSON depth, modify the '-Depth 10' parameter in the 'ConvertTo-Json' cmdlet.
 # to customize the PowerShell script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell.
 # to automate the script, save it to a file, such as fetch-cosmosdb-data.ps1, and run it using PowerShell.
 