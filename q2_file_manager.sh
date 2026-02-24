#!/bin/bash
# q2_file_manager.sh
# This script gives a menu to manage files and folders.
# It runs in a loop until user chooses exit.

while true
do
    echo ""
    echo "===== FILE & DIRECTORY MANAGER ====="
    echo "1. List files"
    echo "2. Create directory"
    echo "3. Create file"
    echo "4. Delete file"
    echo "5. Rename file"
    echo "6. Search for file"
    echo "7. Count files and directories"
    echo "8. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            ls -lh
            ;;
        2)
            read -p "Enter directory name: " dname
            mkdir -p "$dname"
            echo "Directory created."
            ;;
        3)
            read -p "Enter file name: " fname
            touch "$fname"
            echo "File created."
            ;;
        4)
            read -p "Enter file name to delete: " fname
            if [ -f "$fname" ]; then
                rm -i "$fname"
            else
                echo "File does not exist."
            fi
            ;;
        5)
            read -p "Old file name: " oldname
            read -p "New file name: " newname
            if [ -f "$oldname" ]; then
                mv "$oldname" "$newname"
                echo "File renamed."
            else
                echo "File not found."
            fi
            ;;
        6)
            read -p "Enter file name to search: " search
            find . -name "*$search*"
            ;;
        7)
            echo "Total files: $(find . -type f | wc -l)"
            echo "Total directories: $(find . -type d | wc -l)"
            ;;
        8)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done

