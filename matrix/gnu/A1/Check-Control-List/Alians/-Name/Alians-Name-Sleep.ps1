#!/home/admin/app/PowerShell/Members

# Alians Namespaces for the required modules and functions SDK for Sleep and Test-Connection
using namespace System.Net.NetworkInformation
using namespace System.Threading
using namespace Microsoft.Azure.Management.Compute.Models
using namespace Microsoft.Azure.Management.Compute
using namespace Microsoft.Azure.Management.Compute.Fluent
using namespace Microsoft.Azure.Management.Fluent

# Define the Azure subscription ID
$subscriptionId = "<Azure_Subscription_ID>"

# Define the Azure tenant ID
$tenantId = "<Azure_Tenant_ID>"
Write-Host $tenantId
# Define the Azure client ID
$clientId = "<Azure_Client_ID>"
Write-Host $clientId
# Define the Azure client secret
$clientSecret = "<Azure_Client_Secret>"
Write-Host $clientSecret
# Define the Azure region
$region = "<Azure_Region>"

# Define the resource group name
$resourceGroupName = "<Azure_Resource_Group_Name>"

# Define the virtual machine name
$vmName = "<Azure_Virtual_Machine_Name>"

# Define the virtual machine size
$vmSize = "Standard_D2s_v3"

# Define the virtual machine admin username
$vmAdminUsername = "<Azure_Virtual_Machine_Admin_Username>"

# Define the virtual machine admin password
$vmAdminPassword = "<Azure_Virtual_Machine_Admin_Password>"

# Define the virtual machine public IP address name
$vmPublicIPAddressName = "<Azure_Virtual_Machine_Public_IP_Address_Name>"

# Define the virtual machine network interface name
$vmNetworkInterfaceName = "<Azure_Virtual_Machine_Network_Interface_Name>"
Write-Host $vmNetworkInterfaceName
# Define the virtual machine network security group name
$vmNetworkSecurityGroupName = "<Azure_Virtual_Machine_Network_Security_Group_Name>"
Write-Host $vmNetworkSecurityGroupName
# Define the virtual machine public IP address allocation method
$vmPublicIPAddressAllocationMethod = "Static"

# Define the virtual machine public IP address domain name label
$vmPublicIPAddressDomainNameLabel = "<Azure_Virtual_Machine_Public_IP_Address_Domain_Name_Label>"
Write-Host $vmPublicIPAddressDomainNameLabel
# Define the virtual machine network interface subnet name
$vmNetworkInterfaceSubnetName = "<Azure_Virtual_Machine_Network_Interface_Subnet_Name>"

# Define the virtual machine network interface subnet resource ID
$vmNetworkInterfaceSubnetId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$resourceGroupName/subnets/$vmNetworkInterfaceSubnetName"
Write-Host $vmNetworkInterfaceSubnetId
# Define the virtual machine network interface private IP address
$vmNetworkInterfacePrivateIPAddress = "<Azure_Virtual_Machine_Network_Interface_Private_IP_Address>"

# Define the virtual machine network interface private IP address prefix length
$vmNetworkInterfacePrivateIPAddressPrefixLength = 29

# Define the virtual machine network interface public IP address idle timeout in minutes
$vmNetworkInterfacePublicIPAddressIdleTimeoutInMinutes = 4
Write-Host $vmNetworkInterfacePublicIPAddressIdleTimeoutInMinutes
# Define the virtual machine virtual network name
$vmVirtualNetworkName = "<Azure_Virtual_Machine_Virtual_Network_Name>"

# Define the virtual machine virtual network resource ID
$vmVirtualNetworkId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$vmVirtualNetworkName"
Write-Host $vmVirtualNetworkId
# Define the virtual machine virtual network address space
$vmVirtualNetworkAddressSpace = "<Azure_Virtual_Machine_Virtual_Network_Address_Space>"

# Define the virtual machine virtual network subnet name
$vmVirtualNetworkSubnetName = "<Azure_Virtual_Machine_Virtual_Network_Subnet_Name>"

