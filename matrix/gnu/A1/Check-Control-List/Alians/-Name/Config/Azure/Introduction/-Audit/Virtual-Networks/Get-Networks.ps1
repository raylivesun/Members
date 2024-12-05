#!/home/admin/app/PowerShell/Members

# Alians Get command to get members from Active Directory
Get-ADUser -Filter {Enabled -eq $true -and (ObjectClass -eq "user" -or ObjectClass -eq "computer")} |
    Select-Object Name, @{n='Description'; e={$_.Description}}, MemberOf |
    Format-Table -AutoSize

    # Get-ADGroup cmdlet to get all groups in Active Directory
    Get-ADGroup |
    Select-Object Name, Description |
    Format-Table -AutoSize

    # Get-ADComputer cmdlet to get all computers in Active Directory
    Get-ADComputer |
    Select-Object Name, @{n='Description'; e={$_.Description}}, OperatingSystem |
    Format-Table -AutoSize

    # Get-ADServicePrincipalName cmdlet to get service principal names of Active Directory objects
    Get-ADServicePrincipalName |
    Select-Object Name, @{n='Description'; e={$_.Description}}, ServicePrincipalNames |
    Format-Table -AutoSize

    # Get-ADObject cmdlet to get objects from Active Directory by their GUID
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -SearchBase "OU=Groups,DC=example,DC=com" -Identity 50084567-89ab-cdef-0
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -SearchBase "OU=Groups,DC=example,DC=com"

    # Get-ADObject cmdlet to get objects from Active Directory by their distinguished name
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -SearchBase "OU=Groups,DC=example,DC=com" -Identity "CN=Some Group,OU=Groups,DC=example,DC=com"
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -SearchBase "OU=Groups,DC=example,DC=com"
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -Identity "CN=Some Computer,OU=Computers,DC=
    example,DC=com"
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -SearchBase "OU=Computers,DC=example,DC="com""
    Get-ADObject -Filter {ObjectClass -eq "group" -or ObjectClass -eq "computer"} -Identity './-Authoring' ./Config ./packages.ps1 CN=Some Service Principal,CN=Services,DC=example
    

    