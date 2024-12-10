#!/home/admin/app/PowerShell/Members

# Ip addresses of your web servers (replace with your actual IP addresses)
$webServerIpAddresses = @("192.168.1.1", "192.168.1.2", "192.168.1.3")

# Get the current date and time
$currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Create a log file with the current date and time
$logFileName = "web_server_status_{0}.log" -f $currentTime
$logFilePath = Join-Path -Path $PSScriptRoot -ChildPath $logFileName

# Write the header to the log file
Write-Host "Web Server Status Log: $logFileName"
Write-Host "------------------------------------------"
Write-Host "Date/Time: $currentTime"
Write-Host ""

foreach ($ipAddress in $webServerIpAddresses) {
    try {
        # Ping the web server and get the response time
        $pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet

        if ($pingResult) {
            $responseTime = $pingResult.PingStatistics.AverageRoundtripTime
            $status = "Online"
            $statusColor = "Green"
            $message = "Server is responding with average response time of $responseTime ms."
            $icon = [System.Management.Automation.Host.Host.UI.Icons]::ExclamationMark
            Write-Host -BackgroundColor $statusColor -ForeGroundColor "White" -Icon $icon -Object "Server: $ipAddress - $status"
            Write-Host $message
            Write-Host ""
            Write-Output -Object @{
                Server = $ipAddress
                Status = $status
                ResponseTime = $responseTime
                Message = $message
            }
            Add-Content -Path $logFilePath -Value "$(Get-Date): Server: $ipAddress - $status - Response Time: $responseTime ms - $message"
            continue
        }
        else {
            $status = "Offline"
            $statusColor = "Red"
            $message = "Server is not responding."
            $icon = [System.Management.Automation.Host.Host.UI.Icons]::StopSign
            Write-Host -BackgroundColor $statusColor -ForeGroundColor "White" -Icon $icon -Object "Server: $ipAddress - $status"
            Write-Host $message
            Write-Host ""
            Write-Output -Object @{
                Server = $ipAddress
                Status = $status
                Message = $message
            }
            Add-Content -Path $logFilePath -Value "$(Get-Date): Server: $ipAddress - $status - $message"
            continue
        }

    } catch {
        $status = "Error"
        $statusColor = "Yellow"
        $message = "An error occurred while checking the server status: $_"
        $icon = [System.Management.Automation.Host.Host.UI.Icons]::ExclamationMark
        Write-Host -BackgroundColor $statusColor -ForeGroundColor "White" -Icon $icon -Object "Server: $ipAddress - $status"
        Write-Host $message
        Write-Host ""
        Write-Output -Object @{
            Server = $ipAddress
            Status = $status
            Message = $message
        }
        Add-Content -Path $logFilePath -Value "$(Get-Date): Server: $ipAddress - $status - Error: $_"
    }
    finally {
        Write-Host ""
    }
}

Write-Host "------------------------------------------"
Write-Host "End of Log"