# Define the virtual machine virtual network subnet resource ID
$vmVirtualNetworkSubnetId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$vmVirtualNetworkName/subnets/$vmVirtualNetworkSubnetName"

# Define the virtual machine virtual network subnet address prefix length
$vmVirtualNetworkSubnetAddressPrefixLength = 29
Write-Host $vmVirtualNetworkSubnetAddressPrefixLength
# Define the virtual machine virtual network subnet service endpoints
$vmVirtualNetworkSubnetServiceEndpoints = @()

# Define the virtual machine virtual network subnet service endpoint name
$vmVirtualNetworkSubnetServiceEndpointName = "<Azure_Virtual_Machine_Virtual_Network_Subnet_Service_Endpoint_Name>"

# Define the virtual machine virtual network subnet service endpoint resource ID
$vmVirtualNetworkSubnetServiceEndpointId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$vmVirtualNetworkName/subnets/$vmVirtualNetworkSubnetName/serviceEndpoints/$vmVirtualNetworkSubnetServiceEndpointName"

# Define the virtual machine virtual network subnet service endpoint location
$vmVirtualNetworkSubnetServiceEndpointLocation = "<Azure_Virtual_Machine_Virtual_Network_Subnet_Service_Endpoint_Location>"

# Define the virtual machine virtual network subnet service endpoint tags
$vmVirtualNetworkSubnetServiceEndpointTags = @{
    ServiceName = $vmVirtualNetworkSubnetServiceEndpointName
    Location = $vmVirtualNetworkSubnetServiceEndpointLocation
}

# Define the virtual machine virtual network subnet service endpoint properties
$vmVirtualNetworkSubnetServiceEndpointProperties = @{
    ServiceResourceID = $vmVirtualNetworkSubnetServiceEndpointId
    ServiceName = $vmVirtualNetworkSubnetServiceEndpointName
    Location = $vmVirtualNetworkSubnetServiceEndpointLocation
    Tags = $vmVirtualNetworkSubnetServiceEndpointTags
}

# Define the virtual machine virtual network subnet service endpoint object
$vmVirtualNetworkSubnetServiceEndpointObject = New-Object -TypeName Microsoft.Azure.Management.Compute.Fluent.Models.VirtualMachineSubnetServiceEndpoint -Property $vmVirtualNetworkSubnetServiceEndpointProperties

# Define the virtual machine virtual network subnet service endpoints array
$vmVirtualNetworkSubnetServiceEndpoints += $vmVirtualNetworkSubnetServiceEndpointObject

# Define the virtual machine virtual network subnet properties
$vmVirtualNetworkSubnetProperties = @{
    AddressPrefix = $vmVirtualNetworkSubnetAddressPrefix
    ServiceEndpoints = $vmVirtualNetworkSubnetServiceEndpoints
}

# Define the virtual machine virtual network subnet object
$vmVirtualNetworkSubnetObject = New-Object -TypeName Microsoft.Azure.Management.Compute.Fluent.Models.VirtualMachineSubnet -Property $vmVirtualNetworkSubnetProperties

# Define the virtual machine virtual network subnets array
$vmVirtualNetworkSubnets += $vmVirtualNetworkSubnetObject

# Define the virtual machine virtual network properties
$vmVirtualNetworkProperties = @{
    AddressSpace = $vmVirtualNetworkAddressSpace
    Subnets = $vmVirtualNetworkSubnets
    EnableDdosProtection = $false
}

# Define the virtual machine virtual network object
$vmVirtualNetworkObject = New-Object -TypeName Microsoft.Azure.Management.Compute.Fluent.Models.VirtualNetwork -Property $vmVirtualNetworkProperties
Write-Host $vmVirtualNetworkObject
# Define the virtual machine network interface properties
$vmNetworkInterfaceProperties = @{
    PrivateIPAddressAllocationMethod = $vmPublicIPAddressAllocationMethod
    PrivateIPAddress = $vmNetworkInterfacePrivateIPAddress
    PrivateIPAddressPrefixLength = $vmNetworkInterfacePrivateIPAddressPrefixLength
    PublicIPAddressConfiguration = @{
        Name = $vmPublicIPAddressName
        Id = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/publicIPAddresses/$vmPublicIPAddressName"
    }
    EnableIPForwarding = $false
    Primary = $true
    Subnet = $vmVirtualNetworkSubnetObject
}

