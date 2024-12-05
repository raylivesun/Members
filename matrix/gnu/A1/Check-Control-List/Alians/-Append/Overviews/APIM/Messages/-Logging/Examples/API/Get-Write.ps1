#!/home/admin/app/PowerShell/Members

# Alians Write Once, Run Everywhere (AORWE) principles
param (
  [Parameter(Mandatory=$true)]
  [string]$Server,

  [Parameter(Mandatory=$true)]
  [string]$Database,

  [Parameter(Mandatory=$true)]
  [string]$Username,

  [Parameter(Mandatory=$true)]
  [SecureString]$Password,

  [Parameter(Mandatory=$true)]
  [string]$FilePath,

  [Parameter(Mandatory=$true)]
  [string]$LogFilePath,

  [Parameter(Mandatory=$false)]
  [string]$ScriptName = 'BackupDatabase.ps1',

  [Parameter(Mandatory=$false)]
  [int]$BackupFrequency = 60,

  [Parameter(Mandatory=$false)]
  [int]$RetentionPeriod = 30
)

# Import the common functions module
Import-Module './CommonFunctions.ps1'

# Validate the server connection
Test-ServerConnection -Server $Server -Database $Database -Username $Username -Password $Password

# Backup the database
Backup-Database -Server $Server -Database $Database -Username $Username -Password $Password -FilePath $FilePath -LogFilePath $LogFilePath

# Schedule the backup job
Schedule-BackupJob -Server $Server -Database $Database -Username $Username -Password $Password -ScriptName $ScriptName -BackupFrequency $BackupFrequency -RetentionPeriod $RetentionPeriod


# Alians Write Once, Run Everywhere (AORWE) principles
param (
  [Parameter(Mandatory=$true)]
  [string]$Server,

  [Parameter(Mandatory=$true)]
  [string]$Database,
  
  [Parameter(Mandatory=$true)]
  [string]$Username,
  
  [Parameter(Mandatory=$true)]
  [string]$Password,
  
  [Parameter(Mandatory=$true)]
  [string]$FilePath,
  
  [Parameter(Mandatory=$true)]
  [string]$LogFilePath,

  [Parameter(Mandatory=$false)]
  [string]$ScriptName,
  
  [Parameter(Mandatory=$false)]
  [int]$BackupFrequency,
  
  [Parameter(Mandatory=$false)]
  [int]$RetentionPeriod = 30
)

# Import the common functions module
Import-Module './CommonFunctions.ps1'

# Validate the server connection
Test-ServerConnection -Server $Server -Database $Database -Username $Username -Password $Password

# Backup the database
Backup-Database -Server $Server -Database $Database -Username $Username -Password $Password -FilePath $FilePath -LogFilePath $LogFilePath

# Schedule the backup job
Schedule-BackupJob -Server $Server -Database $Database -Username $Username -Password $Password -ScriptName $ScriptName -BackupFrequency $BackupFrequency -RetentionPeriod $RetentionPeriod
