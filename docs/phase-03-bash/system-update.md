# System Update Helper Script

## Purpose

The `system-update.sh` script assists with safe package update checks on atlas.

This script was created as part of Phase 3 Bash Automation.

Unlike the health, disk, and memory scripts, this script can interact with package management. Because of that, it uses confirmation prompts before applying upgrades or removing unused packages.

## Script Location

```text
automation/system-update.sh
```

## What the Script Does

The script performs the following steps:

1. Refreshes package lists with `sudo apt-get update`
2. Shows available package upgrades
3. Asks whether upgrades should be applied
4. Asks whether unused packages should be removed with `autoremove`
5. Exits cleanly after the selected actions are complete

## Commands Used

The script uses:

```bash
sudo apt-get update
PAGER=cat apt list --upgradable
sudo apt-get upgrade -y
sudo apt-get autoremove -y
read
if
echo
```

## Safety Design

The script does not automatically upgrade packages.

It asks for confirmation before running:

```bash
sudo apt-get upgrade -y
```

It also asks for confirmation before running:

```bash
sudo apt-get autoremove -y
```

This keeps the script useful while avoiding blind system changes.

## Pager Fix

During the first test, the upgrade list opened in a paged view, which required pressing Enter to move through the output.

To fix this, the script was updated from:

```bash
apt list --upgradable
```

to:

```bash
PAGER=cat apt list --upgradable
```

This forces the package list to print normally without pausing in a pager.

## Test Environment

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Test method | Script copied to atlas and executed locally |
| Access method | SSH using `ssh atlas` |
| Upgrade action during test | Skipped |
| Autoremove action during test | Skipped |

## Test Result

The script ran successfully on atlas.

Verified behavior included:

| Check | Result |
|------|--------|
| Package list refresh | Successful |
| Available upgrades listed | Successful |
| Upgrade confirmation prompt | Working |
| Autoremove confirmation prompt | Working |
| User selected upgrades | No |
| User selected autoremove | No |
| Script completion | Successful |
| Pager issue | Fixed |

## Why This Matters

System updates are a normal part of Linux server maintenance.

This script creates a repeatable update helper while still requiring human confirmation before making package changes.

That makes it safer than blindly automating upgrades.

## Current Status

`system-update.sh` has been created, tested on atlas, improved, and verified successfully.