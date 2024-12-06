#!/home/admin/app/PowerShell/Members

# Get Exec Hash tables from PSExec.exe and PsExec64.exe
# This will give us hashes of the currently running processes
# You can replace 'Get-Process' with any other process you want to get hashes for
$exec_hashes = Get-Process | Where-Object { $_.Modules.Name -like 'psexec*' } | ForEach-Object {
    $process_name = $_.ProcessName
    $process_id = $_.Id
    $module_name = $_.Modules.Name
    $module_path = $_.Modules.Path
    $module_base_name = [System.IO.Path]::GetFileNameWithoutExtension($module_path)
    $module_hash = (Get-FileHash -Path $module_path -Algorithm SHA256).Hash
    [PSCustomObject]@{
        ProcessName = $process_name
        ProcessID = $process_id
        ModuleName = $module_name
        ModulePath = $module_path
        ModuleBaseName = $module_base_name
        ModuleHash = $module_hash
    }
Write-Debug $exec_hashes | Format-Table -AutoSize
}


# Get Memory hashes from PSExec.exe and PsExec64.exe
# This will give us hashes of the currently running processes' memory
$memory_hashes = Get-Process | Where-Object { $_.Modules.Name -like 'psexec*' } | ForEach-Object {
    $process_name = $_.ProcessName
    $process_id = $_.Id
    $module_name = $_.Modules.Name
    $module_path = $_.Modules.Path
    $module_base_name = [System.IO.Path]::GetFileNameWithoutExtension($module_path)
    $module_hash = (Get-FileHash -Path $module_path -Algorithm SHA256).Hash
    $process_memory_hash = Get-ProcessMemory -Id $process_id | Get-ChecksumHash -Algorithm SHA256
    [PSCustomObject]@{
        ProcessName = $process_name
        ProcessID = $process_id
        ModuleName = $module_name
        ModulePath = $module_path
        ModuleBaseName = $module_base_name
        ModuleHash = $module_hash
        MemoryHash = $process_memory_hash
    }
    Write-Debug $memory_hashes | Format-Table -AutoSize
}


# Get Registry hashes from PSExec.exe and PsExec64.exe
# This will give us hashes of the currently running processes' registry
$registry_hashes = Get-Process | Where-Object { $_.Modules.Name -like 'psexec*' } | ForEach-Object {
    $process_name = $_.ProcessName
    $process_id = $_.Id
    $module_name = $_.Modules.Name
    $module_path = $_.Modules.Path
    $module_base_name = [System.IO.Path]::GetFileNameWithoutExtension($module_path)
    $module_hash = (Get-FileHash -Path $module_path -Algorithm SHA256).Hash
    $process_registry_hash = Get-ProcessRegistry -Id $process_id | Get-ChecksumHash -Algorithm SHA256
    [PSCustomObject]@{
        ProcessName = $process_name
        ProcessID = $process_id
        ModuleName = $module_name
        ModulePath = $module_path
        ModuleBaseName = $module_base_name
        ModuleHash = $module_hash
        RegistryHash = $process_registry_hash
    }
    Write-Debug $registry_hashes | Format-Table -AutoSize
}