# Define the virtual machine network interface object
$vmNetworkInterfaceObject = New-Object -TypeName Microsoft.Azure.Management.Compute.Fluent.Models.NetworkInterface -Property $vmNetworkInterfaceProperties

# Define the virtual machine network interfaces array
$vmNetworkInterfaces += $vmNetworkInterfaceObject

# Define the virtual machine properties
$vmProperties = 
    Location = $region
    HardwareProfile = @{
        VmSize = $vmSize
    }
    OsProfile = 
        ComputerName = $vmName
        AdminUsername = $vmAdminUsername
        AdminPassword = $vmAdminPassword
        CustomData = @"
        #cloud-config
        password: $vmAdminPassword
        ssh_pwauth: yes
        "@
    }
        NetworkProfile = @{
        NetworkInterfaces = $vmNetworkInterfaces
    }
        StorageProfile = @{
        ImageReference = @{
            Publisher = "canonical"
            Offer = "UbuntuServer"
            Sku = "18.04-LTS"
            Version = "latest"
        }
        OsDisk = @{
            Caching = "ReadWrite"
            CreateOption = "FromImage"
            Name = "$vmName-osDisk"
            Vhd = @{
            Uri = "https://$resourceGroupName.blob.core.windows.net/vhds/$vmName-osDisk.vhd"
            }
        }
            DataDisks = @()
    }
            AdditionalCapabilities = @{
            UltraSSDEnabled = $false
        }
            Tags = @{
            Environment = "Development"
        }
            SecurityProfile = @{
            SecurityType = "TrustedMicrosoftServices"
        }
            VnetConfiguration = @{
            SubnetId = $vmVirtualNetworkSubnetId
        }
            LicenseType = "Windows_Server"
}

# Define the virtual machine object
$vmObject = New-Object -TypeName Microsoft.Azure.Management.Compute.Fluent.VirtualMachine -Property $vmProperties

# Create the virtual machine
$vm = $vmObject | Set-AzVm

Write-Host "Virtual Machine $vmName created successfully."
"@


# Output the generated Azure PowerShell script for creating a virtual machine
$script | Format-Json -Depth 100


# Save the generated Azure PowerShell script to a file
$script | Out-File -FilePath "create-virtual-machine.ps1" -Encoding utf8


Write-Host "Azure PowerShell script for creating a virtual machine has been saved to create-virtual-machine.ps1."


# Open the generated Azure PowerShell script in a text editor
Start-Process -FilePath create-virtual-machine.ps1 -Verb "edit"


Write-Host "Azure PowerShell script for creating a virtual machine has been opened in a text editor."


# Execute the generated Azure PowerShell script to create the virtual machine
# Replace "<Azure_Subscription_Id>", "<Azure_Resource_Group_Name>", "<Azure_Region>", "<Azure_Virtual_Machine_Name>", "<Azure_Virtual_Machine_Admin_Username>", "<Azure_Virtual_Machine_Admin_Password>", "<Azure_Virtual_
# Azure_Virtual_Machine_Network_Interface_Private_IP_Address>", "<Azure_Virtual_Machine_Network_Interface_Private_IP_Address_Prefix_Length>", "<Azure_Virtual_Machine_Virtual_Network_Name>", "<Azure_Virtual_Machine_Virtual
# Azure_Virtual_Machine_Virtual_Network_Address_Space>", "<Azure_Virtual_Machine_Virtual_Network_Subnet_Name>", "<Azure_Virtual_Machine_Virtual_Network_Subnet_Service_Endpoint_Name>", "<Azure_Virtual_Machine_Virtual_Network
# Azure_Virtual_Machine_Virtual_Network_Subnet_Service_Endpoint_Location>" with your actual values
# Invoke-Expression -Command.\create-virtual-machine.ps1

