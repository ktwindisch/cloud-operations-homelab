#!/usr/bin/env bash

# disk-check.sh
# Purpose: Check root filesystem disk usage on atlas and report status.

THRESHOLD=80
FILESYSTEM="/"

echo "======================================"
echo " Cloud Operations Homelab Disk Check"
echo "======================================"
echo

echo "Filesystem checked: $FILESYSTEM"
echo "Warning threshold: ${THRESHOLD}%"
echo

DISK_USAGE=$(df -h "$FILESYSTEM" | awk 'NR==2 {print $5}' | tr -d '%')
DISK_SIZE=$(df -h "$FILESYSTEM" | awk 'NR==2 {print $2}')
DISK_USED=$(df -h "$FILESYSTEM" | awk 'NR==2 {print $3}')
DISK_AVAILABLE=$(df -h "$FILESYSTEM" | awk 'NR==2 {print $4}')

echo "Disk size: $DISK_SIZE"
echo "Disk used: $DISK_USED"
echo "Disk available: $DISK_AVAILABLE"
echo "Disk usage: ${DISK_USAGE}%"
echo

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is at or above ${THRESHOLD}%."
    echo "Action should be taken to review disk usage."
    exit 1
else
    echo "OK: Disk usage is below ${THRESHOLD}%."
    exit 0
fi
EOF
