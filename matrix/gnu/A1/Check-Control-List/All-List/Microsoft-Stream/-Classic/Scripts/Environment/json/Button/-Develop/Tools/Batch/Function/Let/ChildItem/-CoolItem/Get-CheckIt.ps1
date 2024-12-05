#!/home/admin/app/PowerShell/Members

# Update Stream Deck configuration file (com.github.SamuelWeigand.StreamDeckConfig.json)
# Replace placeholders with actual values
sed -i "s/STREAMDECK_HOST_IP/$STREAMDECK_HOST_IP/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeckConfig.json
sed -i "s/STREAMDECK_PORT/$STREAMDECK_PORT/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.
StreamDeckConfig.json
sed -i "s/DECK_ID/$DECK_ID/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeck
Config.json
sed -i "s/API_KEY/$API_KEY/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeckConfig.


# Update Stream Deck script (com.github.SamuelWeigand.StreamDeck.ps1)
# Replace placeholders with actual values
sed -i "s/STREAMDECK_HOST_IP/$STREAMDECK_HOST_IP/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeck.ps1
sed -i "s/STREAMDECK_PORT/$STREAMDECK_PORT/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.
StreamDeck.ps1
sed -i "s/DECK_ID/$DECK_ID/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeck
Config.ps1
sed -i "s/API_KEY/$API_KEY/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeckConfig.


# Update Stream Deck script (com.github.SamuelWeigand.StreamDeck.py)
# Replace placeholders with actual values
sed -i "s/STREAMDECK_HOST_IP/$STREAMDECK_HOST_IP/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeck.py
sed -i "s/STREAMDECK_PORT/$STREAMDECK_PORT/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.
StreamDeck.py
sed -i "s/DECK_ID/$DECK_ID/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeck
Config.py
sed -i "s/API_KEY/$API_KEY/" /home/admin/app/PowerShell/Members/com.github.SamuelWeigand.StreamDeckConfig.

-and # Logical and
-or # Logical or
-xor # Logical exclusive or
-not # Logical not
!
# Logical not


# Bitwise operators
& # Bitwise AND
| # Bitwise OR
^ # Bitwise XOR
~ # Bitwise NOT
<< # Bitwise left shift
>> # Bitwise right shift
>>> # Bitwise unsigned right shift

-eq # Equal to
-ne # Not equal to
-gt # Greater than
-ge # Greater than or equal to
-lt # Less than
-le # Less than or equal to

-a # File exists and is a regular file
-d # File exists and is a directory
-e # File exists
-f # File exists and is a regular file
-r # File exists and has read permission
-w # File exists and has write permission
-x # File exists and has execute permission
-s # File exists and has a size greater than zero
-N # File has been modified since it was last read

-o # File exists and is owned by the current user
-G # File exists and is owned by the current group
-L # File exists and is a symbolic link
-p # File exists and is a named pipe
-S # File exists and is a socket
-h # File exists and is a symbolic link (same as -L)
-t # File exists and is a terminal device

-b # File exists and is a block device
-c # File exists and is a character device
-u # File exists and has an SUID bit set
-k # File exists and has an SGID bit set
-O # File exists and is owned by the current user

-F # File exists and is a file (not a directory, symbolic link, etc.)

-ef # Two file descriptors refer to the same file

# File test operators
-nt # File is newer than the reference file
-ot # File is older than the reference file
-ef # Two file names refer to the same file
-cnewer # File is newer than the reference file or its contents have been changed
-colder # File is older than the reference file or its contents have been changed
-mnewer # File is newer than the reference file or its modification time has been changed
-omnewer # File is older than the reference file or its modification time has been changed
-size # File size is greater than, equal to, or less than a specified size

# File size comparison operators
b # Size in bytes
k # Size in kilobytes
M # Size in megabytes
G # Size in gigabytes

# String comparison operators
= # Equal to
!= # Not equal to
< # Less than
<= # Less than or equal to
> # Greater than
>= # Greater than or equal to

# Regular expression operators
=~ # Matches the string against a regular expression
!~ # Does not match the string against a regular expression


