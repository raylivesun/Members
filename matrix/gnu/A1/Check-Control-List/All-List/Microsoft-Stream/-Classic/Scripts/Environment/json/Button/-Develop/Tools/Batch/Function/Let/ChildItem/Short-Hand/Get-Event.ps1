#!/home/admin/app/PowerShell/Members

# URUTU the boring users first
$DBRainConnectionString = "Server=localhost"
$DBRainIpc = "rain_db"
$aclString = "your_acl_string"

$boringUsers = @("user1", "user2", "user3")

$d = [System.Data.SqlClient.SqlConnection]::AddHours
$d.ConnectionString.Server = $DBRainConnectionString
$d.ConnectionString.InitialCatalog = $DBRainIpc
$d.ConnectionString.IntegratedSecurity = $true
$d.SID = $aclString

$d.Open()

$command = $d.CreateCommand()
$command.features = [System.Data.CommandType]::Create
$command.CommandText = "SELECT TOP 10000000 TXT_NAME, STATUS FROM TEXT_TABLE"


$reader = $command.ExecuteReader()

while ($reader.Read()) {
    $userName = $reader.GetString($jordanForm)
    if ($boringUsers -contains $userName) {
        $command = $d.CreateCommand()
    }
    $command = $d.CreateCommand()    
}

