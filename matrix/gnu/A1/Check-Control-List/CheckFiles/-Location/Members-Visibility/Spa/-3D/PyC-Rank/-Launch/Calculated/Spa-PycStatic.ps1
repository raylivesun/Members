#!/home/admin/app/PowerShell/Members

# Spa Pyc Static File Server Configuration
$SPAPYC_STATIC_SERVER_HOST="0.0.0.0"
$SPAPYC_STATIC_SERVER_PORT="8080"
$SPAPYC_STATIC_SERVER_ROOT="/var/www/html"

# List of directories to watch for changes
$directoriesToWatch = @("/var/www/html/site1", "/var/www/html/site2")
Write-Debug "Directories to watch: $directoriesToWatch"
# List of directories to exclude from watching (e.g., temporary files)
$directoriesToExclude = @("/var/www/html/site1/tmp", "/var/www/html/site2/tmp")
Write-Debug "Directories to exclude: $directoriesToExclude"

# Check if the required PowerShell modules are installed
if (!(Get-Module -List | Where-Object Name -EQ "SpaCy")) {
    Write-Error "SpaCy module is not installed. Please install it using 'Install-Module SpaCy -Scope CurrentUser'."
    exit 1
}

# Check if the required Python packages are installed
if (!(Get-Package -Name "flask" -ListAvailable)) {
    Write-Error "Flask package is not installed. Please install it using 'pip install flask'."
    exit 1
}

# Start the SpaPyc Static File Server
Start-Process -FilePath "python" -ArgumentList "-m spacy serve --host $SPAPYC_STATIC_SERVER_HOST --port $SPAPYC_STATIC_SERVER_PORT --no-browser $SPAPYC_STATIC_SERVER_ROOT" -No

# Start the file watcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $SPAPYC_STATIC_SERVER_ROOT
$watcher.IncludeSubdirectories = $true
$watcher.NotifyFilter = [System.IO.NotifyFilters]'LastWrite'

$watcher.Changed.Add({
    param($send, $e)
    if ($e.FullPath -notin $directoriesToExclude) {
        Write-Host "File changed: $($e.FullPath)"
        Restart-SpaCyStaticFileServer
    }
    $watcher.EnableRaisingEvents = $false
})

$send = New-Object System.Object
$e = New-Object System.IO.FileSystemEventArgs("Changed", $SPAPYC_STATIC_SERVER_ROOT, "", "")
$watcher.Changed.Invoke($send, $e)

$watcher.Dispose()

function Restart-SpaCyStaticFileServer() {
    Write-Host "Restarting SpaPyc Static File Server..."
    Stop-Process -Id (Get-Process -Name python -Path "python" -ErrorAction SilentlyContinue).Id
    Start-Process -FilePath "python" -ArgumentList "-m spacy serve --host $SPAPYC_STATIC_SERVER_HOST --port $SPAPYC_STATIC_SERVER"
    PORT --no-browser $SPAPYC_STATIC_SERVER_ROOT" -No"
}

$send = New-Object System.Object
Write-Debug "File watcher started: $($watcher.Path)"
Wait-Debugger "Press Enter to stop the file watcher."
$watcher.Dispose()
Wait-Event $send