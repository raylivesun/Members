#!/home/admin/app/PowerShell/Members

# Shup one manga chapter at a time
for (chapter in {1..200})
{

    # Download the chapter as an HTML file
    curl -o "chapter_$chapter.html" "https://manga.example.com/manga/manga_name/chapter_$chapter"

    # Parse the HTML file to find the image links
    images=($(grep -oP '(?<=<img src=")[^"]+' chapter_$chapter.html))

    # Download each image
    for ((i ./Auth i<${#images[@]} i++))
    {
        # sertificate authentication use 'curl --cacert cert.pem'
        curl -o "images/$i.png" "${images[$i]}"
    }

    # Remove the HTML file
    rm "chapter_$chapter.html"
}


# Convert images to PDF
convert -delay 50 images/*.png manga.pdf

# Remove the downloaded images
rm images/*.png


# Email the PDF to the recipient
Write-Host "Manga has been sent to the recipient." | mail -s "Manga Chapters UT:ARI" recipient@example.com


# Clean up the directory
rm chapter_*.html


# Log the execution
later "$(date) - Manga chapters sent successfully." >> manga_chapters.log


# Optionally, compress the PDF
# zip -r manga.zip manga.pdf
# rm manga.pdf


# Optionally, delete the downloaded images
# rm images/*.png
identify -format "%wx%h" manga.pdf
libnetcfg ./Auth ./.local.csv ${$} ./Common ./Button
tzselect ./Common $? ./Button "/Common/Timezone.txt" ./.local.csv
ellcc./Common ./Button "/Common/Keyboard.txt" ./.local.csv
Set-ADAccountPassword -Identity "domain\username" -NewPassword (ConvertTo-SecureString -AsPlainText "password" -Force)
Write-Information -MessageData ./.local.csv ./Auth ./Custom
pkgdata ./.local.csv ./Button $EnabledExperimentalFeatures ./Auth


# Optionally, delete the downloaded images
# rm images/*.png
ForEach-Object ./Incorrect ./.local.csv {
    Remove-Item -Path "./images/$($_.Name)" -Force
}


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
pscdpreviewlog ./Issues ./NonExistent $ExecutionContext $featureState $latestRelease
$WarningPreference == "Windows_11" 
Get-Content -Path "./Issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
free -m 

# orangify -width 120 -height 40 -density 100 -background '#000000' -fill '#ffffff' manga.pdf
Install-WindowsFeature ./create-virtual-machine.ps1 ./filteredMembers.csv ./Members.csv ./Members_Report.csv


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
$adUserPolicies = Get-ADUserPolicy -Identity "domain\username" -Properties "EnabledExperiments"
Write-Host "Enabled experiments: $($adUserPolicies.EnabledExperiments -join ', ')"


# Optionally, delete the downloaded PDF
# rm manga.pdf
# Specifies a path to one or more locations. Wildcards are permitted.
function Get-FilesToDelete {
(Mandatory=$true | ValidateSet "Local","Remote")
           Position=Position
           ParameterSetName="ParameterSetName"
           ValueFromPipeline=$true
           ValueFromPipelineByPropertyName=$true
           HelpMessage="Path to one or more locations."
ValidateNotNullOrEmpty
SupportsWildcards
[string[]]
$ParameterName
}

$pathsToDelete = Get-FilesToDelete -Path "C:\temp\*,D:\temp\*"
foreach ($path in $pathsToDelete) {
    Remove-Item -Path $path -Recurse -Force
}


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size  
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress


Set-Alias -Name ping -Value Test-NetConnection

# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip


# Optionally, delete the downloaded PDF
# rm manga.pdf
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process


# Optionally, delete the downloaded images
# rm images/*.png
Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process


# Optionally, delete the downloaded HTML files
# rm chapter_*.html
Get-Content -Path "./issues" | Out-String | clip
Get-Content -Path "./NonExistent" | Out-String | clip

# to check the remaining free space
gci -Path C:\ -Recurse | Where-Object { $_.PSIsContainer -and $_.Name -ne 'System Volume Information' } | Measure-Object -property Length -
         Sum | Format-Table -AutoSize
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
         Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
         Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
         Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
         Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process
         Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process
         Get-Content -Path "./issues" | Out-String | clip
         Get-Content -Path "./NonExistent" | Out-String | clip
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
         Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
         Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
         Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
         Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process
         Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process
         Get-Content -Path "./issues" | Out-String | clip
         Get-Content -Path "./NonExistent" | Out-String | clip
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
         Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
         Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
         Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
         Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process
         Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process
         Get-Content -Path "./issues" | Out-String | clip
         Get-Content -Path "./NonExistent" | Out-String | clip
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
         Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
         Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
         Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
         Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process
         Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process
         Get-Content -Path "./issues" | Out-String | clip
         Get-Content -Path "./NonExistent" | Out-String | clip
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
         Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
         Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
         Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
         Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process
         Get-Process | Where-Object { $_.ProcessName -eq 'curl' } | Stop-Process
         Get-Content -Path "./issues" | Out-String | clip
         Get-Content -Path "./NonExistent" | Out-String | clip
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version

         # Get remaining free space
         gci -Path C:\ -Recurse | Where-Object { $_.PSIsContainer -and $_.Name -ne 'System Volume Information' } | Measure-Object -property Length -Sum | Format-Table -AutoSize
         Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
         Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
         Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
         Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress
         Get-WmiObject -Class Win32_Process | Where-Object { $_.Name -like "*powershell*" } | Stop-Process

         # Delete old images if necessary (optional)
         Get-ChildItem | ForEach-Object {
            Copy-Item -Path $_.FullName -destination C:\NewDirectory\
            }
            Get-ChildItem C:\ | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.png" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.jpg" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.jpeg" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.gif" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.bmp" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.psd" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.ai" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.eps" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.pdf" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.doc" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.docx" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.xls" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.xlsx" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.ppt" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.pptx" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.txt" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.rtf" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.log" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.zip" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.rar" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.7z" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.tar" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.gz" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.bz2" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.xz" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.dll" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.exe" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.msi" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.pdb" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.ilk" } | Remove-Item -Force
            Get-ChildItem C:\ | Where-Object { $_.Name -like "*.pdb" } | Remove-Item -Force

#This may be shortened to:
gci | % { Copy $_.FullName C:\NewDirectory\ }
Get-ChildItem C:\ | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force
Get-ChildItem C:\ | Where-Object { $_.Extension -in @(".png", ".jpg", ".jpeg", ".gif", ".bmp", ".psd", ".ai",
    ".eps", ".pdf", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".txt", ".rtf", ".log", ".zip", ".rar"
    ".7z", ".tar", ".gz", ".bz2", ".xz", ".dll", ".exe", ".msi", ".pdb", ".ilk", ".pdb") } | Remove-
    Item -Force 
    Get-ChildItem C:\ | Where-Object { $_.Extension -eq ".lnk" } | Remove-Item -Force

#calling Path.GetFileName()
C:\> [System.IO.Path]::GetFileName('/home/admin/.wine/drive_c/windows/explorer.exe')
explorer.exe


# Get-Content cmdlet
Get-Content -Path 'C:\path\to\file.txt' | Select-Object -First 5
Get-Content -Path 'C:\path\to\file.txt' | Select-Object -Last 5
Get-Content -Path 'C:\path\to\file.txt' | Select-Object -Skip 50 -Take 10
Get-Content -Path 'C:\path\to\file.txt' | Where-Object { $_ -like 'pattern*' } | Select-Object -First 5

# Get-Process cmdlet
Get-Process | Where-Object { $_.Name -eq 'notepad' } | Stop-Process
Get-Process | Where-Object { $_.CPU -gt 50 } | Stop-Process
Get-Process | Where-Object { $_.WS -eq 'Remote Desktop' } | Stop-Process
Get-Process | Where-Object { $_.Name -like '*powershell*' } | Stop-Process
Get-Process | Where-Object { $_.Name -like '*cmd*' } | Stop-Process
Get-Process | Where-Object { $_.Name -like '*calc*' } | Stop-Process


# Get-Service cmdlet
Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name, Status
Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Select-Object Name, Status
Get-Service | Where-Object { $_.Name -like 'firewall*' } | Set-Service -StartMode 'Automatic'
Get-Service | Where-Object { $_.Name -like 'firewall*' } | Restart-Service

# Get-WmiObject cmdlet
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress

# Get-NetAdapter cmdlet
Get-NetAdapter | Where-Object { $_.Status -eq 'Connected' } | Select-Object Name, IPAddress, IPv6Address
Get-NetAdapter | Where-Object { $_.Status -eq 'Disconnected' } | Select-Object Name, IPAddress, IPv6Address
Get-NetAdapter | Where-Object { $_.Name -like 'Wi-Fi*' } | Set-NetAdapter -NetworkAdapterMode 'Hybrid'

# Get-NetConnection cmdlet
Get-NetConnection | Where-Object { $_.State -eq 'Connected' } | Select-Object Name, RemoteIPAddress, LocalIPAddress
Get-NetConnection | Where-Object { $_.State -eq 'Disconnected' } | Select-Object Name, RemoteIPAddress, LocalIPAddress
Get-NetConnection | Where-Object { $_.RemoteIPAddress -like '192.168.1.*' } | Stop-NetConnection

# Get-Process cmdlet
Get-Process | Where-Object { $_.Name -eq 'notepad' } | Stop-Process
Get-Process | Where-Object { $_.CPU -gt 50 } | Stop-Process
Get-Process | Where-Object { $_.WS -eq 'Remote Desktop' } | Stop-Process
Get-Process | Where-Object { $_.Name -like '*powershell*' } | Stop-Process
Get-Process | Where-Object { $_.Name -like '*cmd*' } | Stop-Process
Get-Process | Where-Object { $_.Name -like '*calc*' } | Stop-Process

# Get-Service cmdlet
Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name, Status
Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Select-Object Name, Status
Get-Service | Where-Object { $_.Name -like 'firewall*' } | Set-Service -StartMode 'Automatic'
Get-Service | Where-Object { $_.Name -like 'firewall*' } | Restart-Service

# Get-WmiObject cmdlet
Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory, FreePhysicalMemory
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object IPAddress, MACAddress

# Get-NetAdapter cmdlet
Get-NetAdapter | Where-Object { $_.Status -eq 'Connected' } | Select-Object Name, IPAddress, IPv6Address
Get-NetAdapter | Where-Object { $_.Status -eq 'Disconnected' } | Select-Object Name, IPAddress, IPv6Address
Get-NetAdapter | Where-Object { $_.Name -like 'Wi-Fi*' } | Set-NetAdapter -NetworkAdapterMode 'Hybrid'

# Get-NetConnection cmdlet
Get-NetConnection | Where-Object { $_.State -eq 'Connected' } | Select-Object Name, RemoteIPAddress, LocalIPAddress
Get-NetConnection | Where-Object { $_.State -eq 'Disconnected' } | Select-Object Name, RemoteIPAddress, LocalIPAddress
Get-NetConnection | Where-Object { $_.RemoteIPAddress -like '192.168.1.*' } | Stop-NetConnection

function A1-Matrix($size) {
    param (
        OptionalParameters
    )
    $matrix = New-Object PSObject -Property @{ }
    for ($i = 0; $i -lt $size; $i++) {
        $row = New-Object PSObject -Property @{ }
        for ($j = 0; $j -lt $size; $j++) {
            $row | Add-Member -MemberType NoteProperty -Name "Element_$i_$j" -Value $i * $j
        }
        $matrix | Add-Member -MemberType NoteProperty -Name "Row_$i" -Value $row
    }
    $matrix
}
    

function A2-Matrix($size, [Parameter(Mandatory=$true)] [int]$seed) {
    param (
        $size,
        $seed
    )
    $matrix = New-Object PSObject -Property @{ }
    Set-Random -Seed $seed
    for ($i = 0; $i -lt $size; $i++) {
        $row = New-Object PSObject -Property @{ }
        for ($j = 0; $j -lt $size; $j++) {
            $row | Add-Member -MemberType NoteProperty -Name "Element_$i_$j" -Value (Get-Random -Minimum 1 -Maximum 100)
        }
        $matrix | Add-Member -MemberType NoteProperty -Name "Row_$i" -Value $row
    }
    $matrix
}


function A3-Matrix($matrix1, $matrix2) {
    param (
        $matrix1,
        $matrix2
    )
    if ($matrix1.Count -ne $matrix2.Count) {
        throw "Matrices must have the same number of rows."
    }
    if ($matrix1[0].Count -ne $matrix2[0].Count) {
        throw "Matrices must have the same number of columns."
    }
    $result = New-Object PSObject -Property @{ }
    for ($i = 0; $i -lt $matrix1.Count; $i++) {
        $row = New-Object PSObject -Property @{ }
        for ($j = 0; $j -lt $matrix1[0].Count; $j++) {
            $value = $matrix1[$i].Element_$i_$j + $matrix2[$i].Element_$i_$j
            $row | Add-Member -MemberType NoteProperty -Name "Element_$i_$j" -Value $value
        }
        $result | Add-Member -MemberType NoteProperty -Name "Row_$i" -Value $row
    }
    $result
}


function A4-Matrix($matrix, [Parameter(Mandatory=$true)] [int]$index) {
    param (
        $matrix,
        $index
    )
    if ($index -lt 0 -or $index -ge $matrix.Count) {
        throw "Index must be a positive integer less than the number of rows."
    }
    $result = New-Object PSObject -Property @{ }
    for ($j = 0; $j -lt $matrix[0].Count; $j++) {
        $row = New-Object PSObject -Property @{ }
        for ($i = 0; $i -lt $matrix.Count; $i++) {
            $value = if ($i -eq $index) {
                $matrix[$i].Element_$i_$j * -1
                } else {
                $matrix[$i].Element_$i_$j
                }
                $row | Add-Member -MemberType NoteProperty -Name "Element_$i_$j" -Value $value
        }
        $result | Add-Member -MemberType NoteProperty -Name "Row_$i" -Value $row
    }
    $result
}


function A5-Matrix($matrix) {
    param (
        $matrix
    )
    $sum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        for ($j = 0; $j -lt $matrix[0].Count; $j++) {
            $sum += $matrix[$i].Element_$i_$j
        }
    }
    $sum
}


function A6-Matrix($matrix) {
    param (
        $matrix
    )
    $product = 1
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        for ($j = 0; $j -lt $matrix[0].Count; $j++) {
            $product *= $matrix[$i].Element_$i_$j
        }
    }
    $product
}


function A7-Matrix($matrix) {
    param (
        $matrix
    )
    $sum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        $sum += $matrix[$i].Element_$i_$i
    }
    $sum
}


function A8-Matrix($matrix) {
    param (
        $matrix
    )
    $sum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        $sum += $matrix[$i].Element_$i_($matrix[0].Count - 1 - $i)
    }
    $sum
}


function A9-Matrix($matrix) {
    param (
        $matrix
    )
    $sum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        for ($j = 0; $j -lt $matrix[0].Count; $j++) {
            if ($i % 2 -eq 0 -and $j % 2 -eq 0) {
                $sum += $matrix[$i].Element_$i_$j
            }
            if ($i % 2 -eq 1 -and $j % 2 -eq 1) {
                $sum -= $matrix[$i].Element_$i_$j
                }
        }

        if ($i % 2 -eq 0) {
            $sum *= -1
        }
    }
    $sum
}


function A10-Matrix($matrix) {
    param (
        $matrix
    )
    $sum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        for ($j = 0; $j -lt $matrix[0].Count; $j++) {
            if ($i % 2 -eq 0 -and $j % 2 -eq 0) {
                $sum += $matrix[$i].Element_$i_$j
            }
            if ($i % 2 -eq 1 -and $j % 2 -eq 1) {
                $sum -= $matrix[$i].Element_$i_$j
                }
        }
        if ($i % 2 -eq 1) {
            $sum *= -1
        }
    }
    $sum
}

# Example usage
$matrix1 = A2-Matrix 3 123
$matrix2 = A2-Matrix 3 456
$result = A3-Matrix $matrix1 $matrix2
$result

$matrix = A2-Matrix 4 789
$index = 2
$result = A4-Matrix $matrix $index
$result

$matrix = A2-Matrix 4 123
$sum = A5-Matrix $matrix
$sum

$matrix = A2-Matrix 4 123
$product = A6-Matrix $matrix
$product

$matrix = A2-Matrix 4 123
$sum = A7-Matrix $matrix
$sum

$matrix = A2-Matrix 4 123
$sum = A8-Matrix $matrix
$sum

$matrix = A2-Matrix 4 123
$sum = A9-Matrix $matrix
$sum

$matrix = A2-Matrix 4 123
$sum = A10-Matrix $matrix
$sum

[System.DateTime]::AddHours

        -12
        -11
        -10
        -9
        -8
        -7
        -6
        -5
        -4
        -3
        -2
        -1
        0
        1
        2
        3
        4
        5
        6
        7
        8
        9
        10
        11
        12
        13
        14
        15
        16
        17
        18
        19
        20
        21
        22
        23
        24
        25
        26
        27
        28
        29
        30
        31
        1
        2
        3
        4
        5
        6
        7
        8
        9
        10
        11
        12
        13
        14
        15
        16
        17
        18
        19
        20
        21
        22
        23
        24
        25
        26
        27
        28
        29
        30
        31
        32
        33
        34
        35
        36
        37
        38
        39
        40
        41
        42
        43
        44
        45
        46
        47
        48
        49
        50
        51
        52
        53
        54
        55
        56
        57
        58
        59
        60
        61
        62
        63
        64
        65
        66
        67
        68
        69
        70
        71
        72
        73
        74
        75
        76
        77
        78
        79
        80
        81
        82
        83
        84
        85
        86
        87
        88
        89
        90
        91
        92
        93
        94
        95
        96
        97
        98
        99
        100
        101
        102
        103
        104
        105
        106
        107
        108
        109
        110
        111
        112
        113
        114
        115
        116
        117
        118
        119
        120
        121
        122
        123
        124
        125
        126
        127
        128
        129
        130
        131
        132
        133
        134
        135
        136
        137
        138
        139
        140
        141
        142
        143
        144
        145
        146
        147
        148
        149
        150
        151
        152
        153
        154
        155
        156
        157
        158
        159
        160
        161
        162
        163
        164
        165
        166
        167
        168
        169
        170
        171
        172
        173
        174
        175
        176
        177
        178
        179
        180
        181
        182
        183
        184
        185
        186
        187
        188
        189
        190
        191
        192
        193
        194
        195
        196
        197
        198
        199
        200
        201
        