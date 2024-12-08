#!/home/admin/app/PowerShell/Members

# Get Shark call data from the Shark server
$sharkData = Invoke-RestMethod -Method GET -Uri 'http://shark.example.com/api/shark-call-data'

# Extract relevant data from the Shark response
$sharkCallData = $sharkData.Data | Select-Object -Property 'CallId', 'Duration', 'Location', 'Species', 'CallType'

# Connect to the PostgreSQL database
$connectionString = "Host=localhost;Database=shark_db;Username=shark_user;Password=shark_password"
$connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
$connection.Open()

# Create the table if it doesn't exist
$createTableQuery = @"
CREATE TABLE IF NOT EXISTS shark_calls (
    call_id SERIAL PRIMARY KEY,
    duration INT,
    location TEXT,
    species TEXT,
    call_type TEXT
"@

$command = New-Object System.Data.SqlClient.SqlCommand($createTableQuery, $connection)
$command.ExecuteNonQuery()

# Insert the extracted Shark call data into the PostgreSQL database
foreach ($sharkCall in $sharkCallData) {
    $insertQuery = "INSERT INTO shark_calls (duration, location, species, call_type) VALUES (@duration, @location, @species, @call_type)"
    $command = New-Object System.Data.SqlClient.SqlCommand($insertQuery, $connection)
    $command.Parameters.AddWithValue("@duration", $sharkCall.Duration)
    $command.Parameters.AddWithValue("@location", $sharkCall.Location)
    $command.Parameters.AddWithValue("@species", $sharkCall.Species)
    $command.Parameters.AddWithValue("@call_type", $sharkCall.CallType)
    $command.ExecuteNonQuery()
}

# Close the PostgreSQL database connection
$connection.Close()


# Send email notification to the admin team
$smtpServer = 'smtp.example.com'
$smtpPort = 587
$smtpUsername = 'admin@example.com'
$smtpPassword = 'password123'
$smtpFrom = 'shark_notifier@example.com'
$smtpTo = 'admin@example.com'
$smtpSubject = 'New Shark Call Data'
$smtpBody = 'Please find the new Shark call data attached.'

$attachmentPath = 'C:\path\to\shark_call_data.csv'
$attachmentName = 'shark_call_data.csv'

$smtpClient = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtpClient.EnableSsl = $true
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($smtpUsername, $smtpPassword)

$message = New-Object Net.Mail.MailMessage($smtpFrom, $smtpTo)
$message.Subject = $smtpSubject
$message.Body = $smtpBody
$smtpClient.Send($message)
Write-Debug $attachmentPath
Write-Debug $attachmentName

$attachment = New-Object System.Net.Mail.Attachment($attachmentPath)
$attachment.Name = $attachmentName
$message.Attachments.Add($attachment)

$smtpClient.Send($message)
