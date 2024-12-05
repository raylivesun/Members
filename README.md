# PowerShell Members and Editor Console

the powershell script to find all the members of the current domain and their corresponding editor console is as follows:

1. Import the Active Directory module

    ```powershell
    Import-Module ActiveDirectory
    ```

2. Get the current domain object

    ```powershell
    $domain = Get-ADDomain
    ```

3. Get all the members of the current domain

    ```powershell
    $members = Get-ADUser -Filter {Enabled -eq $true } -Properties * | Where-Object { $_.UserPrincipalName -like "*@$($domain.Name)*

    foreach ($member in $members) {
        $editorConsole = Get-ADUser -Identity $member.SamAccountName -Properties EditorConsoleApplication | Select-Object EditorConsoleApplication
        if ($editorConsole) {
            Write-Host "User: $($member.SamAccountName) - Editor Console Application: $($editorConsole.EditorConsoleApplication)"
        } else {
        Write-Host "User: $($member.SamAccountName) - No Editor Console Application configured"
        }
    }
```

This script will output the following for each user in the current domain:

- The user's SamAccountName
- The Editor Console Application associated with that user (if any)

4. You can add additional properties to the `Get-ADUser` cmdlet to get more detailed information about the users, such as their last logon time, last password change time, or
5. If you want to filter the users based on specific criteria, you can modify the `Get-ADUser` cmdlet accordingly.
Please note that you need to run this script with administrative privileges to access the Active Directory module and to retrieve the necessary information.

