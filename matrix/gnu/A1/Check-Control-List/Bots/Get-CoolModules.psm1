#!/home/admin/appPowerShell/Members

#  Get Cool Modules from PowerShell Gallery and store them in a variable
$coolModules = Get-Module -Name 'PSDrive.PSGallery' -ListAvailable | Where-Object { $_.Version -match '^\d+\.\d+\.\d+' } | Select-Object Name, Version

#  Get the PowerShell Gallery URL
$galleryUrl = 'https://www.powershellgallery.com/api/v2/'

#  Create a temporary directory to store downloaded modules
$tempDir = New-TemporaryDirectory

#  Download each module and save it to the temporary directory
foreach ($module in $coolModules) {
    $downloadUrl = "$galleryUrl/package/$($module.Name)/$($module.Version)"
    Invoke-WebRequest -Uri $downloadUrl -OutFile "$tempDir\$($module.Name).psd1"
}

#  Import each downloaded module
foreach ($moduleFile in (Get-ChildItem -Path $tempDir -Filter '*.psd1')) {
    Import-Module -Path $moduleFile.FullName
}

#  Remove the temporary directory
Remove-Item -Path $tempDir -Recurse
