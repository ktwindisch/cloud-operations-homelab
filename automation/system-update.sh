#!/usr/bin/env bash

# system-update.sh
# Purpose: Assist with safe system updates on atlas.

echo "======================================"
echo " Cloud Operations Homelab System Update"
echo "======================================"
echo

echo "This script will help check and apply system package updates."
echo "It will ask for confirmation before upgrading packages or removing unused packages."
echo

echo "Step 1: Refreshing package lists..."
sudo apt-get update
echo

echo "Step 2: Checking available upgrades..."
PAGER=cat apt list --upgradable
echo

read -r -p "Do you want to apply available upgrades? [y/N]: " APPLY_UPGRADES

if [[ "$APPLY_UPGRADES" =~ ^[Yy]$ ]]; then
    echo
    echo "Applying upgrades..."
    sudo apt-get upgrade -y
else
    echo
    echo "Skipping package upgrades."
fi

echo
read -r -p "Do you want to remove unused packages with autoremove? [y/N]: " APPLY_AUTOREMOVE

if [[ "$APPLY_AUTOREMOVE" =~ ^[Yy]$ ]]; then
    echo
    echo "Removing unused packages..."
    sudo apt-get autoremove -y
else
    echo
    echo "Skipping autoremove."
fi

echo
echo "System update helper complete."