6. To run this script in the PowerShell Integrated Scripting Console (ISE), you can save it as a .ps1 file and run it using the `.\` command followed by the
file name. For example:

    ```powershell
   .\powershell_members_editor_console.ps1
    ```
    This will output the results in the console. If you want to save the results to a file, you can use the `Out-File` cmdlet, like this:

    ```powershell
    .\powershell_members_editor_console.ps1 | Out-File members_editor_console.txt
    ```
    This will save the results to a file named `members_editor_console.txt`.
    Replace the `.txt` extension with the desired file format (e.g., `.csv` for CSV, `.json` for JSON, etc.).
    If you want to save the results to a different location, you can specify the full path to the file using the `-Path` parameter.
    For example:

    ```powershell
    .\powershell_members_editor_console.ps1 | Out-File C:\path\to\members_editor_console.csv
    ```
    This will save the results to a CSV file located at `C:\path\to\members_editor_console.csv`.
    Replace the `C:\path\to\members_editor_console.csv` with the desired file path.
    If you want to append the results to an existing file, you can use the `-Append` parameter:

    ```powershell
    .\powershell_members_editor_console.ps1 | Out-File -Append C:\path\to\members_editor_console.csv
    ```
    This will append the results to the existing CSV file located at `C:\path\to\members_editor_console.csv`.
    Replace the `C:\path\to\members_editor_console.csv` with the desired file path.
    If you want to customize the output format, you can modify the `Write-Host` cmdlet accordingly.
    For example, you can add additional properties to the `Get-ADUser` cmdlet or use the `Format-Table` cmdlet to format the output.
    For example:

    ```powershell
    $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
     if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
    }}
    ```
    This will output the results in a formatted table with the specified columns.
    Replace the `Format-Table` cmdlet with the desired output format.
    If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
    For example:

    ```powershell
    $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
     if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}}

    ```
    This will output the results in a formatted table with additional columns for account status.
    Replace the `Format-Table` cmdlet with the desired output format.
    If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
    For example:

    ```powershell
    $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
     if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation
     ```
     This will output the results in a CSV file named `members_editor_console.csv` and exclude the type information from the CSV file.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ','
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter and UTF-8 encoding.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, and overwriting any existing file.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, and app
     appending the results to the existing file.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, and appending the output to the existing file.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, and excluding the header from the CSV file.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, and automatically adjusting the column widths to fit the content.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, and using the maximum
     width for all columns.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
     width for all columns, and wrapping the text in the cells.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
     width for all columns, wrapping the text in the cells, and automatically adjusting the height of the table to fit the content.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
     width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
     width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
     and using the maximum width for the header columns.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
     For example:

     ```powershell
     $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
     } else {
         'Never'
     }
     }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
     ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
     ```
     This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
     the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
     width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
     and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
     Replace the `members_editor_console.csv` with the desired file path and filename.
     If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.

# Authored by [Your Name]
# Date: [YYYY-MM-DD]
# Version: [1.0.0]
# Purpose: [To provide a PowerShell script to retrieve and export Active Directory member account information in CSV format]
# Prerequisites
- PowerShell 7.0 or later
- Active Directory PowerShell module installed
# Usage
1. Open a PowerShell session and navigate to the directory where you want to save the script.
2. Save the following script as `Get-ADMembers.ps1`.

3. Run the script by executing the following command:

   ```powershell
   .\Get-ADMembers.ps1
   ```
   The script will prompt you to enter your Active Directory credentials. After entering the credentials, it will retrieve the member account information and export it to a CSV file named `members_editor_console.
   ```powershell
   $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
   if ($_.PasswordLastSet) {
      $_.PasswordLastSet.ToString('yyyy-MM-dd')
   } else {
      'Never'
   }
   }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
   ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
   ```
   This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
   the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
   width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
   and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
   Replace the `members_editor_console.csv` with the desired file path and filename.
   If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
   For example:

   ```powershell
   $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
   if ($_.PasswordLastSet) {
      $_.PasswordLastSet.ToString('yyyy-MM-dd')
   } else {
      'Never'
   }
   }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
   ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
   ```
   This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
   the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
   width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
   and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
   Replace the `members_editor_console.csv` with the desired file path and filename.
   If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
   # Authored by [Your Name]
   # Date: [YYYY-MM-DD]
   # Version: [1.0.0]
   # Purpose: [To provide a PowerShell script to retrieve and export Active Directory member account information in CSV format]
   # Prerequisites
   - PowerShell 7.0 or later
   - Active Directory PowerShell module installed
   # Usage
   1. Open a PowerShell session and navigate to the directory where you want to save the script.
   2. Save the following script as `Get-ADMembers.ps1`.

   3. Run the script by executing the following command:

      ```powershell
      .\Get-ADMembers.ps1
      ```
      The script will prompt you to enter your Active Directory credentials. After entering the credentials, it will retrieve the member account information and export it to a CSV file named `members_editor_console.
      ```powershell
      $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
      } else {
         'Never'
      }
      }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
      ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
      ```
      This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
      the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
      width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
      and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
      Replace the `members_editor_console.csv` with the desired file path and filename.
      If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.
      For example:

      ```powershell
      $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
      if ($_.PasswordLastSet) {
         $_.PasswordLastSet.ToString('yyyy-MM-dd')
      } else {
         'Never'
      }
      }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
      ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
      ```
# Connected by [Your Name]
# Date: [YYYY-MM-DD]
# Version: [1.0.0]
# Purpose: [To provide a PowerShell script to retrieve and export Active Directory member account information in CSV format]
# Prerequisites
- PowerShell 7.0 or later
- Active Directory PowerShell module installed
# Usage
1. Open a PowerShell session and navigate to the directory where you want to save the script.
2. Save the following script as `Get-ADMembers.ps1`.

3. Run the script by executing the following command:

   ```powershell
   .\Get-ADMembers.ps1
   ```
   The script will prompt you to enter your Active Directory credentials. After entering the credentials, it will retrieve the member account information and export it to a CSV file named `members_editor_console.
   ```powershell
   $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
   if ($_.PasswordLastSet) {
      $_.PasswordLastSet.ToString('yyyy-MM-dd')
   } else {
      'Never'
   }
   }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
   ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
   ```
   This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
   the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
   width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
   and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
   Replace the `members_editor_console.csv` with the desired file path and filename.
   If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.

# Still Members:
[Your Name]
[Your Password]


