#!/usr/bin/env bash

# memory-check.sh
# Purpose: Check memory availability on atlas and report status.

MIN_AVAILABLE_PERCENT=20

echo "======================================"
echo " Cloud Operations Homelab Memory Check"
echo "======================================"
echo

TOTAL_MEMORY=$(free -m | awk '/^Mem:/ {print $2}')
USED_MEMORY=$(free -m | awk '/^Mem:/ {print $3}')
AVAILABLE_MEMORY=$(free -m | awk '/^Mem:/ {print $7}')

AVAILABLE_PERCENT=$((AVAILABLE_MEMORY * 100 / TOTAL_MEMORY))
USED_PERCENT=$((USED_MEMORY * 100 / TOTAL_MEMORY))

echo "Total memory: ${TOTAL_MEMORY} MB"
echo "Used memory: ${USED_MEMORY} MB"
echo "Available memory: ${AVAILABLE_MEMORY} MB"
echo "Used memory percentage: ${USED_PERCENT}%"
echo "Available memory percentage: ${AVAILABLE_PERCENT}%"
echo
echo "Minimum available memory threshold: ${MIN_AVAILABLE_PERCENT}%"
echo

if [ "$AVAILABLE_PERCENT" -lt "$MIN_AVAILABLE_PERCENT" ]; then
    echo "WARNING: Available memory is below ${MIN_AVAILABLE_PERCENT}%."
    echo "Action should be taken to review memory usage."
    exit 1
else
    echo "OK: Available memory is above ${MIN_AVAILABLE_PERCENT}%."
    exit 0
fi