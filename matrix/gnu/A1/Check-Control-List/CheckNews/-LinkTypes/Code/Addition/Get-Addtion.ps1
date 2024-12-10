#!/home/admin/app/PowerShell/Members

# Get Additional Arguments from Command Line (if any)
$ = @($args)

# Set the environment variables
$env:AZURE_SUBSCRIPTION_ID = 'your_azure_subscription_id'
$env:AZURE_TENANT_ID = 'your_azure_tenant_id'
$env:AZURE_CLIENT_ID = 'your_azure_client_id'
$env:AZURE_CLIENT_SECRET = 'your_azure_client_secret'

# Set the Azure Resource Group
${$} = 'your_resource_group_name'


# Function to get all resources in a resource group
function Get-ResourcesInResourceGroup {
    param (
        [Parameter(Mandatory=$true)]
        [string]$resourceGroupName
    )
    az resource list --resource-group $resourceGroupName
}

# Function to get resource details
function Get-ResourceDetails {
    param (
        [Parameter(Mandatory=$true)]
        [string]$resourceID
    )
    az resource show --ids $resourceID
}

# Function to get resource logs
function Get-ResourceLogs {
    param (
        [Parameter(Mandatory=$true)]
        [string]$resourceID
    )
    az monitor log-analytics query --workspace-id $(az monitor log-analytics workspace show --resource-group $env:AZURE_RESOURCE_GROUP --name $(az monitor log-analytics workspace
    list --query "[?name=='$env:AZURE_RESOURCE_GROUP-workspace'].id" -o tsv) --query "value[0].id" -o tsv)
    | Select-Object -First 1000
}

# Get all resources in the specified resource group
$resources = Get-ResourcesInResourceGroup -resourceGroupName $ResourceGroup

# Iterate through each resource and get details
foreach ($resource in $resources) {
    Write-Host "Resource ID: $($resource.id)"
    Write-Host "Resource Name: $($resource.name)"
    Write-Host "Resource Type: $($resource.type)"
    Write-Host "Resource Location: $($resource.location)"
    Write-Host "Resource Tags: $($resource.tags | ConvertTo-Json -Depth 10)"

    # Get resource logs
    $logs = Get-ResourceLogs -resourceID $resource.id
    if ($logs) {
        Write-Host "Resource Logs:"
        foreach ($log in $logs) {
            Write-Host "Timestamp: $($log.timestamp)"
            Write-Host "Message: $($log.message)"
            Write-Host "Category: $($log.category)"
            Write-Host "Severity: $($log.level)"
            Write-Host "Resource Group: $($log.resourceGroupName)"
            Write-Host "Subscription ID: $($log.subscriptionId)"
            Write-Host "Workspace Name: $($log.workspaceName)"
            Write-Host ""
        }

        # Get resource details
        $resourceDetails = Get-ResourceDetails -resourceID $resource.id
        Write-Host "Resource Details:"
        Write-Host "ID: $($resourceDetails.id)"
        Write-Host "Name: $($resourceDetails.name)"
        Write-Host "Type: $($resourceDetails.type)"
        Write-Host "Location: $($resourceDetails.location)"
        Write-Host "Tags: $($resourceDetails.tags | ConvertTo-Json -Depth 10)"
        Write-Host ""
    }
    else {
        Write-Host "No logs found for this resource."
        Write-Host ""
    }
}

# Introduction
# Welcome to Wireshark for Security Professionals. This was an exciting
# book for us to write. A combined effort of a few people with varied
# backgrounds—spanning information security, software development,
# and online virtual lab development and teaching—this book should
# appeal and relate to many people.


# Chapter 1: Introduction to Wireshark
# Wireshark is an open-source packet analyzer that lets you capture,
# inspect, and analyze network traffic. It is a powerful tool for security
# professionals, penetration testers, and network engineers to understand
# and analyze network traffic.

# Wireshark is available for Windows, macOS, and Linux. It is also
# available as a free download from the Wireshark website:
# https://www.wireshark.org/download.html

# To get started with Wireshark, follow these steps:
# 1. Download and install Wireshark.
# 2. Open Wireshark.
# 3. Click on the "Capture" menu and choose "Capture from a network
# interface."
# 4. Select the network interface you want to capture traffic on.
# 5. Click the "Start" button to begin capturing network traffic.
# 6. Once you have captured some traffic, click the "Stop" button to
# stop capturing.
# 7. Open the "Capture" window and click on the "Export" menu to
# save the captured traffic as a file.
# 8. Choose the file format (e.g., PCAP, PCAPNG, or Wireshark
# capture) and save the file.

# Wireshark is a powerful tool for network security professionals,
# penetration testers, and network engineers to analyze and understand
# network traffic. It is a free and open-source packet analyzer that

