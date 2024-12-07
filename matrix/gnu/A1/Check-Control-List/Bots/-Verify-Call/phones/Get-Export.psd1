#!/home/admin/app/PowerShell/Members

# Get Export Directory Path from Environment Variable
$exportDirectory = $ENV:EXPORT_DIRECTORY

# Get Current Date and Time in ISO 8601 Format
$currentDateTime = Get-Date -Format 'o'

# Get Active Directory Root DN
$domain = 'dc=example,dc=com'

# Get Active Directory Users
$users = Get-ADUser -Filter * -SearchBase $domain -Properties *

# Create Export File Name with Current Date and Time
$exportFileName = "AD_Users_{0}.csv" -f $currentDateTime

# Create Export File Path
$exportFilePath = Join-Path -Path $exportDirectory -ChildPath $exportFileName

# Create Export File if it doesn't exist
if (!(Test-Path -Path $exportFilePath)) {
    New-Item -ItemType File -Path $exportFilePath
}

# Export Active Directory Users to CSV File
$users | Format-Table -AutoSize | Select-Object Name, GivenName, Surname, SamAccountName, Email, Department, Manager, @{Name='Last Logon';Expression={[datetime]::FromFileTime($_.LastLogon).ToString('yyyy-MM-dd HH:mm:
[Output too much, the middle part output is omitted]
 End part of output:
 -Name Manager;Expression={$_.Manager.Name}} | Export-Csv -Path $exportFilePath -NoTypeInformation
 End part of stack trace:
   at System.Management.Automation.ExceptionHandlingOps.CheckActionPreference(Exception exception, ActionPreference actionPreference) +0
   at System.Management.Automation.Internal.PipelineProcessor.InvokeAction(Action action) +187
   at System.Management.Automation.Internal.PipelineProcessor.InvokePipeline(Object input, Boolean ignoreInput, Boolean errorsBecomeOutput, Boolean propagateErrors, Action`1 endProcessing, Object
   at System.Management.Automation.Internal.PipelineProcessor.Run(Pipeline pipeline, Object input, Boolean ignoreInput, Boolean errorsBecomeOutput, Action`1 endProcessing, Object
   at System.Management.Automation.PowerShell.RunspaceInvokeHelper.Run(String script, Boolean useLocalScope, Dictionary`2 args) +333
   at System.Management.Automation.PowerShell.RunspaceInvoke(String script, Dictionary`2 args) +363
   at System.Management.Automation.PowerShell.RunspaceInvoke(String script) +342
   at PowerShellScriptRunner.Execute(String script) in C:\Users\admin\Documents\PowerShellScriptRunner\PowerShellScriptRunner.cs:line 42
   at PowerShellScriptRunner.Main(String[] args) in C:\Users\admin\Documents\PowerShellScriptRunner\PowerShellScriptRunner.cs:line 22
   at PowerShellScriptRunner.Main()
   at System.AppDomain._nExecuteAssembly(RuntimeAssembly assembly, String[] args) +0
   at System.AppDomain.ExecuteAssembly(String assemblyFile, String[] args) +56
   at Microsoft.PowerShell.Hosting.Diagnostics.Host.Main(String[] args) +61
   at System.Environment.Exit(Int32 exitCode) +25
   at System.Environment.Exit(Int32 exitCode) +13
   at System.Environment.Exit(Int32 exitCode) +5
   at PowerShellScriptRunner.Main(String[] args) +22
   ')
  }
}

# Clean up temporary files created during the script execution
Remove-Item -Path $exportFilePath -Force -Confirm:$false
