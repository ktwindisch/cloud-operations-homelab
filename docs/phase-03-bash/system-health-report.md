# System Health Report Script

## Purpose

The `system-health.sh` script generates a basic system health report for atlas.

This script was created as the first Bash automation task in Phase 3.

The goal is to collect common server health information without manually running several commands one at a time.

## Script Location

```text
automation/system-health.sh
```

## What the Script Checks

The script reports:

- Current date and time
- Hostname
- System uptime
- Operating system version
- Kernel version
- IP address information
- Root filesystem disk usage
- Memory usage
- SSH service status

## Commands Used

The script uses the following Linux commands:

```bash
date
hostname
uptime -p
lsb_release -ds
uname -r
hostname -I
df -h /
free -h
systemctl is-active --quiet ssh
```

## Test Environment

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Kernel | 7.0.0-27-generic |
| Test method | Script copied to atlas and executed locally |
| Access method | SSH using `ssh atlas` |

## Test Result

The script ran successfully on atlas.

Verified output included:

| Check | Result |
|------|--------|
| Hostname | atlas |
| OS | Ubuntu 26.04 LTS |
| Kernel | 7.0.0-27-generic |
| Root disk usage | 8% |
| SSH service | Active |
| Script status | Successful |

## SSH Service Logic

The script checks whether the SSH service is active.

If SSH is running, it prints:

```text
SSH service is active.
```

If SSH is not active, it prints a warning message.

## Why This Matters

This script creates a repeatable way to collect basic server health information.

Instead of manually running several separate commands, the script provides one quick operational report.

This is a small but important step toward automation and operational consistency.

## Current Status

`system-health.sh` has been created, tested on atlas, and verified successfully.