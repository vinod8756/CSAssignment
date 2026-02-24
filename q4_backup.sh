
#!/bin/bash
# q4_backup.sh
# This script creates backup of a directory.
# User can choose simple copy or compressed archive.
# It also shows backup size and time taken.

echo "================================="
echo "      AUTOMATED BACKUP SCRIPT    "
echo "================================="

read -p "Enter directory to backup: " source
read -p "Enter backup destination: " destination

if [ ! -d "$source" ]; then
    echo "Source directory does not exist."
    exit 1
fi

mkdir -p "$destination"

echo "Backup Type:"
echo "1. Simple copy"
echo "2. Compressed archive (tar.gz)"
read -p "Enter choice: " type

timestamp=$(date +"%Y%m%d_%H%M%S")
START=$(date +%s)

if [ "$type" -eq 1 ]; then
    backupfile="$destination/backup_$timestamp"
    cp -r "$source" "$backupfile"
elif [ "$type" -eq 2 ]; then
    backupfile="$destination/backup_$timestamp.tar.gz"
    tar -czf "$backupfile" "$source"
else
    echo "Invalid choice."
    exit 1
fi

END=$(date +%s)
DURATION=$((END - START))

if [ $? -eq 0 ]; then
    echo ""
    echo "Backup completed successfully!"
    echo "File: $backupfile"
    echo "Size: $(du -sh "$backupfile" | cut -f1)"
    echo "Time taken: $DURATION seconds"
else
    echo "Backup failed."
fi

