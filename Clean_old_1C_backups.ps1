# FIRST ITERATION
# If the backups directory is older than a month, deletes all backups with odd dates (03, 05, 07, 09, 13, 15, 17, 19, 23, 25, 27, 29)
# Backups name example: backupname-26.09.2021.bak
# Gets the current date and subtracts 30 days
$date = [datetime]::now.AddDays(-30)

# Recursively gets all files with the required extension from the backups directory
Get-ChildItem -Path D:\backups\* -Include *.BACKUP-EXTENSION-NAME -Recurse -Force | `

# Subtracts files that are not older than 30 days
Where-Object { $_.LastWriteTime -lt $date } | `

# Subtracts files that are odd
Where-Object {($_.name -match '.*(\d(1|3|5|7|9))\.\d\d\.\d\d\d\d\.BACKUP-EXTENSION-NAME')} | `

# ECHO DEBUG
#% {Write-Host $_.FullName} 
# Deletes recieved list of iles
Remove-Item

# SECOND ITERATION
# If the backups directory is older than 3 months, leaves only one backup per week
# Gets the current date and subtracts 90 days
$date = [datetime]::now.AddDays(-90)

# Recursively gets all files with the required extension from the backups directory
Get-ChildItem -Path D:\backups\* -Include *.BACKUP-EXTENSION-NAME -Recurse -Force | `

# Subtracts files that are not older than 90 days
Where-Object { $_.LastWriteTime -lt $date } | `

# Subtracts files that are not named at specified dates
Where-Object {($_.name -notmatch '.*(01|08|15|22|28)\.\d\d\.\d\d\d\d\.BACKUP-EXTENSION-NAME')} | `

# ECHO DEBUG
#% {Write-Host $_.FullName} 
# Deletes recieved list of iles
Remove-Item
