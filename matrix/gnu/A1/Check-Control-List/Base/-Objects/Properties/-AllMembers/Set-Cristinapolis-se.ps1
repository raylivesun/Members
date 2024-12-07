#!/home/admin/app/PowerShell/Members

# Set Cristinapolis server address and credentials
$server = 'cristinapolis.example.com'
$username = 'admin'
$password = 'securepassword'

# Establish a connection to the Cristinapolis server
$connection = New-Object System.Management.Automation.PSObject -Property @{
    ServerName = $server
    UserName = $username
    Password = $password
    Authentication = 'Basic'
    UseSSL = $true
}

# Get the list of all virtual machines
$virtualMachines = Get-WmiObject -ComputerName $server -Class Win32_ComputerSystem -Filter "Name='Cristinapolis'" |
    Where-Object { $_.NumberOfLogicalProcessors -gt 1 } |
    Select-Object Name, OperatingSystem, @{ Name = 'CPU Usage (%)'; Expression = { [math]::Round((($_.LoadPercentage / $_.NumberOfLogicalProcessors) * 10
        ), 2) } }

# Get the list of all network adapters
$networkAdapters = Get-WmiObject -ComputerName $server -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled = TRUE" |
    Select-Object Name, IPAddress[], DefaultIPGateway, DNSServerSearchOrder

# Create a CSV file with the virtual machine and network adapter information
$outputCsv = 'virtual_machines.csv'

$virtualMachines |
    Select-Object Name, OperatingSystem, @{ Name = 'CPU Usage (%)'; Expression = { [math]::Round((($_.LoadPercentage / $_.NumberOfLogicalProcessors) * 10
        ), 2) } } |
        Add-Member -MemberType NoteProperty -Name 'Network Adapters' -Value (Get-Content $networkAdapters.Where({ $_.Name -eq $_.IPAddress[0].IPAddress
            }).NetworkAdapterConfiguration.DefaultIPGateway.IPAddressToString + ', ' + $networkAdapters.Where({ $_.Name -eq $_.IPAddress[0].IPAddress
            }).NetworkAdapterConfiguration.DNSServerSearchOrder.Split(',')[0])
            -PassThru |
            Export-Csv -Path $outputCsv -NoTypeInformation
            -Append

# Send the CSV file as an email attachment
$mailParams = @{
    SmtpServer = 'smtp.example.com'
    From = 'noreply@example.com'
    To = 'admin@example.com'
    Subject = 'Virtual Machine and Network Adapter Information'
    Body = 'Please find the attached CSV file with virtual machine and network adapter information.'
    Attachments = @{ Path = $outputCsv; ContentType = 'text/csv' }
}

Send-MailMessage @mailParams

# Clean up the CSV file
Remove-Item $outputCsv
Write-Host "Virtual machine and network adapter information exported to $outputCsv and email sent."
Write-Host "CSV file cleaned up."
Write-Information "Script completed successfully."
Write-Host $connection
