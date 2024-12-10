#!/home/admin/app/PowerShell/Members

# The Child Folder to Search For Members Files (Replace with your actual folder path)
Get-ChildItem -Path /home/admin | Select-Object Name, CreationTime, Length

# Function to check if a member has a specific file
function CheckMemberFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MemberName,
        [Parameter(Mandatory=$true)]
        [string]$FileName
    )

    $memberPath = Join-Path -Path C:\MyFolder -ChildPath $MemberName
    Test-Path -Path $memberPath -PathType Container | Out-Null
    if ($?) {
        Test-Path -Path (Join-Path -Path $memberPath -ChildPath $FileName) -PathType Leaf | Out-Null
    } else {
        $false
    }
    return $true
}

# Function to check if a member has a specific folder
function CheckMemberFolder {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MemberName,
        [Parameter(Mandatory=$true)]
        [string]$FolderName
    )

    $memberPath = Join-Path -Path C:\MyFolder -ChildPath $MemberName
    Test-Path -Path $memberPath -PathType Container | Out-Null
    if ($?) {
        Test-Path -Path (Join-Path -Path $memberPath -ChildPath $FolderName) -PathType Container | Out-Null
    } else {
        $false
    }
    return $true
}

# Function to check if a member has a specific file or folder
function CheckMemberFileOrFolder {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MemberName,
        [Parameter(Mandatory=$true)]
        [string]$FileNameOrFolderName
    )
    $memberPath = Join-Path -Path C:\MyFolder -ChildPath $MemberName
    Test-Path -Path $memberPath -PathType Container | Out-Null
    if ($?) {
        Test-Path -Path (Join-Path -Path $memberPath -ChildPath $FileNameOrFolderName) -PathType Container, Leaf | Out-Null
        if ($?) {
            return $true
        } else {
            Test-Path -Path (Join-Path -Path $memberPath -ChildPath $FileNameOrFolderName) -PathType Leaf | Out-Null
        }
        return $true
        } else {
        return $false
    }
    return $true
}

# Example usage
Check-MemberFile "John Doe" "Resume.pdf"
Check-MemberFolder "Jane Smith" "Documents"
Check-MemberFileOrFolder "David Johnson" "Work"
