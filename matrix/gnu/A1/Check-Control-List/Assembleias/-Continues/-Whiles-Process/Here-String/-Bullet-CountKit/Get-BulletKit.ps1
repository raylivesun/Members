#!/home/admin/app/PowerShell/Members

# Bullet Hall Configuration File Generator Kits
#
# This script generates a configuration file for the Bullet Hall project.
#
# Usage:
#   sh generate_config.sh <path_to_bullet_hall_directory> <output_file>
#
# Example:
#   sh generate_config.sh /home/admin/bullet_hall /home/admin/bullet_hall_config.txt

function GetBulletHallRain {

    $ConfirmPreference = "StartRain"
    $RainPath = "/home/admin/bullet_hall/Rain/Rain.exe"

   Register-ArgumentCompleter $RainPath   
}