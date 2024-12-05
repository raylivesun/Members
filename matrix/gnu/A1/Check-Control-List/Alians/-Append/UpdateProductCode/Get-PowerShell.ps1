#!/home/admmin/app/PowerShell/Members

Function Save-PowerShell() {
    Param(
      [string] $Name
    )
    New-Item -ItemType File -Path ./Tomato.txt -Value $Name -Force
 }