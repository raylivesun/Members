#!/home/admin/app/PowerShell/Members

# tree folder structure members/users/
# members/users/user1/
# members/users/user1/documents/
# members/users/user1/pictures/
# members/users/user2/
# members/users/user2/documents/
# members/users/user2/pictures/

# Get the total number of files in the "documents" folder and the "pictures" folder
total_documents=$(find members/users -type f -name '*.pdf' -exec wc -l {} \; | awk '{s+=$1} END {print s}')
total_pictures=$(find members/users -type f -name '*.jpg' -exec wc -l {} \; | awk '{s+=$1} END {print s}')

# Calculate the total size of the "documents" folder and the "pictures" folder in MB
total_documents_size=$(du -sm members/users/ | awk '{print $1}')
total_pictures_size=$(du -sm members/users/ | awk '{print $1}')

# Calculate the percentage of the total size occupied by the "documents" folder
documents_percentage=$(echo "scale=2; ($total_documents_size / ($total_documents_size + $total_pictures_size)) * 100" | bc)

# Print the results
Write-Output "Total number of PDF documents: $total_documents"
Write-Output "Total number of JPEG pictures: $total_pictures"
Write-Output "Total size of documents folder: $total_documents_size MB"
Write-Output "Total size of pictures folder: $total_pictures_size MB"
Write-Output "Percentage of total size occupied by documents: $documents_percentage%"
