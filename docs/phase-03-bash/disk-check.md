# Disk Check Script

## Purpose

The `disk-check.sh` script checks root filesystem disk usage on atlas and reports whether usage is below or above a defined warning threshold.

This script was created as part of Phase 3 Bash Automation.

## Script Location

```text
automation/disk-check.sh
```

## What the Script Checks

The script checks disk usage for:

```text
/
```

This is the root filesystem on atlas.

## Threshold

The warning threshold is currently set to:

```text
80%
```

If disk usage is below 80%, the script reports OK.

If disk usage is 80% or higher, the script reports a warning and exits with a non-zero status.

## Commands Used

The script uses:

```bash
df -h /
awk
tr
echo
if
exit
```

## Script Logic

The script collects disk information using `df -h /`.

It extracts:

- disk size
- disk used
- disk available
- disk usage percentage

Then it compares the usage percentage against the configured threshold.

## Test Environment

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Filesystem checked | `/` |
| Warning threshold | 80% |
| Test method | Script copied to atlas and executed locally |
| Access method | SSH using `ssh atlas` |

## Test Result

The script ran successfully on atlas.

Verified output included:

| Check | Result |
|------|--------|
| Disk size | 98G |
| Disk used | 7.1G |
| Disk available | 86G |
| Disk usage | 8% |
| Threshold | 80% |
| Status | OK |
| Exit code | 0 |

## Exit Codes

| Exit Code | Meaning |
|----------|---------|
| 0 | Disk usage is below the warning threshold |
| 1 | Disk usage is at or above the warning threshold |

## Why This Matters

Disk usage is a basic but important operational signal.

If a server runs out of disk space, services can fail, logs may stop writing, updates may fail, and troubleshooting becomes harder.

This script creates a simple repeatable check that can later be improved, scheduled, logged, or connected to monitoring.

## Current Status

`disk-check.sh` has been created, tested on atlas, and verified successfully.