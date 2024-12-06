#!/home/admin/app/PowerShell/Members

# Get Buffer from Base64 encoded string
$buffer = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('Your_Base64_Encoded_Buffer'))

# Create a new PowerShell process
$process = New-Object System.Diagnostics.Process
$process.StartInfo.FileName = 'powershell.exe'
$process.StartInfo.RedirectStandardInput = $true
$process.StartInfo.RedirectStandardOutput = $true
$process.StartInfo.UseShellExecute = $false
$process.Start()

# Send PowerShell commands to the process
$process.StandardInput.WriteLine("$buffer | iex")
$process.StandardInput.Flush()
$process.StandardInput.Close()

# Read the output of PowerShell
$output = $process.StandardOutput.ReadToEnd()

# Close the PowerShell process
$process.WaitForExit()
$process.Close()

# Print the output
Write-Host $output

@"
Simple
Multiline string
with "quotes"
"@
