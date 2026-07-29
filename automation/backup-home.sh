#!/usr/bin/env bash

# backup-home.sh
# Purpose: Create a timestamped backup of a safe test directory on atlas.

SOURCE_DIR="$HOME/homelab-backup-source"
BACKUP_DIR="$HOME/homelab-backups"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_FILE="$BACKUP_DIR/home-backup-$TIMESTAMP.tar.gz"

echo "======================================"
echo " Cloud Operations Homelab Backup Script"
echo "======================================"
echo

echo "Source directory: $SOURCE_DIR"
echo "Backup directory: $BACKUP_DIR"
echo "Backup file: $BACKUP_FILE"
echo

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist. Creating test source directory..."
    mkdir -p "$SOURCE_DIR"
    echo "This is a test file for the Cloud Operations Homelab backup script." > "$SOURCE_DIR/README.txt"
    echo "Created test file: $SOURCE_DIR/README.txt"
    echo
fi

echo "Creating backup directory if needed..."
mkdir -p "$BACKUP_DIR"
echo

echo "Creating compressed backup archive..."
if tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .; then
    echo "Backup archive created successfully."
else
    echo "ERROR: Backup archive creation failed."
    exit 1
fi

echo
echo "Verifying backup archive..."
if tar -tzf "$BACKUP_FILE" > /dev/null; then
    echo "Backup archive verification successful."
else
    echo "ERROR: Backup archive verification failed."
    exit 1
fi

echo
echo "Backup details:"
ls -lh "$BACKUP_FILE"

echo
echo "Backup complete."
exit 0