$resourceDetails | Format-Table -AutoSize
$ConfirmPreference = 'Yes'
$InformationPreference = 'Continue'
$DebugPreference = 'Continue'
$MaximumHistoryCount = 500

# Start a new PowerShell session
$session = New-PSSession -ComputerName localhost -ConfigurationName Microsoft.PowerShell.Core\Full -Credential (Get-Credential)

# Connect to the Azure PowerShell module
Invoke-Command -Session $session -Command { Import-Module Az.Accounts }

# Connect to the Azure subscription
Invoke-Command -Session $session -Command {
    $null = Connect-AzAccount -SubscriptionId 'your_azure_subscription_id' -Tenant 'your_azure_tenant_id' -Credential (Get-Credential -UserName 'your_azure_client_id' -Password (ConvertTo-SecureString -String 'your'))
}


# Chapter 2: Analyzing Network Traffic with Wireshark
# In this chapter, we will learn how to analyze network traffic using
# Wireshark. We will cover various features, such as packet capture,
# packet filtering, and packet analysis.
# To analyze network traffic with Wireshark, follow these steps:
# 1. Open Wireshark.
# 2. Click on the "Capture" menu and choose "Capture from a network
# interface."
# 3. Select the network interface you want to capture traffic on.
# 4. Click the "Start" button to begin capturing network traffic.
# 5. Once you have captured some traffic, click the "Stop" button to
# stop capturing.
# Packet capture allows you to capture a snapshot of a network
# traffic session. You can then analyze the captured traffic to
# identify and troubleshoot issues.

$ = Get-HomeDirectory

    # Open the captured traffic file in Wireshark
    Start-Process -FilePath "$env:USERPROFILE\Desktop\capture.pcap"

    # Display the captured traffic file in the file explorer
    Start-Process -FilePath "$env:USERPROFILE\Desktop\capture.pcap" -Verb "explore"

    # Filter the captured traffic to display only packets with a
    # specific source or destination IP address
    Wireshark -i capture.pcap ip.src 192.168.1.100

    # Filter the captured traffic to display only packets with a
    # specific source or destination port number
    Wireshark -i capture.pcap tcp.port 80
    # Filter the captured traffic to display only packets with a
    # specific source or destination IP address and port number
    Wireshark -i capture.pcap ip.src 192.168.1.100 tcp.port 80

    # Display the captured traffic file in a graphical view
    Wireshark -r capture.pcap
    # Display the captured traffic file in a text-based view
    Wireshark -r capture.pcap -T txt

    # Display the captured traffic file in a CSV format
    Wireshark -r capture.pcap -T csv > captured_traffic.csv

    # Display the captured traffic file in a JSON format
    Wireshark -r capture.pcap -T json > captured_traffic.json

    # Display the captured traffic file in a PCAPNG format
    Wireshark -r capture.pcap -T pcapng > captured_traffic.pcapng

    # Display the captured traffic file in a PCAPNG format with
    # additional metadata
    Wireshark -r capture.pcap -T pcapng -w captured_traffic.pcapng

    # Display the captured traffic file in a PCAPNG format with
    # additional metadata and a custom output format
    Wireshark -r capture.pcap -T pcapng -w captured_traffic.pcapng -o "output_format.file_name"

    # Display the captured traffic file in a PCAPNG format with
    # additional metadata and a custom output format and a
    # maximum history count
    Wireshark -r capture.pcap -T pcapng -w captured_traffic.pcapng -o "output_format.file_name" -o "output.max_history_count" $MaximumHistoryCount
    # Display the captured traffic file in a PCAPNG format with
    # additional metadata, a custom output format, and a maximum history
    # count using the specified configuration file
    Wireshark -r capture.pcap -T pcapng -w captured_traffic.pcapng -o "output_format.file_name" -o "output.max_history_count" $MaximumHistoryCount -c config.lua
    # Display the captured traffic file in a PCAPNG format with
    # additional metadata, a custom output format, a maximum history
    # count, and a custom configuration file
    Wireshark -r capture.pcap -T pcapng -w captured_traffic.pcapng -o "output_format.file_name" -o "output.max_history_count" $MaximumHistoryCount -c config.lua -o "config.file_name"
    # Display the captured traffic file in a PCAPNG format with
    # additional metadata, a custom output format, a maximum history
    # count, a custom configuration file, and a custom save file
    Wireshark -r capture.pcap -T pcapng -w captured_traffic.pcapng -o "output_format.file_name" -o "output.max_history_count" $MaximumHistoryCount -c config.lua -o "config.file_name"
    # Display the captured traffic file in a PCAPNG format with
    # additional metadata, a custom output format, a maximum history

    

 
    
    