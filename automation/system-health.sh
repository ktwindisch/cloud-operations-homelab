#!/usr/bin/env bash

# system-health.sh
# Purpose: Generate a basic system health report for atlas.

echo "======================================"
echo " Cloud Operations Homelab Health Report"
echo "======================================"
echo

echo "Generated At:"
date
echo

echo "Hostname:"
hostname
echo

echo "Uptime:"
uptime -p
echo

echo "Operating System:"
lsb_release -ds
echo

echo "Kernel Version:"
uname -r
echo

echo "IP Address:"
hostname -I
echo

echo "Disk Usage:"
df -h /
echo

echo "Memory Usage:"
free -h
echo

echo "SSH Service Status:"
if systemctl is-active --quiet ssh; then
    echo "SSH service is active."
else
    echo "WARNING: SSH service is not active."
fi

echo
echo "Health report complete."