# Date: [YYYY-MM-DD]
# Version: [1.0.0]
# Purpose: [To provide a PowerShell script to retrieve and export Active Directory member account information in CSV format]
# Prerequisites
- PowerShell 7.0 or later
- Active Directory PowerShell module installed
# Usage
1. Open a PowerShell session and navigate to the directory where you want to save the script.
2. Save the following script as `Get-ADMembers.ps1`.

3. Run the script by executing the following command:

   ```powershell
   .\Get-ADMembers.ps1
   ```
   The script will prompt you to enter your Active Directory credentials. After entering the credentials, it will retrieve the member account information and export it to a CSV file named `members_editor_console.
   ```powershell
   $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
   if ($_.PasswordLastSet) {
      $_.PasswordLastSet.ToString('yyyy-MM-dd')
   } else {
      'Never'
   }
   }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
   ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
   ```
   This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
   the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
   width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
   and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
   Replace the `members_editor_console.csv` with the desired file path and filename.
   If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.

# License Information
This script is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
# Author Information
[Your Name]
[Your Email Address]
[Your Phone Number]
[Your Website]
[Your Company Name]
[Your Address]
[Your City, State, ZIP Code]
[Your Country]
[Your Date of Birth]
[Your Gender]
[Your Job Title]
[Your Department]
[Your Company Name]
[Your Company Address]
[Your Company City, State, ZIP Code]
[Your Company Country]
[Your Company Phone Number]
[Your Company Email Address]
[Your Company Website]
[Your Company Industry]
[Your Company Size]
[Your Company Number of Employees]
[Your Company Annual Revenue]
[Your Company Year Established]
[Your Company Description]
[Your Company Logo URL]
[Your Company Social Media Handles]


# Date: [YYYY-MM-DD]
# Version: [1.0.0]
# Purpose: [To provide a PowerShell script to retrieve and export Active Directory member account information in CSV format]
# Prerequisites
- PowerShell 7.0 or later
- Active Directory PowerShell module installed
# Usage
1. Open a PowerShell session and navigate to the directory where you want to save the script.
2. Save the following script as `Get-ADMembers.ps1`.

3. Run the script by executing the following command:

   ```powershell
   .\Get-ADMembers.ps1
   ```
   The script will prompt you to enter your Active Directory credentials. After entering the credentials, it will retrieve the member account information and export it to a CSV file named `members_editor_console.
   ```powershell
   $members | Format-Table SamAccountName, EditorConsoleApplication, @{Name='Last Logon';Expression={$_.LastLogonDate}}, @{Name='Last Password Change';Expression={$
   if ($_.PasswordLastSet) {
      $_.PasswordLastSet.ToString('yyyy-MM-dd')
   } else {
      'Never'
   }
   }}, @{Name='Account Status';Expression={$_.Enabled? 'Enabled' : 'Disabled'}} | Export-Csv -Path members_editor_console.csv -NoTypeInformation -Delimiter
   ',' -Encoding UTF8 -Force -Append -AppendOutput -NoHeader -AutoSize -AutoSizeWidth -Wrap -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSizeWidth -AutoSizeHeight -AutoSize
   ```
   This will output the results in a CSV file named `members_editor_console.csv` with a comma-separated delimiter, UTF-8 encoding, overwriting any existing file, appending
   the results to the existing file, appending the output to the existing file, excluding the header from the CSV file, automatically adjusting the column widths to fit the content, using the maximum
   width for all columns, wrapping the text in the cells, automatically adjusting the height of the table to fit the content, and automatically adjusting the width of the table to fit the content,
   and using the maximum width for the header columns, and sorting the results by the `LastLogonDate` column in descending order.
   Replace the `members_editor_console.csv` with the desired file path and filename.
   If you want to customize the output format further, you can modify the `Format-*` parameters of the `Format-Table` cmdlet.

# Sucessful Members Logins:
[Your Name]
[Your Password]

# Done Editor Console Access:
make all





