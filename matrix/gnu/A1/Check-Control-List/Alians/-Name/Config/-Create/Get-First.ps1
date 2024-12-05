#!/home/admin/app/PowerShell/Members

# Alians Configuration File (alians.txt)
$ALIAN_FILE = "/home/admin/app/PowerShell/alians.txt"

# Function to check if a user is an alias
function is_alias {
  grep -Fxq "$1" "$ALIAN_FILE"
}

# Read all aliases from the alians file
while (IFS= read -r alias_user) {
    # Check if the alias is a valid user
    if (getent passwd "$alias_user" /dev/null 2>&1){
        Write-Output "Alias user: $alias_user"
    else
        Write-Output "Alias user: $alias_user does not exist"
    }
}


# Function to check if a user is a member
function is_member {
  user_name="$1"
  group_name="$2"

  if (id -nG "$user_name" | grep -Fxq "$group_name") {
   Write-Output "User: $user_name is a member of group: $group_name"
  } else {
    Write-Output "User: $user_name is not a member of group: $group_name"
  }
}


# Read all groups from the groups file
while (IFS= read -r group_name) {
    # Check if the group exists
    if (getent group "$group_name" /dev/null 2>&1){
        Write-Output "Group: $group_name"
    } else {
        Write-Output "Group: $group_name does not exist"
    }
}

# Read all users from the users file
while (IFS= read -r user_name) {
    # Check if the user exists
    if (getent passwd "$user_name" /dev/null 2>&1){
        Write-Output "User: $user_name"
    } else {
        Write-Output "User: $user_name does not exist"
    }
}

# Check if a user is an alias
is_alias "admin"

# Check if a user is a member of a group
is_member "admin" "admins"