# File path operators
/ # Directory separator
./ # Current directory
../ # Parent directory
~ # User's home directory
~user # User's home directory

# Path manipulation operators
dirname # Get the directory name from a file path
basename # Get the file name from a file path
realpath # Get the absolute file path
mktemp # Create a temporary file path
mkdtemp # Create a temporary directory path

# Path manipulation functions
readlink -f # Get the absolute file path
realpath # Get the absolute file path
dirname # Get the directory name from a file path
basename # Get the file name from a file path

# File system operations
cp # Copy files and directories
mv # Move files and directories
rm # Remove files and directories
rmdir # Remove empty directories
ln -s # Create symbolic links
touch # Create empty files
mkdir # Create directories

# File system functions
stat # Get file system information
find # Search for files and directories
grep # Search for patterns in files
sed # Search and replace patterns in files
awk # Search and manipulate data in files

# File system comparison operators
-ef # Two file paths refer to the same file
-nt # File is newer than the reference file
-ot # File is older than the reference file
-size # File size is greater than, equal to, or less than a specified size

# File size comparison operators
b # Size in bytes
k # Size in kilobytes
M # Size in megabytes
G # Size in gigabytes

# File permissions
chmod # Change file permissions
chown # Change file ownership
chgrp # Change file group ownership

# File permissions functions
getfacl # Get file access control list (ACL)
setfacl # Set file access control list (ACL)
getfattr # Get file attributes
setfattr # Set file attributes

# File permissions comparison operators
-o # File exists and is owned by the current user
-G # File exists and is owned by the current group
-L # File exists and is a symbolic link
-p # File exists and is a named pipe
-S # File exists and is a socket
-h # File exists and is a symbolic link (same as -L)
-t # File exists and is a terminal device

-b # File exists and is a block device
-c # File exists and is a character device
-u # File exists and has an SUID bit set
-k # File exists and has an SGID bit set
-O # File exists and is owned by the current user

-F # File exists and is a file (not a directory, symbolic link, etc.)

-ef # Two file descriptors refer to the same file

# File test operators
-nt # File is newer than the reference file
-ot # File is older than the reference file
-ef # Two file names refer to the same file
-cnewer # File is newer than the reference file or its contents have been changed
-colder # File is older than the reference file or its contents have been changed
-mnewer # File is newer than the reference file or its modification time has been changed
-omnewer # File is older than the reference file or its modification time has been changed
-size # File size is greater than, equal to, or less than a specified size

# File size comparison operators
b # Size in bytes
k # Size in kilobytes
M # Size in megabytes
G # Size in gigabytes

# String comparison operators
= # Equal to
!= # Not equal to
< # Less than
<= # Less than or equal to
> # Greater than
>= # Greater than or equal to

# Regular expression operators
=~ # Matches the string against a regular expression
!~ # Does not match the string against a regular expression

# File path operators
/ # Directory separator
./ # Current directory
../ # Parent directory
~ # User's home directory
~user # User's home directory

# Path manipulation operators
dirname # Get the directory name from a file path
basename # Get the file name from a file path
realpath # Get the absolute file path
mktemp # Create a temporary file path
mkdtemp # Create a temporary directory path

# Path manipulation functions
readlink -f # Get the absolute file path
realpath # Get the absolute file path
dirname # Get the directory name from a file path
basename # Get the file name from a file path

# File system operations
cp # Copy files and directories
mv # Move files and directories
rm # Remove files and directories
rmdir # Remove empty directories
ln -s # Create symbolic links
touch # Create empty files
mkdir # Create directories

# File system functions
stat # Get file system information
find # Search for files and directories
grep # Search for patterns in files
sed # Search and replace patterns in files
awk # Search and manipulate data in files

# File system comparison operators
-ef # Two file paths refer to the same file
-nt # File is newer than the reference file
-ot # File is older than the reference file
-size # File size is greater than, equal to, or less than a specified size

# File size comparison operators
b # Size in bytes
k # Size in kilobytes
M # Size in megabytes
G # Size in gigabytes

