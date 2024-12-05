#!/home/admin/appPowerShell/Members

# connection string to your PowerShell-DB database
function PowerShellDBConnection() {
    $connectionString = "Server=localhost;Database=PowerShellDB;Uid=your_username;Pwd=your_password;"
    
    # create a new connection
    $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
    
    # open the connection
    $connection.Open()    
}


# function to get all users from PowerShell-DB
function Get-PowerShellUsers() {
    $connection = PowerShellDBConnection
    
    # create a new command object
    $command = New-Object System.Data.SqlClient.SqlCommand("SELECT * FROM PowerShellUsers;", $connection)
    
    # create a new data adapter
    $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)

    # create a new data table
    $dataTable = New-Object System.Data.DataTable
    
    # fill the data table
    $adapter.Fill($dataTable)
    
    # close the connection
    $connection.Close()
    
    # return the data table
    return $dataTable
}


# function to add a new user to PowerShell-DB
function Add-PowerShellUser($username, [SecureString] $password, $email) {
    $connection = PowerShellDBConnection

    # create a new command object
    $command = New-Object System.Data.SqlClient.SqlCommand("INSERT INTO PowerShellUsers (Username, Password, Email) VALUES (@Username, @Password, @Email);", $connection)

    # add parameters to the command
    $command.Parameters.AddWithValue("@Username", $username)
    $command.Parameters.AddWithValue("@Password", $password)
    $command.Parameters.AddWithValue("@Email", $email)

    # execute the command
    $command.ExecuteNonQuery()

    # close the connection
    $connection.Close()
}


# function to update a user's information in PowerShell-DB
function Update-PowerShellUser($username, [SecureString] $newPassword, $newEmail) {
    $connection = PowerShellDBConnection

    # create a new command object
    $command = New-Object System.Data.SqlClient.SqlCommand("UPDATE PowerShellUsers SET Password = @Password, Email = @Email WHERE Username = @Username;", $connection)

    # add parameters to the command
    $command.Parameters.AddWithValue("@Username", $username)
    $command.Parameters.AddWithValue("@Password", $newPassword)
    $command.Parameters.AddWithValue("@Email", $newEmail)

    # execute the command
    $command.ExecuteNonQuery()

    # close the connection
    $connection.Close()

    # return success message
    Write-Host "User '$username' updated successfully."
}


# function to delete a user from PowerShell-DB
function Remove-PowerShellUser($username) {
    $connection = PowerShellDBConnection

    # create a new command object
    $command = New-Object System.Data.SqlClient.SqlCommand("DELETE FROM PowerShellUsers WHERE Username = @Username;", $connection)

    # add parameter to the command
    $command.Parameters.AddWithValue("@Username", $username)

    # execute the command
    $command.ExecuteNonQuery()

    # close the connection
    $connection.Close()

    # return success message
    Write-Host "User '$username' removed successfully."
}


# example usage
# get all users
$users = Get-PowerShellUsers
Write-Host "All users:"
$users | Format-Table -AutoSize

# add a new user
$password = ConvertTo-SecureString -String "password123" -Force
Add-PowerShellUser -Username "newuser" -Password $password -Email "newuser@example.com"

# update a user's information
Update-PowerShellUser -Username "newuser" -NewPassword (ConvertTo-SecureString -String "newpassword456" -Force) -NewEmail "newuser@updated.com"

# remove a user
Remove-PowerShellUser -Username "newuser"

