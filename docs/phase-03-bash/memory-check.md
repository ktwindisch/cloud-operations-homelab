# Memory Check Script

## Purpose

The `memory-check.sh` script checks memory availability on atlas and reports whether available memory is above or below a defined threshold.

This script was created as part of Phase 3 Bash Automation.

## Script Location

```text
automation/memory-check.sh
```

## What the Script Checks

The script checks:

- Total memory
- Used memory
- Available memory
- Used memory percentage
- Available memory percentage

## Threshold

The minimum available memory threshold is currently set to:

```text
20%
```

If available memory is above 20%, the script reports OK.

If available memory drops below 20%, the script reports a warning and exits with a non-zero status.

## Commands Used

The script uses:

```bash
free -m
awk
echo
if
exit
```

## Script Logic

The script collects memory information using `free -m`.

It extracts:

- total memory
- used memory
- available memory

Then it calculates:

- used memory percentage
- available memory percentage

Finally, it compares available memory percentage against the configured threshold.

## Test Environment

| Item | Value |
|------|-------|
| Server | atlas |
| Operating system | Ubuntu 26.04 LTS |
| Minimum available memory threshold | 20% |
| Test method | Script copied to atlas and executed locally |
| Access method | SSH using `ssh atlas` |

## Test Result

The script ran successfully on atlas.

Verified output included:

| Check | Result |
|------|--------|
| Total memory | 15177 MB |
| Used memory | 534 MB |
| Available memory | 14642 MB |
| Used memory percentage | 3% |
| Available memory percentage | 96% |
| Threshold | 20% |
| Status | OK |
| Exit code | 0 |

## Exit Codes

| Exit Code | Meaning |
|----------|---------|
| 0 | Available memory is above the warning threshold |
| 1 | Available memory is below the warning threshold |

## Why This Matters

Memory availability is an important operational signal.

If available memory becomes too low, applications can slow down, services may fail, swap usage may increase, and system performance can degrade.

This script creates a simple repeatable memory check that can later be improved, scheduled, logged, or connected to monitoring.

## Current Status

`memory-check.sh` has been created, tested on atlas, and verified successfully.