# File permissions
chmod # Change file permissions
chown # Change file ownership
chgrp # Change file group ownership

# File permissions functions
getfacl # Get file access control list (ACL)
setfacl # Set file access control list (ACL)
getfattr # Get file attributes
setfattr # Set file attributes

# File permissions comparison operators
-o # File exists and is owned by the current user
-G # File exists and is owned by the current group
-L # File exists and is a symbolic link
-p # File exists and is a named pipe
-S # File exists and is a socket
-h # File exists and is a symbolic link (same as -L)
-t # File exists and is a terminal device

-b # File exists and is a block device
-c # File exists and is a character device
-u # File exists and has an SUID bit set
-k # File exists and has an SGID bit set
-O # File exists and is owned by the current user

-F # File exists and is a file (not a directory, symbolic link, etc.)

-ef # Two file descriptors refer to the same file

# File test operators
-nt # File is newer than the reference file
-ot # File is older than the reference file
-ef # Two file names refer to the same file
-cnewer # File is newer than the reference file or its contents have been changed
-colder # File is older than the reference file or its contents have been changed
-mnewer # File is newer than the reference file or its modification time has been changed
-omnewer # File is older than the reference file or its modification time has been changed
-size # File size is greater than, equal to, or less than a specified size

# File size comparison operators
b # Size in bytes
k # Size in kilobytes
M # Size in megabytes
G # Size in gigabytes

# String comparison operators
= # Equal to
!= # Not equal to
< # Less than
<= # Less than or equal to
> # Greater than
>= # Greater than or equal to

# Regular expression operators
=~ # Matches the string against a regular expression
!~ # Does not match the string against a regular expression

# File path operators
/ # Directory separator
./ # Current directory
../ # Parent directory
~ # User's home directory
~user # User's home directory

# Path manipulation operators
dirname # Get the directory name from a file path
basename # Get the file name from a file path
realpath # Get the absolute file path
mktemp # Create a temporary file path
mkdtemp # Create a temporary directory path

# Path manipulation functions
readlink -f # Get the absolute file path
realpath # Get the absolute file path
dirname # Get the directory name from a file path
basename # Get the file name from a file path

# File system operations
cp # Copy files and directories
mv # Move files and directories
rm # Remove files and directories
rmdir # Remove empty directories
ln -s # Create symbolic links
touch # Create empty files
mkdir # Create directories

# File system functions
stat # Get file system information
find # Search for files and directories
grep # Search for patterns in files
sed # Search and replace patterns in files
awk # Search and manipulate data in files

# File system comparison operators
-ef # Two file paths refer to the same file
-nt # File is newer than the reference file
-ot # File is older than the reference file
-size # File size is greater than, equal to, or less than a specified size

# File size comparison operators
b # Size in bytes
k # Size in kilobytes
M # Size in megabytes
G # Size in gigabytes

# File permissions
chmod # Change file permissions
chown # Change file ownership
chgrp # Change file group ownership

# File permissions functions
getfacl # Get file access control list (ACL)
setfacl # Set file access control list (ACL)
getfattr # Get file attributes
setfattr # Set file attributes


# File permissions comparison operators
-o # File exists and is owned by the current user
-G # File exists and is owned by the current group
-L # File exists and is a symbolic link
-p # File exists and is a named pipe
-S # File exists and is a socket
-h # File exists and is a symbolic link (same as -L)
-t # File exists and is a terminal device

-b # File exists and is a block device
-c # File exists and is a character device
-u # File exists and has an SUID bit set
-k # File exists and has an SGID bit set
-O # File exists and is owned by the current user

-F # File exists and is a file (not a directory, symbolic link, etc.)

-ef # Two file descriptors refer to the same file

# File test operators
-nt # File is newer than the reference file
-ot # File is older than the reference file
-ef # Two file names refer to the same file
-cnewer # File is newer than the reference file or its contents have been changed
-colder # File is older than the reference file or its contents have been changed
-mnewer # File is newer than the reference file or its modification time has been changed
-omnewer # File is older than the reference file or its modification time has been changed
-size # File size is greater than, equal to, or less than a specified size

